import 'package:flutter/material.dart';

class Show {

  Widget showAppName() {
    return Text(
      'CHAINGMAI ZOO',
      style: TextStyle(
        fontSize: 20,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget showAppEmail() {
    return Text(
      'chiangmaizoomail@yahoo.com',
      style: TextStyle(
        fontSize: 15,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
    );
  }
  
  Show();
}
