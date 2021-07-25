import 'package:cmzoofv2/ui/animaldata/animaldata.dart';
import 'package:flutter/material.dart';

Widget listAnimal(AnimalType type) {
  return GestureDetector(
    child: Container(
      width: 180.0,
      margin: EdgeInsets.only(right: 12.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 200.0,
            width: 180.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              image: DecorationImage(
                image: AssetImage(type.typeImg),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 5.0),
          Text(
            type.typeanimal,
            style: TextStyle(
              fontSize: 16.5,
              fontWeight: FontWeight.bold,
              fontFamily: 'mitr',
            ),
          ),
        ],
      ),
    ),
  );
}
