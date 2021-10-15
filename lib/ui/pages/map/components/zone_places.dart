import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cmzoofv2/responsive.dart';
import 'package:cmzoofv2/service/data/map_data/mapdata.dart';
import 'package:cmzoofv2/ui/pages/map/components/zone_gird_card.dart';
import 'package:cmzoofv2/ui/pages/map/detail/detail_zone.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';

class ZonePlaces extends StatefulWidget {
  const ZonePlaces({Key? key}) : super(key: key);

  @override
  State<ZonePlaces> createState() => _ZonePlacesState();
}

class _ZonePlacesState extends State<ZonePlaces> {
  // final GlobalKey<ExpansionTileCardState> hz = new GlobalKey();
  // final GlobalKey<ExpansionTileCardState> sz = new GlobalKey();
  // final GlobalKey<ExpansionTileCardState> dz = new GlobalKey();
  // final GlobalKey<ExpansionTileCardState> wz = new GlobalKey();

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
                          subtitle: Text(
                            document['subtitle'],
                          ),
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
                                child: Text(document['description']),
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
