import 'package:cmzoofv2/Model/animal_model.dart';
import 'package:flutter/material.dart';

class RareImage extends StatelessWidget {
  const RareImage({
    Key? key,
    required this.rare,
  }) : super(key: key);

  final Rareanimal rare;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.4,
      child: Hero(
        tag: rare.id,
        child: Image.asset(
          rare.rareanimalImg,
          height: size.height * 0.4,
          width: size.width,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}