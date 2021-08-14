import 'package:cmzoofv2/Model/map_model.dart';
import 'package:cmzoofv2/responsive.dart';
import 'package:flutter/material.dart';

class LocationZone extends StatelessWidget {
  const LocationZone({
    Key? key,
    required this.zones,
  }) : super(key: key);

  final ZoneData zones;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.location_pin,
          color: Colors.grey,
        ),
        SizedBox(width: 10),
        Text(
          zones.location,
          style: TextStyle(
            fontSize: isTab(context) ? 16 : 12,
            fontWeight: FontWeight.w700
          ),
        ),
      ],
    );
  }
}