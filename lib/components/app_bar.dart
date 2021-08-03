import 'package:cmzoofv2/components/constants.dart';
import 'package:cmzoofv2/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
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

Future<void> _showNotification() async {
  const AndroidNotificationDetails androidNotificationDetails =
      AndroidNotificationDetails(
          'nextflow_noti_001', 'แจ้งเตือนทั่วไป', 'แจ้งเตือนด่วน',
          importance: Importance.max,
          priority: Priority.high,
          ticker: 'ticker');
  const NotificationDetails platformChannelDetails = NotificationDetails(
    android: androidNotificationDetails,
  );

  await flutterLocalNotificationsPlugin.show(
      0, 'สวนสัตว์เชียงใหม่', 'วันนี้มีกิจกรรมใหม่', platformChannelDetails);
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
      onPressed: () {
        _showNotification();
      },
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
