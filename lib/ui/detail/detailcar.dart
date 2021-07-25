import 'package:cmzoofv2/ui/data/cardata.dart';
import 'package:flutter/material.dart';

Widget detailCar(CarData carout) {
  return Container(
    margin: EdgeInsets.only(bottom: 10.0),
    width: double.infinity,
    height: 50.0,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(8.0),
      color: Colors.green[200],
    ),
    child: Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.directions_bus),
          SizedBox(width: 10.0),
          Text(
            carout.timeout,
            style: TextStyle(
              fontSize: 15.0,
              fontWeight: FontWeight.bold,
              fontFamily: 'mitr',
            ),
          ),
        ],
      ),
    ),
  );
}
