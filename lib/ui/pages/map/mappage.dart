import 'package:cmzoofv2/ui/map/huaykaewzone.dart';
import 'package:cmzoofv2/ui/map/mapdata.dart';
import 'package:cmzoofv2/ui/map/zoomap.dart';
import 'package:flutter/material.dart';

class MapPage extends StatefulWidget {
  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  List<MapData> zonemap = zone();

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
          SizedBox(height: 0.0),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(right: 15, left: 15, top: 10),
              child: GridView.extent(
                maxCrossAxisExtent: 201.80,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
                children: buildzone(),
              ),
            ),
          )
        ],
      ),
    );
  }

  List<Widget> buildzone() {
    List<Widget> list = [];
    for (var i = 0; i < zonemap.length; i++) {
      list.add(buildzones(zonemap[i]));
    }
    return list;
  }

  Widget buildzones(MapData zonemap) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HuaykaewZone(hzs: zonemap),
          ),
        );
      },
      child: Card(
        child: Column(
          children: <Widget>[
            SizedBox(height: 20.0),
            Container(
              width: 120.0,
              height: 120.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                image: DecorationImage(
                  image: AssetImage(zonemap.imgzone),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 5.0),
            Text(
              zonemap.namezone,
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                fontFamily: 'mitr',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
