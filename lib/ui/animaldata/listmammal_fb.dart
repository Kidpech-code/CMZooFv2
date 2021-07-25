import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cmzoofv2/constants.dart';
import 'package:cmzoofv2/ui/animaldata/mammalspage.dart';
import 'package:flutter/material.dart';

class ListmammalFB extends StatelessWidget {

  final CollectionReference _mammalsRef =
      FirebaseFirestore.instance.collection("listmammals");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreen[100],
      appBar: AppBar(
        centerTitle: true,
        //automaticallyImplyLeading: false,
        backgroundColor: Colors.lightGreen[900],
        title: Text(
          'สัตว์เลี้ยงลูกด้วยนม',
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
              future: _mammalsRef.get(),
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
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MammalPage(mammalsId: document.id),
                              ));
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
                          child: Stack(
                            children: [
                              Container(
                                height: 300,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(12.0),
                                  child: Image.network(
                                    "${document['cover']}",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Positioned(
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
                                        document['nameth'] ?? "Mammals NameTh",
                                        style: Constants.regularHeading,
                                      ),
                                      Text(
                                        document['nameeng'] ??
                                            "Mammals NameEng",
                                        style: TextStyle(
                                            fontSize: 18.0,
                                            color:
                                                Theme.of(context).accentColor,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
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
}
