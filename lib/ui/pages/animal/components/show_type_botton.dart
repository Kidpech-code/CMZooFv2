import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cmzoofv2/responsive.dart';
import 'package:cmzoofv2/ui/pages/animal/show/show_amphibian/amphibian_page.dart';
import 'package:cmzoofv2/ui/pages/animal/show/show_mammals/mammals_page.dart';
import 'package:cmzoofv2/ui/pages/animal/show/show_poultry/poultry_page.dart';
import 'package:cmzoofv2/ui/pages/animal/show/show_reptiles/reptiles_page.dart';
import 'package:cmzoofv2/ui/video/video_page.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ShowTypeBotton extends StatefulWidget {
  const ShowTypeBotton({Key? key}) : super(key: key);

  @override
  _ShowTypeBottonState createState() => _ShowTypeBottonState();
}

class _ShowTypeBottonState extends State<ShowTypeBotton> {
  CollectionReference _link_ar =
      FirebaseFirestore.instance.collection("link_ar");

  void mammalsPage() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => ListMammals()));
  }

  void amphibianPage() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => ListAmphibian()));
  }

  void poultryPage() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => ListPoultry()));
  }

  void reptilesPage() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => ListReptiles()));
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
      child: Column(
        children: <Widget>[
          FutureBuilder<QuerySnapshot>(
            future: _link_ar.get(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Scaffold(
                  body: Center(
                    child: Text("Error: ${snapshot.error}"),
                  ),
                );
              }

              if (snapshot.connectionState == ConnectionState.done) {
                return Stack(
                  children: snapshot.data!.docs.map(
                    (document) {
                      return Container(
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
                          onPressed: () {
                            launch("${document['url']}");
                          },
                        ),
                      );
                    },
                  ).toList(),
                );
              }

              return Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            },
          ),
        ],
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
                  //amphibianButton(),
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
