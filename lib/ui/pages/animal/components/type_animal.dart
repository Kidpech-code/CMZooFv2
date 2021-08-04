import 'package:cmzoofv2/responsive.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TypeRemonmended extends StatelessWidget {
  const TypeRemonmended({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      child: Padding(
        padding: isLandscape(context)
            ? EdgeInsets.symmetric(horizontal: 50)
            : EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: [
            Text(
              'ประเภทของสัตว์',
              style: GoogleFonts.mitr(
                fontWeight: FontWeight.w500,
                fontSize: isTab(context) ? 26 : 22,
                color: Colors.green[900],
              ),
            ),
          ],
        ),
      ),
    );
  }
}