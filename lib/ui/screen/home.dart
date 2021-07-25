//import 'dart:io';
//import 'package:path_provider/path_provider.dart';
//import 'package:audioplayers/audioplayers.dart';
//import 'package:flutter/services.dart';
import 'package:cmzoofv2/ui/screen/onboard_screen.dart';
import 'package:flutter/material.dart';

class IndexHome extends StatefulWidget {
  @override
  _IndexHomeState createState() => _IndexHomeState();
}

class _IndexHomeState extends State<IndexHome> {
  //ฟังก์ชันเสียง
  /* String mp3Uri = '';
  void _playSound() {
    AudioPlayer player = AudioPlayer();
    player.play(mp3Uri);
  }

  void _loadSound() async {
    final ByteData data = await rootBundle.load('audio/');
    Directory tempDir = await getTemporaryDirectory();
    File tempFile = File('${tempDir.path}/');
    await tempFile.writeAsBytes(data.buffer.asUint8List(), flush: true);
    mp3Uri = tempFile.uri.toString();
  }*/

  //โลโก
  Widget showLogo() {
    return Container(
      child: Image.asset('images/logo.png'),
    );
  }

  //ฟังก์ชันปุ่ม
  Widget welcomeButton() {
    // ignore: deprecated_member_use
    return RaisedButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      color: Colors.lightGreen[700],
      child: Text(
        'เข้าสู่สวนสัตว์',
        style: TextStyle(
          fontSize: 23.5,
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontFamily: 'mitr',
        ),
      ),
      onPressed: () {
        //_playSound();
        MaterialPageRoute materialPageRoute = MaterialPageRoute(
            builder: (BuildContext context) => OnBoardScreen());
        Navigator.of(context)
            .pushAndRemoveUntil(materialPageRoute, (route) => false);
      },
    );
  }

  Widget showBotton() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        welcomeButton(),
      ],
    );
  }

  @override
  void initState() {
    super.initState();
    //_loadSound();
  }

  //ฟังก์ชันโชว์
  Widget build(BuildContext context) {
    return Stack(
      children: [
        bgImg(),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                showLogo(),
                SizedBox(
                  height: 10.0,
                ),
                showBotton(),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Container bgImg() {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("images/bg.jpg"),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
