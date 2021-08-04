import 'package:cmzoofv2/Model/travel.dart';
import 'package:cmzoofv2/responsive.dart';
import 'package:flutter/material.dart';

class Location extends StatelessWidget {
  const Location({
    Key? key,
    required this.travel,
  }) : super(key: key);

  final Travel travel;

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
          travel.location,
          style: TextStyle(
            fontSize: isTab(context) ? 16 : 12,
            fontWeight: FontWeight.w700
          ),
        ),
      ],
    );
  }
}