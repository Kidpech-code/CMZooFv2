import 'package:cmzoofv2/map/mapdata.dart';
import 'package:flutter/material.dart';

Widget detailzone(MapData zone) {
  return Container(
    margin: EdgeInsets.only(bottom: 10.0),
    width: double.infinity,
    height: 160.0,
    child: Card(
      color: Colors.green[200],
      elevation: 7.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Padding(
        padding: EdgeInsets.all(12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    zone.namezone,
                    style: TextStyle(
                      fontSize: 22.5,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'mitr',
                    ),
                  ),
                ],
              ),
            ),
            Icon(Icons.bookmark_border),
          ],
        ),
      ),
    ),
  );
}
