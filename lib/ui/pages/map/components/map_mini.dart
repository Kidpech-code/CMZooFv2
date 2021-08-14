import 'package:flutter/material.dart';

class MapMini extends StatelessWidget {
  const MapMini({
    Key? key,
  }) : super(key: key);

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