import 'package:cmzoofv2/Model/app_color.dart';
import 'package:cmzoofv2/Model/icon_helper.dart';
import 'package:cmzoofv2/components/category_icon.dart';
import 'package:flutter/material.dart';

class MapBottomPill extends StatelessWidget {
  const MapBottomPill({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(40),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 10,
            offset: Offset.zero,
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            color: Colors.white,
            child: Row(
              children: [
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    ClipOval(
                      child: Image.asset(
                        'images/bg.jpg',
                        width: 60,
                        height: 60,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      bottom: -10,
                      right: -10,
                      child: CategoryIcon(
                        color: AppColors.MEATS,
                        iconName: IconFontHelper.MEATS,
                        size: 20,
                        padding: 5,
                      ),
                    ),
                  ],
                ),
                SizedBox(width: 20),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'ตึกอธิการบดี',
                        style: TextStyle(
                          color: Colors.grey[700],
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                      Text('มหาวิทยาลัยพะเยา'),
                    ],
                  ),
                ),
                Icon(
                  Icons.location_pin,
                  color: AppColors.MEATS,
                  size: 50,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
