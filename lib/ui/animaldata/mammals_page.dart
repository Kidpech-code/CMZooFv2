import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cmzoofv2/components/app_bar.dart';
import 'package:flutter/material.dart';

class ListMammals extends StatefulWidget {
  const ListMammals({Key? key}) : super(key: key);

  @override
  _ListMammalsState createState() => _ListMammalsState();
}

class _ListMammalsState extends State<ListMammals> {
  final CollectionReference _mammals =
      FirebaseFirestore.instance.collection("listmammals");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        context,
        title: 'สัตว์เลี้ยงลูกด้วยนม',
        actions: [],
        leading: EmptyMenu(),
      ),
      body: Stack(
        children: [
          //ลูกศรย้อนกลับ
          CustomBackButtonA(),
        ],
      ),
    );
  }
}

class CustomBackButtonA extends StatelessWidget {
  const CustomBackButtonA({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
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
              color: Colors.green,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
