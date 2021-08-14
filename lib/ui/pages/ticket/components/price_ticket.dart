import 'package:cmzoofv2/service/data/ticket_data/ticket_data.dart';
import 'package:cmzoofv2/ui/pages/ticket/detail/detailticket.dart';
import 'package:flutter/material.dart';

class PriceTicket extends StatelessWidget {
  const PriceTicket({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
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
    );
  }
}
