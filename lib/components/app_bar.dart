import 'package:cmzoofv2/components/constants.dart';
import 'package:cmzoofv2/main.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

AppBar buildAppBar(BuildContext context,
    {required String title,
    required List<Widget> actions,
    required Widget leading}) {
  return AppBar(
    centerTitle: true,
    automaticallyImplyLeading: false,
    backgroundColor: Colors.transparent,
    elevation: 0,
    title: Text(
      title,
      style: GoogleFonts.merriweather(color: kTextColor, fontSize: 35),
    ),
    actions: actions,
    leading: leading,
  );
}

class Notifi extends StatelessWidget {
  const Notifi({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: ClipOval(
        child: Image.asset('icons/notifi.png'),
      ),
      onPressed: () {},
    );
  }
}

class ReordeMenu extends StatelessWidget {
  const ReordeMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
        icon: ClipOval(
          child: Image.asset('icons/reorde.png'),
        ),
        onPressed: () {});
  }
}

class EmptyMenu extends StatelessWidget {
  const EmptyMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
