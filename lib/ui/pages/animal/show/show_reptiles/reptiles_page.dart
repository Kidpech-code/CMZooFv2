import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cmzoofv2/responsive.dart';
import 'package:cmzoofv2/util.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class ListReptiles extends StatefulWidget {
  const ListReptiles({Key? key}) : super(key: key);

  @override
  _ListReptilesState createState() => _ListReptilesState();
}

class _ListReptilesState extends State<ListReptiles> {
  final CollectionReference _reptiles =
      FirebaseFirestore.instance.collection("list_reptiles");

  Widget bgImg() {
    return Opacity(
      opacity: 0.6,
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
          backgroundColor: Colors.transparent,
          body: Container(
            child: Stack(
              children: [
                //ลูกศรย้อนกลับ
                FutureBuilder<QuerySnapshot>(
                  future: _reptiles.get(),
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
                      return SafeArea(
                        child: SingleChildScrollView(
                          child: GridView.count(
                            crossAxisCount: isLandscape(context) ? 3 : 2,
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            padding: isLandscape(context)
                                ? EdgeInsets.symmetric(
                                    vertical: 20, horizontal: 50)
                                : EdgeInsets.all(20),
                            mainAxisSpacing: 20,
                            crossAxisSpacing: 20,
                            childAspectRatio: 1.2,
                            children: snapshot.data!.docs.map(
                              (document) {
                                return GestureDetector(
                                  onTap: () {
                                    print("Hello word");
                                    showBarModalBottomSheet(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return SingleChildScrollView(
                                          padding: EdgeInsets.all(10),
                                          child: Container(
                                            child: Center(
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                mainAxisSize: MainAxisSize.max,
                                                children: <Widget>[
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .stretch,
                                                    children: [
                                                      Container(
                                                        height: 140,
                                                        child: Image.network(
                                                            "${document['images']} "),
                                                      ),
                                                      SizedBox(height: 10),
                                                      //ชื่อไทย
                                                      Row(children: [
                                                        Text(
                                                          "ชื่อไทย: ",
                                                          style: TextStyle(
                                                            fontSize: 18.0,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontFamily: 'mitr',
                                                            height: 1,
                                                          ),
                                                        ),
                                                        SizedBox(width: 2),
                                                        Text(
                                                          document['nameth'] ??
                                                              "Animal name",
                                                          style: TextStyle(
                                                            fontSize: 18.0,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontFamily: 'mitr',
                                                            height: 1,
                                                          ),
                                                        ),
                                                      ]),
                                                      //ชื่ออังกฤษ
                                                      Row(children: [
                                                        Text(
                                                          "ชื่ออังกฤษ: ",
                                                          style: TextStyle(
                                                            fontSize: 18.0,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontFamily: 'mitr',
                                                            height: 1,
                                                          ),
                                                        ),
                                                        SizedBox(width: 2),
                                                        Text(
                                                          document['nameeng'] ??
                                                              "Animal engname",
                                                          style: TextStyle(
                                                            fontSize: 18.0,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontFamily: 'mitr',
                                                            height: 1,
                                                          ),
                                                        ),
                                                      ]),
                                                      //ชื่อวิทยาศาสตร์
                                                      Row(children: [
                                                        Text(
                                                          "ชื่อวิทยาศาสตร์: ",
                                                          style: TextStyle(
                                                            fontSize: 18.0,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontFamily: 'mitr',
                                                            height: 1,
                                                          ),
                                                        ),
                                                        SizedBox(width: 2),
                                                        Text(
                                                          document['nameSci'] ??
                                                              "Animal engname",
                                                          style: TextStyle(
                                                            fontSize: 18.0,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontFamily: 'mitr',
                                                            height: 1,
                                                          ),
                                                        ),
                                                      ]),
                                                      SizedBox(height: 10),
                                                      //สิ่งที่น่าสนใจ
                                                      Row(children: [
                                                        Icon(
                                                          Icons.favorite,
                                                          color:
                                                              Colors.red[600],
                                                        ),
                                                        SizedBox(width: 2.0),
                                                        Text(
                                                          "สิ่งที่น่าสนใจ",
                                                          style: TextStyle(
                                                            fontSize: 18.0,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontFamily: 'mitr',
                                                            height: 1,
                                                          ),
                                                        ),
                                                      ]),
                                                      SizedBox(height: 2.0),
                                                      Text(
                                                        document[
                                                                'interestingthing'] ??
                                                            "Animal engname",
                                                        style: TextStyle(
                                                          fontSize: 18.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontFamily: 'mitr',
                                                          height: 1,
                                                        ),
                                                      ),
                                                      SizedBox(height: 8.0),
                                                      //ถื่นอาศัย
                                                      Row(children: [
                                                        Icon(
                                                          Icons.filter_hdr,
                                                          color:
                                                              Colors.red[600],
                                                        ),
                                                        SizedBox(width: 2.0),
                                                        Text(
                                                          "ถื่นอาศัย",
                                                          style: TextStyle(
                                                            fontSize: 18.0,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontFamily: 'mitr',
                                                            height: 1,
                                                          ),
                                                        ),
                                                      ]),
                                                      SizedBox(height: 2.0),
                                                      Text(
                                                        document['habitat'] ??
                                                            "Animal engname",
                                                        style: TextStyle(
                                                          fontSize: 18.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontFamily: 'mitr',
                                                          height: 1,
                                                        ),
                                                      ),
                                                      SizedBox(height: 8.0),
                                                      //อาหาร
                                                      Row(children: [
                                                        Icon(
                                                          Icons.restaurant,
                                                          color:
                                                              Colors.red[600],
                                                        ),
                                                        SizedBox(width: 2.0),
                                                        Text(
                                                          "อาหาร",
                                                          style: TextStyle(
                                                            fontSize: 18.0,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontFamily: 'mitr',
                                                            height: 1,
                                                          ),
                                                        ),
                                                      ]),
                                                      SizedBox(height: 2.0),
                                                      Text(
                                                        document['food'] ??
                                                            "Animal engname",
                                                        style: TextStyle(
                                                          fontSize: 18.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontFamily: 'mitr',
                                                          height: 1,
                                                        ),
                                                      ),
                                                      SizedBox(height: 8.0),
                                                      //พฤติกรรม
                                                      Row(children: [
                                                        Icon(
                                                          Icons.psychology,
                                                          color:
                                                              Colors.red[600],
                                                        ),
                                                        SizedBox(width: 2.0),
                                                        Text(
                                                          "พฤติกรรม",
                                                          style: TextStyle(
                                                            fontSize: 18.0,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontFamily: 'mitr',
                                                            height: 1,
                                                          ),
                                                        ),
                                                      ]),
                                                      SizedBox(height: 2.0),
                                                      Text(
                                                        document['behavior'] ??
                                                            "Animal engname",
                                                        style: TextStyle(
                                                          fontSize: 18.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontFamily: 'mitr',
                                                          height: 1,
                                                        ),
                                                      ),
                                                      SizedBox(height: 8.0),
                                                      //สถานภาพปัจจุบัน
                                                      Row(children: [
                                                        Icon(
                                                          Icons
                                                              .download_done_outlined,
                                                          color:
                                                              Colors.red[600],
                                                        ),
                                                        SizedBox(width: 2.0),
                                                        Text(
                                                          "สถานภาพปัจจุบัน",
                                                          style: TextStyle(
                                                            fontSize: 18.0,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontFamily: 'mitr',
                                                            height: 1,
                                                          ),
                                                        ),
                                                      ]),
                                                      SizedBox(height: 2.0),
                                                      Text(
                                                        document[
                                                                'currentstatus'] ??
                                                            "Animal engname",
                                                        style: TextStyle(
                                                          fontSize: 18.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontFamily: 'mitr',
                                                          height: 1,
                                                        ),
                                                      ),
                                                      SizedBox(height: 8.0),
                                                      //อายุเฉลี่ย
                                                      Row(children: [
                                                        Icon(
                                                          Icons.filter_1,
                                                          color:
                                                              Colors.red[600],
                                                        ),
                                                        SizedBox(width: 2.0),
                                                        Text(
                                                          "อายุเฉลี่ย",
                                                          style: TextStyle(
                                                            fontSize: 18.0,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontFamily: 'mitr',
                                                            height: 1,
                                                          ),
                                                        ),
                                                      ]),
                                                      SizedBox(height: 2.0),
                                                      Text(
                                                        document['ageavg'] ??
                                                            "Animal engname",
                                                        style: TextStyle(
                                                          fontSize: 18.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontFamily: 'mitr',
                                                          height: 1,
                                                        ),
                                                      ),
                                                      SizedBox(height: 8.0),
                                                      //วัยเจริญพันธุ์
                                                      Row(children: [
                                                        Icon(
                                                          Icons.whatshot,
                                                          color:
                                                              Colors.red[600],
                                                        ),
                                                        SizedBox(width: 2.0),
                                                        Text(
                                                          "วัยเจริญพันธุ์",
                                                          style: TextStyle(
                                                            fontSize: 18.0,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontFamily: 'mitr',
                                                            height: 1,
                                                          ),
                                                        ),
                                                      ]),
                                                      SizedBox(height: 2.0),
                                                      Text(
                                                        document[
                                                                'reproductiveage'] ??
                                                            "Animal engname",
                                                        style: TextStyle(
                                                          fontSize: 18.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontFamily: 'mitr',
                                                          height: 1,
                                                        ),
                                                      ),
                                                      SizedBox(height: 8.0),
                                                      //ขนาดและน้ำหนัก
                                                      Row(children: [
                                                        Icon(
                                                          Icons.format_size,
                                                          color:
                                                              Colors.red[600],
                                                        ),
                                                        SizedBox(width: 2.0),
                                                        Text(
                                                          "ขนาดและน้ำหนัก",
                                                          style: TextStyle(
                                                            fontSize: 18.0,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontFamily: 'mitr',
                                                            height: 1,
                                                          ),
                                                        ),
                                                      ]),
                                                      SizedBox(height: 2.0),
                                                      Text(
                                                        document[
                                                                'sizeandweight'] ??
                                                            "Animal engname",
                                                        style: TextStyle(
                                                          fontSize: 18.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontFamily: 'mitr',
                                                          height: 1,
                                                        ),
                                                      ),
                                                      SizedBox(height: 8.0),
                                                      //สถานที่ชม
                                                      Row(children: [
                                                        Icon(
                                                          Icons.museum,
                                                          color:
                                                              Colors.red[600],
                                                        ),
                                                        SizedBox(width: 2.0),
                                                        Text(
                                                          "สถานที่ชม",
                                                          style: TextStyle(
                                                            fontSize: 18.0,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontFamily: 'mitr',
                                                            height: 1,
                                                          ),
                                                        ),
                                                      ]),
                                                      SizedBox(height: 2.0),
                                                      Text(
                                                        document[
                                                                'placetowatch'] ??
                                                            "Animal engname",
                                                        style: TextStyle(
                                                          fontSize: 18.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontFamily: 'mitr',
                                                          height: 1,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  },
                                  //รูปสัตว์และชื่อ
                                  child: Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: Stack(
                                      children: [
                                        Hero(
                                          tag: document['id'],
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            child: Image.network(
                                              "${document['images']}",
                                              width: double.infinity,
                                              height:
                                                  isTab(context) ? 400 : 250,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Container(
                                              width: double.infinity,
                                              height: isTab(context) ? 100 : 45,
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 10, vertical: 5),
                                              decoration: cardInfoDecoration,
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    children: [
                                                      Text(
                                                        document['nameth'] ??
                                                            "Animal name",
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize:
                                                                isTab(context)
                                                                    ? 24
                                                                    : 15,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w700),
                                                      ),
                                                    ],
                                                  ),
                                                  Row(
                                                    children: [
                                                      Text(
                                                        document['nameeng'] ??
                                                            "Animal engname",
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize:
                                                              isTab(context)
                                                                  ? 24
                                                                  : 11,
                                                          fontWeight:
                                                              FontWeight.w700,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ).toList(),
                          ),
                        ),
                      );
                    }

                    // Loading State
                    return Scaffold(
                      body: Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  },
                ),
                CustomBackButtonA(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class CustomBackButtonA extends StatelessWidget {
  const CustomBackButtonA({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 40,
        left: 20,
      ),
      child: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Align(
          alignment: Alignment.topLeft,
          child: Container(
            height: 40.0,
            width: 40.0,
            decoration: BoxDecoration(
              color: Colors.green,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
