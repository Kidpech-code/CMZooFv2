import 'package:cmzoofv2/Model/app_color.dart';
import 'package:cmzoofv2/Model/icon_font.dart';
import 'package:cmzoofv2/Model/icon_helper.dart';
import 'package:flutter/material.dart';

class MainAppBar extends StatefulWidget implements PreferredSizeWidget {
  Color themeColor;
  bool showProfilePic;

  MainAppBar(
      {this.themeColor = AppColors.MAIN_COLOR, this.showProfilePic = true});

  @override
  MainAppBarState createState() => MainAppBarState();

  @override
  Size get preferredSize => new Size.fromHeight(80);
}

class MainAppBarState extends State<MainAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: IconFont(
        iconName: IconFontHelper.LOGO,
        color: widget.themeColor,
        size: 40,
      ),
      //automaticallyImplyLeading: false,
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      iconTheme: IconThemeData(color: widget.themeColor),
    );
  }
}
