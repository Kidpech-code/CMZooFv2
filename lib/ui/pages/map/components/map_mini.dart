import 'package:flutter/material.dart';

class MapMini extends StatefulWidget {
  const MapMini({
    Key? key,
  }) : super(key: key);

  @override
  State<MapMini> createState() => _MapMiniState();
}

class _MapMiniState extends State<MapMini> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        child: ClipRect(
          child: InteractiveViewer(
            maxScale: 8,
            child: Image.asset('images/map.png'),
          ),
        ),
      ),
    );
  }
}