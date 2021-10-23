import 'package:cmzoofv2/responsive.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RareRemonmended extends StatelessWidget {
  const RareRemonmended({Key? key}) : super(key: key);

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
              'สัตว์หายาก',
              style: GoogleFonts.merriweather(
                fontWeight: FontWeight.w700,
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
