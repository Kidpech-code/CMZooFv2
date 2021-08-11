import 'package:cmzoofv2/responsive.dart';
import 'package:cmzoofv2/ui/animaldata/mammals_page.dart';
import 'package:cmzoofv2/ui/pages/animal/show/show_amphibian/amphibian.dart';
import 'package:cmzoofv2/ui/pages/animal/show/show_poultry/poultry.dart';
import 'package:cmzoofv2/ui/pages/animal/show/show_reptiles/reptiles.dart';
import 'package:cmzoofv2/ui/video/video_page.dart';
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

  void videoPage() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => VideoPage()));
  }

  Widget mammalButton() {
    // ignore: deprecated_member_use
    return Container(
      width: 60,
      height: 60,
      // ignore: deprecated_member_use
      child: FlatButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
          side: BorderSide(
            color: Colors.black12,
          ),
        ),
        padding: EdgeInsets.all(8),
        color: Colors.white,
        child: Image.asset("images/icon_lion.png"),
        onPressed: () {
          mammalsPage();
        },
        
      ),
      
    );
  }

  Widget amphibianButton() {
    return Container(
      width: 60,
      height: 60,
      // ignore: deprecated_member_use
      child: FlatButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
          side: BorderSide(
            color: Colors.black12,
          ),
        ),
        padding: EdgeInsets.all(8),
        color: Colors.white,
        child: Image.asset("images/icon_snake.png"),
        onPressed: () {
          amphibianPage();
        },
      ),
    );
  }

  Widget poultryButton() {
    return Container(
      width: 60,
      height: 60,
      // ignore: deprecated_member_use
      child: FlatButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
          side: BorderSide(
            color: Colors.black12,
          ),
        ),
        padding: EdgeInsets.all(8),
        color: Colors.white,
        child: Image.asset("images/icon_parrot.png"),
        onPressed: () {
          poultryPage();
        },
      ),
    );
  }

  Widget reptilesButton() {
    return Container(
      width: 60,
      height: 60,
      // ignore: deprecated_member_use
      child: FlatButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
          side: BorderSide(
            color: Colors.black12,
          ),
        ),
        padding: EdgeInsets.all(8),
        color: Colors.white,
        child: Image.asset("images/icon_turtle.png"),
        onPressed: () {
          reptilesPage();
        },
      ),
    );
  }

  Widget arButton() {
    return Container(
      width: 60,
      height: 60,
      // ignore: deprecated_member_use
      child: FlatButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
          side: BorderSide(
            color: Colors.black12,
          ),
        ),
        padding: EdgeInsets.all(8),
        color: Colors.white,
        child: Image.asset("images/icon_ar.png"),
        onPressed: () {},
      ),
    );
  }

  Widget videoButton() {
    return Container(
      width: 60,
      height: 60,
      // ignore: deprecated_member_use
      child: FlatButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
          side: BorderSide(
            color: Colors.black12,
          ),
        ),
        padding: EdgeInsets.all(8),
        color: Colors.white,
        child: Image.asset("images/icon_video.png"),
        onPressed: () {
          videoPage();
        },
      ),
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
        padding: isLandscape(context)
            ? EdgeInsets.symmetric(vertical: 20, horizontal: 50)
            : EdgeInsets.all(10),
        child: Column(
          children: [
            Container(
              height: 80,
              child: GridView(
                physics: BouncingScrollPhysics(),
                padding: EdgeInsets.symmetric(horizontal: 12),
                scrollDirection: Axis.horizontal,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1),
                children: [
                  // showBottonTypeanimal(),
                  mammalButton(),
                  amphibianButton(),
                  poultryButton(),
                  reptilesButton(),
                  arButton(),
                  videoButton(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
