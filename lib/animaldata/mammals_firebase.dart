import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cmzoofv2/animaldata/mammalsdata_firebase.dart';
import 'package:cmzoofv2/animaldata/typemammal_firebase.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class ShowmammalsList extends StatefulWidget {
  const ShowmammalsList({Key? key}) : super(key: key);

  @override
  _ShowmammalsListState createState() => _ShowmammalsListState();
}

class _ShowmammalsListState extends State<ShowmammalsList> {
  List<Widget> widgets = [];
  List<MammalFirebase> mammalFBModels = [];

  @override
  void initState() {
    super.initState();
    readData();
  }

  Future<Null> readData() async {
    await Firebase.initializeApp().then((value) async {
      print('initialize Success');
      await FirebaseFirestore.instance
          .collection('listmammals')
          .orderBy('nameth')
          .snapshots()
          .listen((event) {
        print('snapshot = ${event.docs}');
        int index = 0;
        for (var snapshots in event.docs) {
          Map<String, dynamic> map = snapshots.data();
          print('map = $map');
          MammalFirebase model = MammalFirebase.fromMap(map);
          mammalFBModels.add(model);
          print('name = ${model.nameth}');
          setState(() {
            widgets.add(createWidget(model, index));
          });
          index++;
        }
      });
    });
  }

  Widget createWidget(MammalFirebase model, int index) => GestureDetector(
        onTap: () {
          print('You Click from index = $index');
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ShowDatamammalFB(
                  mammalFBModel: mammalFBModels[index],
                ),
              ));
        },
        child: Card(
          elevation: 4.0,
          color: Colors.green[800],
          clipBehavior: Clip.antiAlias,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            ),
          ),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: NetworkImage(model.cover),
                        fit: BoxFit.cover,
                      )),
                  //child: Image.network(model.cover),
                ),
                Text(
                  model.nameth,
                  style: TextStyle(
                    color: Colors.grey[200],
                  ),
                ),
                Text(
                  model.nameeng,
                  style: TextStyle(
                    color: Colors.grey[200],
                  ),
                ),
              ],
            ),
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreen[100],
      appBar: AppBar(
        centerTitle: true,
        //automaticallyImplyLeading: false,
        backgroundColor: Colors.lightGreen[900],
        title: Text(
          'สัตว์เลี้ยงลูกด้วยนม',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'mitr',
          ),
        ),
      ),
      body: widgets.length == 0
          ? Center(child: CircularProgressIndicator())
          : GridView.extent(maxCrossAxisExtent: 215, children: widgets),
    );
  }
}
