import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class BookingTicket extends StatefulWidget {
  const BookingTicket({Key? key}) : super(key: key);

  @override
  State<BookingTicket> createState() => _BookingTicketState();
}

class _BookingTicketState extends State<BookingTicket> {

  void openurl() {
    String url = "https://www.eventpop.me/e/9199/chiangmaizoo";
    launch(url);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Text(
            "ซื้อบัตรล่วงหน้า",
            style: TextStyle(
              color: Colors.green[900],
              fontSize: 22.0,
              fontWeight: FontWeight.w600,
              fontFamily: 'mitr',
            ),
          ),
          SizedBox(
            width: 135.0,
          ),
          // ignore: deprecated_member_use
          RaisedButton.icon(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
            color: Colors.blue[700],
            disabledColor: Colors.blue[700],
            icon: Icon(
              Icons.confirmation_num,
              color: Colors.white,
            ),
            label: Text(
              "กดตรงนี้",
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
