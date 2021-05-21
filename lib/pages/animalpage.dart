import 'package:cmzoofv2/animaldata/amphibian.dart';
import 'package:cmzoofv2/animaldata/mammals.dart';
import 'package:cmzoofv2/animaldata/poultry.dart';
import 'package:cmzoofv2/animaldata/reptiles.dart';
//import 'package:cmzoofv2/ar/ar_core.dart';
import 'package:cmzoofv2/animaldata/animaldata.dart';
import 'package:flutter/material.dart';

class AnimalPage extends StatefulWidget {
  @override
  _AnimalPageState createState() => _AnimalPageState();
}

class _AnimalPageState extends State<AnimalPage> {
  List<AnimalData> ranimal = rareanimal();

  void mammalsPage() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => MammalsPage()));
  }

  void amphibianPage() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => AmphibianPage()));
  }

  void poultryPage() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => PoultryPage()));
  }

  void reptilesPage() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => ReptilesPage()));
  }

  Widget mammalButton() {
    // ignore: deprecated_member_use
    return RaisedButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      color: Colors.green[700],
      child: Text(
        "สัตว์เลี้ยงลูกด้วยนม",
        style: TextStyle(
          color: Colors.white,
          fontSize: 15.0,
          fontWeight: FontWeight.w600,
          fontFamily: 'mitr',
        ),
      ),
      onPressed: () {
        mammalsPage();
      },
    );
  }

  Widget amphibianButton() {
    // ignore: deprecated_member_use
    return RaisedButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      color: Colors.amber[700],
      child: Text(
        "สัตว์เลื้อยคลาน",
        style: TextStyle(
          color: Colors.white,
          fontSize: 15.0,
          fontWeight: FontWeight.w600,
          fontFamily: 'mitr',
        ),
      ),
      onPressed: () {
        amphibianPage();
      },
    );
  }

  Widget poultryButton() {
    // ignore: deprecated_member_use
    return RaisedButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      color: Colors.purple[700],
      child: Text(
        "สัตว์ปีก",
        style: TextStyle(
          color: Colors.white,
          fontSize: 15.0,
          fontWeight: FontWeight.w600,
          fontFamily: 'mitr',
        ),
      ),
      onPressed: () {
        poultryPage();
      },
    );
  }

  Widget reptilesButton() {
    // ignore: deprecated_member_use
    return RaisedButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      color: Colors.red[700],
      child: Text(
        "สัตว์สะเทินน้ำสะเทินบก",
        style: TextStyle(
          color: Colors.white,
          fontSize: 15.0,
          fontWeight: FontWeight.w600,
          fontFamily: 'mitr',
        ),
      ),
      onPressed: () {
        reptilesPage();
      },
    );
  }

  Widget showBottonTypeanimal() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        mammalButton(),
        SizedBox(
          width: 5,
        ),
        amphibianButton(),
        SizedBox(
          width: 5,
        ),
        poultryButton(),
        SizedBox(
          width: 5,
        ),
        reptilesButton(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreen[100],
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.lightGreen[900],
        title: Text(
          'ประเภทของสัตว์',
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'mitr',
          ),
        ),
        actions: [
          /*IconButton(
            icon: Icon(Icons.camera),
            onPressed: () {
              //Navigator.of(context).pop();
              MaterialPageRoute route = MaterialPageRoute(
                  builder: (BuildContext context) => ARcore());
              Navigator.push(context, route);
            },
          ),*/
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 5.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.green[100],
                prefixIcon: Icon(Icons.search),
                contentPadding: EdgeInsets.all(8.0),
                hintText: "Search your Animals in Zoo... ",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            SizedBox(
              height: 8.0,
            ),
            Text(
              "ประเภทของสัตว์",
              style: TextStyle(
                color: Colors.green[900],
                fontSize: 22.0,
                fontWeight: FontWeight.w600,
                fontFamily: 'mitr',
              ),
            ),
            SizedBox(
              height: 1.0,
            ),
            Container(
              height: 50,
              child: ListView(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                children: [
                  showBottonTypeanimal(),
                ],
              ),
            ),
            SizedBox(
              height: 1.0,
            ),
            Text(
              "สัตว์หายาก",
              style: TextStyle(
                color: Colors.green[900],
                fontSize: 22.0,
                fontWeight: FontWeight.w600,
                fontFamily: 'mitr',
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Container(
              width: double.infinity,
              height: 536,
              child: ListView(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                children: rareanimals(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> rareanimals() {
    List<Widget> list = [];
    for (var i = 0; i < ranimal.length; i++) {
      list.add(listAnimal(ranimal[i]));
    }
    return list;
  }

  Widget listAnimal(AnimalData ranimal) {
    return GestureDetector(
      child: Container(
        width: 300.0,
        margin: EdgeInsets.only(right: 12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              ranimal.animalName,
              style: TextStyle(
                fontSize: 16.5,
                fontWeight: FontWeight.bold,
                fontFamily: 'mitr',
              ),
            ),
            SizedBox(height: 5.0),
            Container(
              height: 508.0,
              width: 300.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                image: DecorationImage(
                  image: AssetImage(ranimal.animalImg),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
