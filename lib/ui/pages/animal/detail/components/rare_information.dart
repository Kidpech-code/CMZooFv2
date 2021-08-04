import 'package:cmzoofv2/Model/animal_model.dart';
import 'package:cmzoofv2/responsive.dart';
import 'package:cmzoofv2/ui/pages/animal/detail/components/rare_location.dart';
import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';

class RareInformation extends StatelessWidget {
  const RareInformation({
    Key? key,
    required this.rare,
  }) : super(key: key);

  final Rareanimal rare;

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
                  rare.rareanimalName,
                  style: TextStyle(
                    fontSize: isTab(context) ? 32 : 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 5),
                RareLocation(rare: rare),
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
                  rare.description,
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
