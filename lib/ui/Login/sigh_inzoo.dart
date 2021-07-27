/*import 'package:CMZoo/pages/mappage.dart';
import 'package:CMZoo/pages/ticketpage.dart';
import 'package:CMZoo/widget/show.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final TextEditingController _emailController = TextEditingController();
final TextEditingController _passwordController = TextEditingController();
final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();
String nameString, idpasswordString;

class Zooin {
  Widget userForm() => Container(
        width: 250.0,
        child: TextFormField(
          controller: _emailController,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.account_box,
              color: Colors.lightGreen,
            ),
            hintStyle: TextStyle(color: Colors.grey[300]),
            hintText: 'Name@cmzoo.com',
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.green[900]),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.lightGreenAccent[400]),
            ),
          ),
          validator: (String val) {
            if (!((val.contains('@')) && (val.contains('.')))) {
              return 'กรุณากรอกชื่อแล้วตามด้วย @cmzoo.com';
            }
            return null;
          },
          onSaved: (String val) {
            nameString = val.trim();
          },
        ),
      );

  Widget idForm() => Container(
        width: 250.0,
        child: TextFormField(
          controller: _passwordController,
          obscureText: true,
          decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.lock,
              color: Colors.lightGreen,
            ),
            hintStyle: TextStyle(color: Colors.grey[300]),
            hintText: 'รหัสบัตรพนักงาน',
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.green[900]),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.lightGreenAccent[400]),
            ),
          ),
          validator: (String value) {
            if (value.isEmpty) {
              return 'กรุณากรอกเลขบัตรพนักงาน';
            }
            return null;
          },
          onSaved: (String value) {
            idpasswordString = value.trim();
          },
        ),
      );

  Zooin();
}*/
