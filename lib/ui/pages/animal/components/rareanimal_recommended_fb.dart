 import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cmzoofv2/responsive.dart';
import 'package:cmzoofv2/util.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class RareRecommendedFB extends StatefulWidget {
  const RareRecommendedFB({Key? key}) : super(key: key);

  @override
  _RareRecommendedFBState createState() => _RareRecommendedFBState();
}

class _RareRecommendedFBState extends State<RareRecommendedFB> {
  final CollectionReference _listrareaniaml =
      FirebaseFirestore.instance.collection("list_rareanimal");
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          FutureBuilder<QuerySnapshot>(
            future: _listrareaniaml.get(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Scaffold(
                  body: Center(
                    child: Text("Error: ${snapshot.error}"),
                  ),
                );
              }
              //Collection Data Ready to display
              if (snapshot.connectionState == ConnectionState.done) {
                //Display the data inside a list view
                return SafeArea(
                  child: SingleChildScrollView(
                    child: GridView.count(
                      crossAxisCount: isLandscape(context) ? 3 : 2,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      padding: isLandscape(context)
                          ? EdgeInsets.symmetric(vertical: 20, horizontal: 50)
                          : EdgeInsets.all(20),
                      mainAxisSpacing: 20,
                      crossAxisSpacing: 20,
                      childAspectRatio: 1.2,
                      children: snapshot.data!.docs.map(
                        (document) {
                          return GestureDetector(
                            onTap: () {
                              print("Hello word");
                              showBarModalBottomSheet(
                                context: context,
                                builder: (BuildContext context) {
                                  return SingleChildScrollView(
                                    padding: EdgeInsets.all(10),
                                    child: Container(
                                      child: Center(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          mainAxisSize: MainAxisSize.max,
                                          children: <Widget>[
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.stretch,
                                              children: [
                                                //?????????
                                                Card(
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15),
                                                  ),
                                                  child: Container(
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15),
                                                      child: Image.network(
                                                        "${document['images']}",
                                                        width: double.infinity,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(height: 10),
                                                //?????????????????????????????????
                                                Text(
                                                  document['nameTh'] ??
                                                      "Animal name",
                                                  style: TextStyle(
                                                    fontSize: 18.0,
                                                    fontWeight: FontWeight.bold,
                                                    fontFamily: 'mitr',
                                                  ),
                                                ),
                                                SizedBox(height: 5),
                                                //location
                                                Row(
                                                  children: [
                                                    Icon(
                                                      Icons.location_pin,
                                                      color: Colors.grey,
                                                    ),
                                                    SizedBox(width: 10),
                                                    Text(
                                                      document['location'] ??
                                                          " ",
                                                      style: TextStyle(
                                                        fontSize: isTab(context)
                                                            ? 16
                                                            : 13,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontFamily: 'mitr',
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(height: 5),
                                                //Title Description
                                                Row(
                                                  children: [
                                                    Text(
                                                      "??????????????????",
                                                      style: TextStyle(
                                                        fontSize: isTab(context)
                                                            ? 28
                                                            : 20,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        fontFamily: 'mitr',
                                                      ),
                                                    ),
                                                    SizedBox(width: 10),
                                                    //Description
                                                    Text(
                                                      document['type'] ?? " ",
                                                      style: TextStyle(
                                                        color: Colors.teal,
                                                        fontSize: 20,
                                                        fontFamily: 'mitr',
                                                        height: 1.3,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(height: 5),
                                                //Title Description
                                                Text(
                                                  "??????????????????????????????",
                                                  style: TextStyle(
                                                    fontSize: isTab(context)
                                                        ? 28
                                                        : 20,
                                                    fontWeight: FontWeight.w700,
                                                    fontFamily: 'mitr',
                                                  ),
                                                ),
                                                SizedBox(height: 10),
                                                //Description
                                                Text(
                                                  document['description'] ??
                                                      " ",
                                                  style: TextStyle(
                                                    fontSize: 16.0,
                                                    fontFamily: 'mitr',
                                                    height: 1.3,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                            //???????????????????????????????????????????????????
                            child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Stack(
                                children: [
                                  Hero(
                                    tag: document['id'],
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(15),
                                      child: Image.network(
                                        "${document['images']}",
                                        width: double.infinity,
                                        height: isTab(context) ? 400 : 250,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Container(
                                        width: double.infinity,
                                        height: isTab(context) ? 100 : 45,
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10, vertical: 5),
                                        decoration: cardInfoDecoration,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Text(
                                                  document['nameTh'] ??
                                                      "Animal name",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: isTab(context)
                                                          ? 24
                                                          : 15,
                                                      fontWeight:
                                                          FontWeight.w700),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  document['location'] ??
                                                      " ",
                                                  style: TextStyle(
                                                    
                                                    color: Colors.white,
                                                    fontSize: isTab(context)
                                                        ? 24
                                                        : 12,
                                                    fontWeight: FontWeight.w700,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      ).toList(),
                    ),
                  ),
                );
              }

              // Loading State
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
