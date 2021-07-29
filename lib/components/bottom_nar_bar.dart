import 'package:cmzoofv2/components/constants.dart';
import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 75,
      width: double.infinity,
      margin: EdgeInsets.all(15),
      padding: EdgeInsets.symmetric(horizontal: 40),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: Colors.lightGreen[100],
        boxShadow: [
          BoxShadow(
            blurRadius: 20,
            offset: const Offset(0, 3),
            color: Colors.black.withAlpha(20),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          NarItem(
            icon: 'icons/home.png',
            isActive: true,
          ),

          NarItem(
            icon: 'icons/pawprint.png',
            isActive: false,
          ),

          NarItem(
            icon: 'icons/ticket.png',
            isActive: false,
          ),

          NarItem(
            icon: 'icons/map.png',
            isActive: false,
          ),
        ],
      ),
    );
  }
}

class NarItem extends StatelessWidget {
  const NarItem({
    Key? key,
    required this.icon,
    required this.isActive,
  }) : super(key: key);

  final String icon;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Spacer(),
        IconButton(
          icon: ClipRect(
            child: Image.asset(icon),
          ),
          onPressed: () {},
        ),
        Spacer(),
        Container(
          height: 4,
          width: 35,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: isActive ? kPrimaryColor : Colors.transparent,
            boxShadow: [
              BoxShadow(
                blurRadius: 6,
                offset: const Offset(0, -2),
                color: isActive ? kPrimaryColor : Colors.transparent,
              ),
            ],
          ),
        ),
      ],
    );
  }
}