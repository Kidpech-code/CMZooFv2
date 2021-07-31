import 'package:cmzoofv2/service/fire_base/firebase.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class TestgetData extends StatefulWidget {
  const TestgetData({Key? key}) : super(key: key);

  @override
  _TestgetDataState createState() => _TestgetDataState();
}

class _TestgetDataState extends State<TestgetData> {
  FireBase fb = FireBase();
  @override
  void initState() {
    super.initState();
    fb.getQuery(path: 'listmammals');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Get Data...'),
      ),
      body: Container(),
    );
  }
}
