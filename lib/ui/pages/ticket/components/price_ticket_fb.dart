import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class PriceTicketFB extends StatefulWidget {
  const PriceTicketFB({Key? key}) : super(key: key);

  @override
  _PriceTicketFBState createState() => _PriceTicketFBState();
}

class _PriceTicketFBState extends State<PriceTicketFB> {
  final CollectionReference _pritceTicket =
      FirebaseFirestore.instance.collection("list_price");
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          FutureBuilder<QuerySnapshot>(
            future: _pritceTicket.get(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Scaffold(
                  body: Center(
                    child: Text("Error: ${snapshot.error}"),
                  ),
                );
              }
              //Collection Data Ready to display
              if (snapshot.connectionState == ConnectionState.done) {
                //Display the data inside a list view
                return Stack(
                  children: snapshot.data!.docs.map(
                    (document) {
                      return Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            //บัตรเข้าชมสวนสัตว์เชียงใหม่
                            Text(
                              document['ticket_cmz'] ?? " ",
                              style: TextStyle(
                                color: Colors.green[900],
                                fontSize: 22.0,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'mitr',
                              ),
                            ),
                            SizedBox(height: 8.0),
                            Container(
                              margin: EdgeInsets.only(bottom: 10.0),
                              width: double.infinity,
                              height: 50.0,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8.0),
                                  color: Colors.white),
                              child: Container(
                                padding: EdgeInsets.all(10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      document['cmz_adult'] ?? " ",
                                      style: TextStyle(
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'mitr',
                                      ),
                                    ),
                                    Text(
                                      document['pri_cmz_adult'] ?? " ",
                                      style: TextStyle(
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'mitr',
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(bottom: 10.0),
                              width: double.infinity,
                              height: 50.0,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8.0),
                                  color: Colors.white),
                              child: Container(
                                padding: EdgeInsets.all(10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      document['cmz_child'] ?? " ",
                                      style: TextStyle(
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'mitr',
                                      ),
                                    ),
                                    Text(
                                      document['pri_cmz_child'] ?? " ",
                                      style: TextStyle(
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'mitr',
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(bottom: 10.0),
                              width: double.infinity,
                              height: 50.0,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8.0),
                                  color: Colors.white),
                              child: Container(
                                padding: EdgeInsets.all(10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      document['cmz_student'] ?? " ",
                                      style: TextStyle(
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'mitr',
                                      ),
                                    ),
                                    Text(
                                      document['pri_cmz_student'] ?? " ",
                                      style: TextStyle(
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'mitr',
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(bottom: 10.0),
                              width: double.infinity,
                              height: 50.0,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8.0),
                                  color: Colors.white),
                              child: Container(
                                padding: EdgeInsets.all(10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      document['cmz_elderly'] ?? " ",
                                      style: TextStyle(
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'mitr',
                                      ),
                                    ),
                                    Text(
                                      document['pri_cmz_elderly'] ?? " ",
                                      style: TextStyle(
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'mitr',
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            //บัตรเข้าชมแพนด้า
                            Text(
                              document['ticket_panda'] ?? " ",
                              style: TextStyle(
                                color: Colors.green[900],
                                fontSize: 22.0,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'mitr',
                              ),
                            ),
                            SizedBox(height: 8.0),
                            Container(
                              margin: EdgeInsets.only(bottom: 10.0),
                              width: double.infinity,
                              height: 50.0,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8.0),
                                  color: Colors.white),
                              child: Container(
                                padding: EdgeInsets.all(10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      document['panda_adult'] ?? " ",
                                      style: TextStyle(
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'mitr',
                                      ),
                                    ),
                                    Text(
                                      document['pri_panda_adult'] ?? " ",
                                      style: TextStyle(
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'mitr',
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(bottom: 10.0),
                              width: double.infinity,
                              height: 50.0,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8.0),
                                  color: Colors.white),
                              child: Container(
                                padding: EdgeInsets.all(10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      document['panda_child'] ?? " ",
                                      style: TextStyle(
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'mitr',
                                      ),
                                    ),
                                    Text(
                                      document['pri_panda_child'] ?? " ",
                                      style: TextStyle(
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'mitr',
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            //บัตรเข้าชมเชียงใหม่ ซู อควาเรียม
                            Text(
                              document['ticket_aqu'] ?? " ",
                              style: TextStyle(
                                color: Colors.green[900],
                                fontSize: 22.0,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'mitr',
                              ),
                            ),
                            SizedBox(height: 8.0),
                            Container(
                              margin: EdgeInsets.only(bottom: 10.0),
                              width: double.infinity,
                              height: 50.0,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8.0),
                                  color: Colors.white),
                              child: Container(
                                padding: EdgeInsets.all(10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      document['aqu_adult'] ?? " ",
                                      style: TextStyle(
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'mitr',
                                      ),
                                    ),
                                    Text(
                                      document['pri_aqu_adult'] ?? " ",
                                      style: TextStyle(
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'mitr',
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(bottom: 10.0),
                              width: double.infinity,
                              height: 50.0,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8.0),
                                  color: Colors.white),
                              child: Container(
                                padding: EdgeInsets.all(10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      document['aqu_child'] ?? " ",
                                      style: TextStyle(
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'mitr',
                                      ),
                                    ),
                                    Text(
                                      document['pri_aqu_child'] ?? " ",
                                      style: TextStyle(
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'mitr',
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            //บัตรเข้าสวนน้ำสำหรับเด็ก
                            Text(
                              document['ticket_kid'] ?? " ",
                              style: TextStyle(
                                color: Colors.green[900],
                                fontSize: 22.0,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'mitr',
                              ),
                            ),
                            SizedBox(height: 8.0),
                            Container(
                              margin: EdgeInsets.only(bottom: 10.0),
                              width: double.infinity,
                              height: 50.0,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8.0),
                                  color: Colors.white),
                              child: Container(
                                padding: EdgeInsets.all(10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      document['kid_adult'] ?? " ",
                                      style: TextStyle(
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'mitr',
                                      ),
                                    ),
                                    Text(
                                      document['pri_kid_adult'] ?? " ",
                                      style: TextStyle(
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'mitr',
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(bottom: 10.0),
                              width: double.infinity,
                              height: 50.0,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8.0),
                                  color: Colors.white),
                              child: Container(
                                padding: EdgeInsets.all(10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      document['kid_child'] ?? " ",
                                      style: TextStyle(
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'mitr',
                                      ),
                                    ),
                                    Text(
                                      document['pri_kid_child'] ?? " ",
                                      style: TextStyle(
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'mitr',
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            //บัตรขึ้นรถบริการชมรอบสวนสัตว์
                            Text(
                              document['ticket_bus'] ?? " ",
                              style: TextStyle(
                                color: Colors.green[900],
                                fontSize: 22.0,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'mitr',
                              ),
                            ),
                            Text(
                              document['bus_des'] ?? " ",
                              style: TextStyle(
                                color: Colors.green[900],
                                fontSize: 13.5,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'mitr',
                              ),
                            ),
                            SizedBox(height: 8.0),
                            Container(
                              margin: EdgeInsets.only(bottom: 10.0),
                              width: double.infinity,
                              height: 50.0,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8.0),
                                  color: Colors.white),
                              child: Container(
                                padding: EdgeInsets.all(10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      document['bus_adult'] ?? " ",
                                      style: TextStyle(
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'mitr',
                                      ),
                                    ),
                                    Text(
                                      document['pri_bus_adult'] ?? " ",
                                      style: TextStyle(
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'mitr',
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(bottom: 10.0),
                              width: double.infinity,
                              height: 50.0,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8.0),
                                  color: Colors.white),
                              child: Container(
                                padding: EdgeInsets.all(10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      document['bus_child'] ?? " ",
                                      style: TextStyle(
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'mitr',
                                      ),
                                    ),
                                    Text(
                                      document['pri_bus_child'] ?? " ",
                                      style: TextStyle(
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'mitr',
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            //บริการเช่ารถกอล์ฟ
                            Text(
                              document['ticket_golf'] ?? " ",
                              style: TextStyle(
                                color: Colors.green[900],
                                fontSize: 22.0,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'mitr',
                              ),
                            ),
                            SizedBox(height: 8.0),
                            Container(
                              margin: EdgeInsets.only(bottom: 10.0),
                              width: double.infinity,
                              height: 50.0,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8.0),
                                  color: Colors.white),
                              child: Container(
                                padding: EdgeInsets.all(10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      document['golf_name'] ?? " ",
                                      style: TextStyle(
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'mitr',
                                      ),
                                    ),
                                    Text(
                                      document['pri_golf'] ?? " ",
                                      style: TextStyle(
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'mitr',
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            //บัตรจอดรถ
                            Text(
                              document['ticket_park'] ?? " ",
                              style: TextStyle(
                                color: Colors.green[900],
                                fontSize: 22.0,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'mitr',
                              ),
                            ),
                            SizedBox(height: 8.0),
                            Container(
                              margin: EdgeInsets.only(bottom: 10.0),
                              width: double.infinity,
                              height: 50.0,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8.0),
                                  color: Colors.white),
                              child: Container(
                                padding: EdgeInsets.all(10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      document['park_car'] ?? " ",
                                      style: TextStyle(
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'mitr',
                                      ),
                                    ),
                                    Text(
                                      document['pri_park_car'] ?? " ",
                                      style: TextStyle(
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'mitr',
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(bottom: 10.0),
                              width: double.infinity,
                              height: 50.0,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8.0),
                                  color: Colors.white),
                              child: Container(
                                padding: EdgeInsets.all(10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      document['park_motorcycle'] ?? " ",
                                      style: TextStyle(
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'mitr',
                                      ),
                                    ),
                                    Text(
                                      document['pri_park_motorcycle'] ?? " ",
                                      style: TextStyle(
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'mitr',
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(bottom: 10.0),
                              width: double.infinity,
                              height: 50.0,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8.0),
                                  color: Colors.white),
                              child: Container(
                                padding: EdgeInsets.all(10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      document['park_bicycle'] ?? " ",
                                      style: TextStyle(
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'mitr',
                                      ),
                                    ),
                                    Text(
                                      document['pri_park_bicycle'] ?? " ",
                                      style: TextStyle(
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'mitr',
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
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
          )
        ],
      ),
    );
  }
}
