import 'package:cmzoofv2/Model/map_model.dart';
import 'package:flutter/material.dart';

class ZonePlaceImage extends StatelessWidget {
  const ZonePlaceImage({
    Key? key,
    required this.zones,
  }) : super(key: key);

  final ZoneData zones;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.4,
      child: Hero(
        tag: zones.id,
        child: Image.asset(
          zones.image,
          height: size.height * 0.4,
          width: size.width,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}