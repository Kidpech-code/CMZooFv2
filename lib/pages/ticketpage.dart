import 'package:cmzoofv2/data/ticketdata.dart';
import 'package:cmzoofv2/detail/detailticket.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class TicketPage extends StatefulWidget {
  @override
  _TicketPageState createState() => _TicketPageState();
}

class _TicketPageState extends State<TicketPage> {
  //เชื่อมเว็บ
  void openurl() {
    String url = "https://www.eventpop.me/e/9199/chiangmaizoo";
    launch(url);
  }

  List<TicketData> ticket = [
    //บัตรเข้าชมสวนสัตว์เชียงใหม่
    new TicketData("ผู้ใหญ่", "                   100 บาท"),
    new TicketData("เด็ก  ", "                     20 บาท"),
    new TicketData("นักเรียน", "                  50 บาท"),
    new TicketData("ผู้สูงอายุเกิน 60 ปีขึ้นไป", "เข้าชมฟรี"),
    //บัตรเข้าชมแพนด้า
    new TicketData("ผู้ใหญ่", "                    50 บาท"),
    new TicketData("เด็ก  ", "                    20 บาท"),
    //บัตรเข้าชมเชียงใหม่ ซู อควาเรียม
    new TicketData("ผู้ใหญ่", "                   250 บาท"),
    new TicketData("เด็ก  ", "                   180 บาท"),
    //บัตรเข้าสวนน้ำสำหรับเด็ก
    new TicketData("ผู้ใหญ่", "                   50 บาท"),
    new TicketData("เด็ก", "                     30 บาท"),
    //บัตรขึ้นรถบริการชมรอบสวนสัตว์
    new TicketData("ผู้ใหญ่", "                   40 บาท"),
    new TicketData("เด็ก", "                      25 บาท"),
    //บริการเช่ารถกอล์ฟ
    new TicketData("บริการเช่ารถกอล์ฟ", "350 บาท/ขั่วโมง"),
    //บัตรจอดรถ
    new TicketData("บัตรจอดรถยนต์", "         50 บาท"),
    new TicketData("บัตรจอดรถจักรยานยนต์", "10 บาท"),
    new TicketData("บัตรจอดรถจักรยาน", "      1 บาท"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreen[100],
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.lightGreen[900],
        title: Text(
          'ราคาบัตรต่างๆ',
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'mitr',
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 18.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
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
                    width: 145.0,
                  ),
                  // ignore: deprecated_member_use
                  RaisedButton.icon(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25)),
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
              Text(
                "บัตรเข้าชมสวนสัตว์เชียงใหม่",
                style: TextStyle(
                  color: Colors.green[900],
                  fontSize: 22.0,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'mitr',
                ),
              ),
              SizedBox(
                height: 8.0,
              ),
              detailTicket(ticket[0]),
              detailTicket(ticket[1]),
              detailTicket(ticket[2]),
              detailTicket(ticket[3]),
              Text(
                "บัตรเข้าชมแพนด้า",
                style: TextStyle(
                  color: Colors.green[900],
                  fontSize: 22.0,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'mitr',
                ),
              ),
              SizedBox(
                height: 8.0,
              ),
              detailTicket(ticket[4]),
              detailTicket(ticket[5]),
              Text(
                "บัตรเข้าชมเชียงใหม่ ซู อควาเรียม",
                style: TextStyle(
                  color: Colors.green[900],
                  fontSize: 22.0,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'mitr',
                ),
              ),
              SizedBox(
                height: 8.0,
              ),
              detailTicket(ticket[6]),
              detailTicket(ticket[7]),
              Text(
                "บัตรเข้าสวนน้ำสำหรับเด็ก",
                style: TextStyle(
                  color: Colors.green[900],
                  fontSize: 22.0,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'mitr',
                ),
              ),
              SizedBox(
                height: 8.0,
              ),
              detailTicket(ticket[8]),
              detailTicket(ticket[9]),
              Text(
                "บัตรขึ้นรถบริการชมรอบสวนสัตว์",
                style: TextStyle(
                  color: Colors.green[900],
                  fontSize: 22.0,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'mitr',
                ),
              ),
              Text(
                "รถบริการชมรอบสวนสัตว์ เริ่มให้บริการตั้งแต่เวลา 8:30-16:30 น. รถออกทุกๆ 10 นาที ถ้ารถเต็มก็จะออกก่อนเวลา",
                style: TextStyle(
                  color: Colors.green[900],
                  fontSize: 15.0,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'mitr',
                ),
              ),
              SizedBox(
                height: 8.0,
              ),
              detailTicket(ticket[10]),
              detailTicket(ticket[11]),
              Text(
                "บริการเช่ารถกอล์ฟ",
                style: TextStyle(
                  color: Colors.green[900],
                  fontSize: 22.0,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'mitr',
                ),
              ),
              SizedBox(
                height: 8.0,
              ),
              detailTicket(ticket[12]),
              Text(
                "บัตรจอดรถ",
                style: TextStyle(
                  color: Colors.green[900],
                  fontSize: 22.0,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'mitr',
                ),
              ),
              SizedBox(
                height: 8.0,
              ),
              detailTicket(ticket[13]),
              detailTicket(ticket[14]),
              detailTicket(ticket[15]),
            ],
          ),
        ),
      ),
    );
  }
}
