import 'package:cmzoofv2/Model/travel.dart';
import 'package:cmzoofv2/responsive.dart';
import 'package:cmzoofv2/util.dart';
import 'package:flutter/material.dart';

class GridPlaceCard extends StatelessWidget {
  const GridPlaceCard({
    Key? key,
    required this.travel,
    required this.tapEvent,
  }) : super(key: key);

  final Travel travel;
  final GestureTapCallback tapEvent;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: tapEvent,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Stack(
          children: [
            Hero(
              tag: travel.id,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(
                  travel.image,
                  width: double.infinity,
                  height: isTab(context) ? 400 : 250,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  width: double.infinity,
                  height: isTab(context) ? 100 : 45,
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: cardInfoDecoration,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            travel.name,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: isTab(context) ? 24 : 15,
                                fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            travel.location,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: isTab(context) ? 24 : 11,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
