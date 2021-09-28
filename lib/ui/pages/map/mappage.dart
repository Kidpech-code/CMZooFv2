import 'package:cmzoofv2/Model/map_model.dart';
import 'package:cmzoofv2/components/app_bar.dart';
import 'package:cmzoofv2/service/map/zoomap_fb.dart';
import 'package:cmzoofv2/service/map/zoomap_fb1.dart';
import 'package:cmzoofv2/ui/pages/home/components/recommended.dart';
import 'package:cmzoofv2/ui/pages/map/components/map_mini.dart';
import 'package:cmzoofv2/ui/pages/map/components/zone_places.dart';
import 'package:cmzoofv2/service/map/zoomap.dart';
import 'package:flutter/material.dart';

class MapPage extends StatefulWidget {
  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  //List<MapData> zonemap = zone();

  Widget bgImg() {
    return Opacity(
      opacity: 0.55,
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/titlebg_1.jpg"),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        bgImg(),
        Scaffold(
          extendBody: true,
          backgroundColor: Colors.transparent,
          appBar: buildAppBar(
            context,
            title: 'ZOOMAP',
            actions: [
              IconButton(
                iconSize: 45,
                icon: Icon(Icons.pin_drop),
                color: Colors.orangeAccent[700],
                onPressed: () {
                  //Navigator.of(context).pop();
                  MaterialPageRoute route = MaterialPageRoute(
                    builder: (BuildContext context) => ZooMapFB(),
                  );
                  Navigator.push(context, route);
                },
              ),
            ],
            leading: EmptyMenu(),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                MapMini(),
                ZonePlaces(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
