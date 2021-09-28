import 'package:flutter/material.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Link extends StatefulWidget {
  Link({Key? key}) : super(key: key);

  @override
  State<Link> createState() => _LinkState();
}

class _LinkState extends State<Link> {
  final GlobalKey<ExpansionTileCardState> cardA = new GlobalKey();
  final GlobalKey<ExpansionTileCardState> cardB = new GlobalKey();
  final GlobalKey<ExpansionTileCardState> cardC = new GlobalKey();
  final GlobalKey<ExpansionTileCardState> cardD = new GlobalKey();

  @override
  Widget build(BuildContext context) {
    CollectionReference _listurl =
        FirebaseFirestore.instance.collection("list_url");
    final ButtonStyle flatButtonStyle = TextButton.styleFrom(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(4.0)),
      ),
    );
    return Scaffold(
      appBar: AppBar(
        title: Text('Bar URL'),
      ),
      body: ListView(
        children: <Widget>[
          FutureBuilder<QuerySnapshot>(
            future: _listurl.get(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Scaffold(
                  body: Center(
                    child: Text("Error: ${snapshot.error}"),
                  ),
                );
              }

              if (snapshot.connectionState == ConnectionState.done) {
                //Display the data inside a list view
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: ExpansionTileCard(
                    key: cardA,
                    title: Text('World Wide Web '),
                    subtitle: Text('สวนสัตว์เชียงใหม่'),
                    children: <Widget>[
                      Divider(
                        thickness: 1.0,
                        height: 1.0,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16.0,
                            vertical: 8.0,
                          ),
                          child: Text("เว็บของสวนสัตว์เชียงใหม่"),
                        ),
                      ),
                      ButtonBar(
                        alignment: MainAxisAlignment.spaceAround,
                        buttonHeight: 52.0,
                        buttonMinWidth: 90.0,
                        children: snapshot.data!.docs.map(
                          (document) {
                            return TextButton(
                              style: flatButtonStyle,
                              onPressed: () {
                                launch("${document['url']}");
                              },
                              child: Column(
                                children: <Widget>[
                                  Icon(Icons.search),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 2.0),
                                  ),
                                  Text('Open'),
                                ],
                              ),
                            );
                          },
                        ).toList(),
                      ),
                    ],
                  ),
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
}
