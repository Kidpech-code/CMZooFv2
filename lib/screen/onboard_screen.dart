import 'package:cmzoofv2/bar/convexbar.dart';
import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:fancy_on_boarding/fancy_on_boarding.dart';

class OnBoardScreen extends StatefulWidget {
  @override
  _OnBoardScreenState createState() => _OnBoardScreenState();
}

class _OnBoardScreenState extends State<OnBoardScreen> {
  //ฟังก์ชันหน้า OnBoard
  String title = 'OnBorading';
  final _pageList = [
    //หน้าแนะนำสวนสัตว์
    PageModel(
      iconImagePath: 'icons/lion.png',
      heroImagePath: 'icons/lion.png',
      color: Colors.lightGreen.shade200,
      title: Text(
        'สวนสัตว์เชียงใหม่',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 30,
          color: Colors.green.shade700,
          fontFamily: 'mitr',
        ),
      ),
      body: Text(
        'ขอตอนรับทุกคน',
        style: TextStyle(
          fontSize: 20,
          color: Colors.black,
          fontFamily: 'mitr',
        ),
      ),
    ),
    //หน้าแนะนำอควาเรียม
    PageModel(
      iconImagePath: 'icons/shark.png',
      heroImagePath: 'icons/shark.png',
      color: Colors.lightBlue.shade200,
      title: Text(
        'อควาเรียม',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 30,
          color: Colors.blue.shade700,
          fontFamily: 'mitr',
        ),
      ),
      body: Text(
        'ยาวที่สุดในโลก',
        style: TextStyle(
          fontSize: 20,
          color: Colors.black,
          fontFamily: 'mitr',
        ),
      ),
    ),
    //หน้าแนะนำการใช้งาน
    PageModel(
      iconImagePath: 'icons/tiger.png',
      heroImagePath: 'icons/tiger.png',
      color: Colors.orangeAccent.shade100,
      title: Text(
        'แนะนำการใช้งาน',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 30,
          color: Colors.orange.shade700,
          fontFamily: 'mitr',
        ),
      ),
      body: Text(
        'มีขั้นตอนดังนี้',
        style: TextStyle(
          fontSize: 20,
          color: Colors.black,
          fontFamily: 'mitr',
        ),
      ),
    ),
  ];
  //ฟังก์ชันกรทำงานและปุ่ม
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FancyOnBoarding(
        pageList: _pageList,
        doneButtonText: 'เริ่มใช้งาน',
        doneButtonBackgroundColor: Colors.greenAccent[400],
        onDoneButtonPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ConvexBar()),
          );
        },
        skipButtonText: 'ข้าม',
        showSkipButton: true,
        skipButtonColor: Colors.transparent,
        onSkipButtonPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ConvexBar()),
          );
        },
      ),
    );
  }
}
