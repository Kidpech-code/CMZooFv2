import 'package:cmzoofv2/Model/travel.dart';
import 'package:flutter/material.dart';

class PlaceImage extends StatelessWidget {
  const PlaceImage({
    Key? key,
    required this.travel,
  }) : super(key: key);

  final Travel travel;

  @override
  Widget build(BuildContext context) { 
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.4,
      child: Hero(
        tag: travel.id,
        child: Image.asset(
          travel.image,
          height: size.height * 0.4,
          width: size.width,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}