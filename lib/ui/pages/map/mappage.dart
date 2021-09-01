import 'package:cmzoofv2/Model/map_model.dart';
import 'package:cmzoofv2/components/app_bar.dart';
import 'package:cmzoofv2/ui/pages/map/components/map_mini.dart';
import 'package:cmzoofv2/ui/pages/map/components/zone_places.dart';
import 'package:cmzoofv2/ui/pages/map/show_zone/huaykaewzone.dart';
import 'package:cmzoofv2/service/data/map_data/mapdata.dart';
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
          backgroundColor: Colors.transparent,
          appBar: buildAppBar(
            context,
            title: 'ZOOMAP',
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
