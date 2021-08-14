import 'package:cmzoofv2/responsive.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Recommended extends StatelessWidget {
  const Recommended({
    Key? key,
  }) : super(key: key);

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
              'สถานที่แนะนำ',
              style: GoogleFonts.merriweather(
                fontWeight: FontWeight.w700,
                fontSize: isTab(context) ? 24 : 20,
              ),
            ),
            // Spacer(),
            // TextButton(
            //   onPressed: () {},
            //   child: Text(
            //     'View All',
            //     style: GoogleFonts.merriweather(
            //       fontSize: isTab(context) ? 20 : 14,
            //       color: kPrimaryColor,
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
