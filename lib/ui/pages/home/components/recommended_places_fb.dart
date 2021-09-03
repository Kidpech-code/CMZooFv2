import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cmzoofv2/responsive.dart';
import 'package:cmzoofv2/ui/pages/home/details/details_fb.dart';
import 'package:cmzoofv2/util.dart';
import 'package:flutter/material.dart';

class RecommendedPlacesFB extends StatefulWidget {
  const RecommendedPlacesFB({
    Key? key,
  }) : super(key: key);

  @override
  State<RecommendedPlacesFB> createState() => _RecommendedPlacesFBState();
}

class _RecommendedPlacesFBState extends State<RecommendedPlacesFB> {
  final CollectionReference _recommemdedplaces =
      FirebaseFirestore.instance.collection("recommemded_places");
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        child: Stack(
          children: [
            FutureBuilder<QuerySnapshot>(
              future: _recommemdedplaces.get(),
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
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => DetailRecommemded(
                                      recommemdedid: document.id,
                                    ),
                                  ),
                                );
                              },
                              //รูปสถานที่และชื่อ
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
                                                    document['name'] ??
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
                                                        "Animal engname",
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: isTab(context)
                                                          ? 24
                                                          : 11,
                                                      fontWeight:
                                                          FontWeight.w700,
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
      ),
    );
  }
}
