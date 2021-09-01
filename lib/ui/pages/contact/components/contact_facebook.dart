import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactFacebook extends StatelessWidget {
  const ContactFacebook({Key? key}) : super(key: key);

  //เชื่อมเว็บ
  void openurl() {
    String url = "https://www.facebook.com/FanpageChiangMaiZoo";
    launch(url);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          // ignore: deprecated_member_use
          RaisedButton.icon(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            color: Colors.blue[700],
            disabledColor: Colors.blue[700],
            icon: Icon(
              Icons.facebook,
              color: Colors.white,
            ),
            label: Text(
              "Facebook",
              style: TextStyle(
                color: Colors.white,
                fontSize: 15.0,
                fontWeight: FontWeight.w600,
                fontFamily: 'mitr',
              ),
            ),
            onPressed: () {
              openurl();
            },
          ),
        ],
      ),
    );
  }
}
