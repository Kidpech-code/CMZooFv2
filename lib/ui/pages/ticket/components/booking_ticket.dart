import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cmzoofv2/responsive.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class BookingTicket extends StatefulWidget {
  const BookingTicket({Key? key}) : super(key: key);

  @override
  State<BookingTicket> createState() => _BookingTicketState();
}

class _BookingTicketState extends State<BookingTicket> {
  // ignore: non_constant_identifier_names
  CollectionReference _link_ticket =
      FirebaseFirestore.instance.collection("link_ticket");

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          FutureBuilder<QuerySnapshot>(
            future: _link_ticket.get(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Scaffold(
                  body: Center(
                    child: Text("Error: ${snapshot.error}"),
                  ),
                );
              }

              if (snapshot.connectionState == ConnectionState.done) {
                return Stack(
                  children: snapshot.data!.docs.map(
                    (document) {
                      return Row(
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
                            width: isLandscape(context) ? 550 : 118,
                          ),
                          // ignore: deprecated_member_use
                          RaisedButton.icon(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25)),
                            color: Colors.indigoAccent[400],
                            disabledColor: Colors.indigoAccent[400],
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
                              launch("${document['url']}");
                            },
                          ),
                        ],
                      );
                    },
                  ).toList(),
                );
              }

              return Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
