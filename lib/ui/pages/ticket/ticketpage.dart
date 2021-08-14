import 'package:cmzoofv2/components/app_bar.dart';
import 'package:cmzoofv2/service/data/ticket_data/ticket_data.dart';
import 'package:cmzoofv2/ui/pages/ticket/components/booking_ticket.dart';
import 'package:cmzoofv2/ui/pages/ticket/components/price_ticket.dart';
import 'package:cmzoofv2/ui/pages/ticket/detail/detailticket.dart';
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

  

  Widget bgImg() {
    return Opacity(
      opacity: 0.5,
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/bg.jpg"),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        bgImg(),
        Scaffold(
          extendBody: true,
          backgroundColor: Colors.transparent,
          appBar: buildAppBar(
            context,
            title: 'Ticket',
            actions: [],
            leading: EmptyMenu(),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 16.0, horizontal: 18.0),
              child: Column(
                children: [
                  BookingTicket(),
                  PriceTicket(),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
