import 'package:cmzoofv2/service/data/ticketdata.dart';
import 'package:flutter/material.dart';

Widget detailTicket(TicketData ticket) {
  return Container(
    margin: EdgeInsets.only(bottom: 10.0),
    width: double.infinity,
    height: 50.0,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(8.0),
      color: Colors.green[200],
    ),
    child: Container(
      child: Row(
        children: [
          SizedBox(width: 10.0),
          Text(
            ticket.typeticket,
            style: TextStyle(
              fontSize: 15.0,
              fontWeight: FontWeight.bold,
              fontFamily: 'mitr',
            ),
          ),
          SizedBox(width: 120.0),
          Text(
            ticket.priceticket,
            style: TextStyle(
              fontSize: 15.0,
              fontWeight: FontWeight.bold,
              fontFamily: 'mitr',
            ),
          ),
        ],
      ),
    ),
  );
}
