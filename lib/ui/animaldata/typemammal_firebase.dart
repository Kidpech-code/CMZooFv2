// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:cmzoofv2/ui/animaldata/mammalsdata_firebase.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';

// class ShowDatamammalFB extends StatefulWidget {
//   final MammalFirebase mammalFBModel;
//   ShowDatamammalFB({
//     required this.mammalFBModel,
//   });

//   @override
//   _ShowDatamammalFBState createState() => _ShowDatamammalFBState();
// }

// class _ShowDatamammalFBState extends State<ShowDatamammalFB> {
//   late MammalFirebase model;
//   List<Widget> datamammal = [];

//   @override
//   void initState() {
//     super.initState();
//     readDatamammal();
//   }

//   Future<Null> readDatamammal() async {
//     await Firebase.initializeApp().then((value) async {
//       print('initialize Success');
//       await FirebaseFirestore.instance
//           .collection('datamammals')
//           .orderBy('nameth')
//           .snapshots()
//           .listen((event) {
//         print('snapshot = ${event.docs}');
//         for (var snapshots in event.docs) {
//           Map<String, dynamic> map = snapshots.data();
//           print('map = $map');
//           MammalFirebase dataMFB = MammalFirebase.fromMap(map);
//           print('name = ${dataMFB.nameth}');
//           setState(() {
//             datamammal.add(createDatamammal(dataMFB));
//           });
//         }
//       });
//     });
//   }

//   Widget createDatamammal(MammalFirebase dataMFB) => Container();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold();
//   }
// }
