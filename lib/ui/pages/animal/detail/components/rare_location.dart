import 'package:cmzoofv2/Model/animal_model.dart';
import 'package:cmzoofv2/responsive.dart';
import 'package:flutter/material.dart';

class RareLocation extends StatelessWidget {
  const RareLocation({
    Key? key,
    required this.rare,
  }) : super(key: key);

  final Rareanimal rare;

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
          rare.location,
          style: TextStyle(
            fontSize: isTab(context) ? 16 : 12,
            fontWeight: FontWeight.w700
          ),
        ),
      ],
    );
  }
}