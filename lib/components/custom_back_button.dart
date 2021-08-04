import 'package:flutter/material.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({
    Key? key,
    required this.tapEvent,
  }) : super(key: key);

  final GestureTapCallback tapEvent;

  // @override
  // Widget build(BuildContext context) {
  //   return IconButton(
  //     onPressed: tapEvent,
  //     icon: Icon(
  //       Icons.arrow_back,
  //       color: Colors.white,
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Align(
      //alignment: Alignment.topLeft,
      child: Container(
        height: 40.0,
        width: 40.0,
        decoration: BoxDecoration(
          color: Colors.green,
          shape: BoxShape.circle,
        ),
        child: Center(
          child: IconButton(
            onPressed: tapEvent,
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}