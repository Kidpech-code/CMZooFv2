import 'package:cmzoofv2/Model/app_color.dart';
import 'package:flutter/material.dart';

class MapUserBadge extends StatelessWidget {
  MapUserBadge({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
      padding: EdgeInsets.all(12),
      margin: EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(100),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 10,
            offset: Offset.zero,
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              image: DecorationImage(
                image: AssetImage('images/bg.jpg'),
                fit: BoxFit.cover,
              ),
              border: Border.all(
                color: AppColors.MAIN_COLOR,
                width: 2,
              ),
            ),
          ),
          SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'TRAVEL',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey),
                ),
                Text(
                  'My Location',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: AppColors.MAIN_COLOR),
                ),
              ],
            ),
          ),
          Icon(
            Icons.location_pin,
            color: Colors.green,
            size: 40,
          )
        ],
      ),
    );
  }
}
