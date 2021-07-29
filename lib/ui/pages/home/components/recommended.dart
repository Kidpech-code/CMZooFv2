import 'package:cmzoofv2/components/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Recommended extends StatelessWidget {
  const Recommended({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: [
            Text(
              'Recommemded',
              style: GoogleFonts.merriweather(
                fontWeight: FontWeight.w700,
                fontSize: 20,
              ),
            ),
            Spacer(),
            TextButton(
              onPressed: () {},
              child: Text(
                'View All',
                style: GoogleFonts.merriweather(
                    fontSize: 14, color: kPrimaryColor),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
