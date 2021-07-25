import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class MammalPage extends StatefulWidget {
  final String mammalsId;
  MammalPage({required this.mammalsId});

  @override
  _MammalPageState createState() => _MammalPageState();
}

class _MammalPageState extends State<MammalPage> {
  final CollectionReference _mammalsRef =
      FirebaseFirestore.instance.collection("listmammals");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          children: [
            FutureBuilder(
              future: _mammalsRef.doc(widget.mammalsId).get(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Scaffold(
                    body: Center(
                      child: Text("Error: ${snapshot.error}"),
                    ),
                  );
                }

                // if (snapshot.connectionState == ConnectionState.done) {
                //   final Map<String, dynamic> documentData = snapshot.data!.data();
                //   return ListView(
                //     children: [
                //       Image.network("${documentData['image'][0]}"),
                //     ],
                //   );
                // }

                // Loading State
                return Scaffold(
                  body: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              },
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 40,
                left: 20,
              ),
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    height: 40.0,
                    width: 40.0,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Icon(
                        Icons.arrow_back,
                        color: Colors.green[900],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
