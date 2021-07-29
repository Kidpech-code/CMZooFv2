import 'package:cmzoofv2/Model/travel.dart';
import 'package:flutter/material.dart';

class GridPlaceCard extends StatelessWidget {
  const GridPlaceCard({
    Key? key,
    required this.place,
    required this.tapEvent,
  }) : super(key: key);

  final Travel place;
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
              tag: place.id,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(
                  place.image,
                  width: double.infinity,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
