import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cmzoofv2/responsive.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';

class ZonePlaces extends StatefulWidget {
  const ZonePlaces({Key? key}) : super(key: key);

  @override
  State<ZonePlaces> createState() => _ZonePlacesState();
}

class _ZonePlacesState extends State<ZonePlaces> {
  CollectionReference _zone =
      FirebaseFirestore.instance.collection("list_zone");

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          FutureBuilder<QuerySnapshot>(
            future: _zone.get(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Scaffold(
                  body: Center(
                    child: Text("Error: ${snapshot.error}"),
                  ),
                );
              }

              if (snapshot.connectionState == ConnectionState.done) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 12.0, vertical: 12),
                  child: Column(
                    verticalDirection: VerticalDirection.up,
                    children: snapshot.data!.docs.map(
                      (document) {
                        return ExpansionTileCard(
                          expandedTextColor: Colors.teal,
                          title: Text(
                            document['title'],
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: Text(document['subtitle']),
                          leading: CircleAvatar(
                            radius: 30,
                            child: Hero(
                              tag: document.id,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(30),
                                child: Image.network(
                                  document['ico'],
                                  width: double.infinity,
                                  height: isTab(context) ? 400 : 250,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          initialPadding: EdgeInsets.all(5),
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
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      document['tiltle_animal'] ?? " ",
                                      style: TextStyle(
                                        color: Colors.teal,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w800,
                                        fontFamily: 'mitr',
                                      ),
                                    ),
                                    Text(
                                      document['animal_list'] ?? " ",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontFamily: 'mitr',
                                      ),
                                    ),
                                    Text(
                                      document['tiltle_loca'] ?? " ",
                                      style: TextStyle(
                                        color: Colors.teal,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w800,
                                        fontFamily: 'mitr',
                                      ),
                                    ),
                                    Text(
                                      document['loca_list'] ?? " ",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontFamily: 'mitr',
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    ).toList(),
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
