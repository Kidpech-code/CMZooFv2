import 'package:cmzoofv2/Model/travel.dart';
import 'package:cmzoofv2/responsive.dart';
import 'package:cmzoofv2/ui/pages/home/details/components/location.dart';
import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';

class PlaceInformation extends StatelessWidget {
  const PlaceInformation({
    Key? key,
    required this.travel,
  }) : super(key: key);

  final Travel travel;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return DelayedDisplay(
      delay: Duration(milliseconds: 100),
      fadingDuration: Duration(milliseconds: 300),
      slidingBeginOffset: const Offset(0, 1),
      child: Container(
        height: size.height * 0.7,
        width: double.infinity,
        margin: EdgeInsets.only(top: size.height * 0.35),
        padding: EdgeInsets.all(30),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(35),
            topRight: Radius.circular(35),
          ),
          color: Colors.white,
        ),
        child: SingleChildScrollView(
          child: SafeArea(
            top: false,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  travel.name,
                  style: TextStyle(
                    fontSize: isTab(context) ? 32 : 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 5),
                LocationTravel(travel: travel),
                SizedBox(height: 10),
                Text(
                  'Description',
                  style: TextStyle(
                    fontSize: isTab(context) ? 28 : 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  travel.description,
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
