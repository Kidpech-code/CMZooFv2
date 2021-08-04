import 'package:cmzoofv2/responsive.dart';
import 'package:cmzoofv2/ui/animaldata/mammals_page.dart';
import 'package:cmzoofv2/ui/pages/animal/show/show_amphibian/amphibian.dart';
import 'package:cmzoofv2/ui/pages/animal/show/show_poultry/poultry.dart';
import 'package:cmzoofv2/ui/pages/animal/show/show_reptiles/reptiles.dart';
import 'package:flutter/material.dart';

class ShowTypeBotton extends StatefulWidget {
  const ShowTypeBotton({Key? key}) : super(key: key);

  @override
  _ShowTypeBottonState createState() => _ShowTypeBottonState();
}

class _ShowTypeBottonState extends State<ShowTypeBotton> {
  
  void mammalsPage() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => ListMammals()));
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
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          children: [
            Container(
              height: isTab(context) ? 155 : 50,
              child: ListView(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                children: [
                  showBottonTypeanimal(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
