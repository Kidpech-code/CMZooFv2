import 'package:cmzoofv2/map/zoomap.dart';
import 'package:flutter/material.dart';

class MapPage extends StatefulWidget {
  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreen[100],
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.lightGreen[900],
        title: Text(
          'แผนที่และโซนต่างๆ',
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'mitr',
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.assistant_navigation),
            onPressed: () {
              //Navigator.of(context).pop();
              MaterialPageRoute route = MaterialPageRoute(
                  builder: (BuildContext context) => Zoomap());
              Navigator.push(context, route);
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            child: ClipRect(
              child: InteractiveViewer(
                maxScale: 8,
                child: Image.asset('images/map.png'),
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 10.0),
                      width: double.infinity,
                      height: 65.0,
                      child: Card(
                        color: Color(0XFFFFD503),
                        elevation: 7.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: Text(
                          "HUAYKAEW ZONE",
                          style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'mitr',
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 10.0),
                      width: double.infinity,
                      height: 65.0,
                      child: Card(
                        color: Color(0xFFF58220),
                        elevation: 7.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: Text(
                          "SUTHEP ZONE",
                          style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'mitr',
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 10.0),
                      width: double.infinity,
                      height: 65.0,
                      child: Card(
                        color: Color(0xFF8CC63F),
                        elevation: 7.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: Text(
                          "DOIPUI ZONE",
                          style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'mitr',
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 10.0),
                      width: double.infinity,
                      height: 65.0,
                      child: Card(
                        color: Color(0xFFD03B96),
                        elevation: 7.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: Text(
                          "WIENGJEDLIN ZONE",
                          style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'mitr',
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
