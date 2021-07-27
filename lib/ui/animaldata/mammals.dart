import 'package:cmzoofv2/service/data/animaldata.dart';
import 'package:cmzoofv2/ui/animaldata/typemammal.dart';
import 'package:flutter/material.dart';

class MammalsPage extends StatefulWidget {
  @override
  _MammalsPageState createState() => _MammalsPageState();
}

class _MammalsPageState extends State<MammalsPage> {
  List<Mammals> mammalanimal = mammal();
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 5.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                height: 900,
                child: ListView(
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  children: typemammal(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> typemammal() {
    List<Widget> list = [];
    for (var i = 0; i < mammalanimal.length; i++) {
      list.add(listAnimal(mammalanimal[i]));
    }
    return list;
  }

  Widget listAnimal(Mammals mammalanimal) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => TypeMammal(mammals: mammalanimal),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.green[700],
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),
        ),
        height: 120.0,
        width: 255.0,
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.only(right: 15.0, left: 15.0, bottom: 15.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 5.0),
            Card(
              elevation: 4.0,
              margin: EdgeInsets.all(0),
              clipBehavior: Clip.antiAlias,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(15),
                ),
              ),
              child: Container(
                height: 115.0,
                width: 115.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  image: DecorationImage(
                    image: AssetImage(mammalanimal.mammalsImg),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            SizedBox(width: 12.0),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  mammalanimal.mammalsname,
                  style: TextStyle(
                    color: Colors.grey[200],
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'mitr',
                  ),
                ),
                Row(
                  children: [
                    Text(
                      mammalanimal.mammalsnameENG,
                      style: TextStyle(
                        color: Colors.green[200],
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'mitr',
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
