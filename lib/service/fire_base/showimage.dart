import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';


class ShowImage extends StatefulWidget {
  @override
  _ShowImageState createState() => _ShowImageState();
}

class _ShowImageState extends State<ShowImage> {
  final CollectionReference _animal =
      FirebaseFirestore.instance.collection("animal");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreen[100],
      appBar: AppBar(
        centerTitle: true,
        //automaticallyImplyLeading: false,
        backgroundColor: Colors.redAccent[900],
        title: Text(
          'รูป Kamen Rider',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'mitr',
          ),
        ),
      ),
      body: Container(
        child: Stack(
          children: [
            FutureBuilder<QuerySnapshot>(
              future: _animal.get(),
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
                  return ListView(
                    children: snapshot.data!.docs.map((document) {
                      return GestureDetector(
                        onTap: () {
                                  print("Hello word");
                          showCupertinoModalBottomSheet<void>(
                            context: context,
                            builder: (BuildContext context) {
                              return SingleChildScrollView(
                                child: Container(
                                  child: Center(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      mainAxisSize: MainAxisSize.max,
                                      children: <Widget>[
                                        Column(
                                          children: [
                                            Container(
                                                height: 140,
                                                child: Image.network(
                                                    "${document['image']} ")),
                                            Row(
                                              children: [
                                                Text("ชื่อ:",),
                                                SizedBox(
                                                  width: 2 ,),
                                                Text(document['name']?? "Animal name",),
                                                ]
                                            ),
                                            Row(
                                              children: [
                                                Text("ชื่ออังกฤษ:",),
                                                SizedBox(
                                                  width: 2 ,),
                                                Text(document['engname']?? "Animal engname",),
                                                ],
                                            ),
                                            Text("${document['scientific_name']}"),
                                            Text("${document['animaldata']}"),
                                            Text("${document['address']}"),
                                            Text("${document['food']}"),
                                            Text("${document['actions']}"),
                                            Text("${document['current_status']}"),
                                            Text("${document['average_age']}"),
                                            Text("${document['sex']} ",),
                                            Text("${document['size_and_weight']} ",),
                                            Text("${document['num']} ",),
                              
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: <Widget>[
                                            
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              );},
                          );
                        },
                              
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          height: 350.0,
                          margin: EdgeInsets.symmetric(
                            vertical: 12.0,
                            horizontal: 24.0,
                          ),
                          child: Center(
                            child: Stack(
                              children: [
                                Container(
                                  height: 300,
                                  child: Center(
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(12.0),
                                      child: Image.network(
                                        "${document['image']}", // fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                                Center(
                                  child: Positioned(
                                    bottom: 0,
                                    left: 0,
                                    right: 0,
                                    child: Padding(
                                      padding: const EdgeInsets.all(24.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            document['name'] ?? "Animal name",
                                          ),
                                          Row(
                                            children: [
                                              Text(document['engname'] ??"Animal engname"),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    }).toList(),
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

//  Widget buildNoname(){
//    return Scaffold(
//      body: Center(
//        child: Text("{document['name']}"),
//      ),
//    );
//  } 
}
