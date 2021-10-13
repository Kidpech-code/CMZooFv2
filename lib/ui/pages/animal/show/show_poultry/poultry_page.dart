import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cmzoofv2/components/app_bar.dart';
import 'package:cmzoofv2/responsive.dart';
import 'package:cmzoofv2/util.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class ListPoultry extends StatefulWidget {
  const ListPoultry({Key? key}) : super(key: key);

  @override
  _ListPoultryState createState() => _ListPoultryState();
}

class _ListPoultryState extends State<ListPoultry> {
  final CollectionReference _poultry =
      FirebaseFirestore.instance.collection("list_poultry");

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
          appBar: buildAppBar(
            context,
            title: '',
            actions: [],
            leading: EmptyMenu(),
          ),
          body: Container(
            child: Stack(
              children: [
                FutureBuilder<QuerySnapshot>(
                  future: _poultry.get(),
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
                                                      //รูป
                                                      Card(
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(15),
                                                        ),
                                                        child: Container(
                                                          child: ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        15),
                                                            child:
                                                                Image.network(
                                                              "${document['images']}",
                                                              width: double
                                                                  .infinity,
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(height: 13),
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
                                                          document['nameTh'] ??
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
                                                      SizedBox(height: 3),
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
                                                          document['nameEng'] ??
                                                              "Animal engname",
                                                          style: TextStyle(
                                                            color: Colors.pink,
                                                            fontSize: 18.0,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontFamily: 'mitr',
                                                            height: 1,
                                                          ),
                                                        ),
                                                      ]),
                                                      SizedBox(height: 3),
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
                                                      //สิ่งที่น่าสนใจ/ถื่นอาศัย/อาหาร
                                                      Card(
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(15),
                                                        ),
                                                        color: Colors.pink[50],
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            //สิ่งที่น่าสนใจ
                                                            Container(
                                                              margin: EdgeInsets
                                                                  .all(3),
                                                              child: Row(
                                                                children: [
                                                                  Icon(
                                                                    Icons
                                                                        .favorite,
                                                                    color: Colors
                                                                            .red[
                                                                        600],
                                                                  ),
                                                                  SizedBox(
                                                                      width: 2),
                                                                  Text(
                                                                    "สิ่งที่น่าสนใจ",
                                                                    style:
                                                                        TextStyle(
                                                                      fontSize:
                                                                          18.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      fontFamily:
                                                                          'mitr',
                                                                      height: 1,
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            SizedBox(height: 2),
                                                            Container(
                                                              margin: EdgeInsets
                                                                  .all(4),
                                                              child: Text(
                                                                document[
                                                                        'interestingthing'] ??
                                                                    "Animal engname",
                                                                style:
                                                                    TextStyle(
                                                                  fontSize: 16,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  fontFamily:
                                                                      'mitr',
                                                                  height: 1.2,
                                                                ),
                                                              ),
                                                            ),
                                                            SizedBox(height: 8),
                                                            //ถื่นอาศัย
                                                            Container(
                                                              margin: EdgeInsets
                                                                  .all(3),
                                                              child: Row(
                                                                children: [
                                                                  Icon(
                                                                    Icons
                                                                        .filter_hdr,
                                                                    color: Colors
                                                                            .red[
                                                                        600],
                                                                  ),
                                                                  SizedBox(
                                                                      width:
                                                                          2.0),
                                                                  Text(
                                                                    "ถื่นอาศัย",
                                                                    style:
                                                                        TextStyle(
                                                                      fontSize:
                                                                          18.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      fontFamily:
                                                                          'mitr',
                                                                      height: 1,
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            SizedBox(height: 2),
                                                            Container(
                                                              margin: EdgeInsets
                                                                  .all(3),
                                                              child: Text(
                                                                document[
                                                                        'habitat'] ??
                                                                    "Animal engname",
                                                                style:
                                                                    TextStyle(
                                                                  fontSize: 16,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  fontFamily:
                                                                      'mitr',
                                                                  height: 1.2,
                                                                ),
                                                              ),
                                                            ),
                                                            SizedBox(height: 8),
                                                            //อาหาร
                                                            Container(
                                                              margin: EdgeInsets
                                                                  .all(3),
                                                              child: Row(
                                                                  children: [
                                                                    Icon(
                                                                      Icons
                                                                          .restaurant,
                                                                      color: Colors
                                                                              .red[
                                                                          600],
                                                                    ),
                                                                    SizedBox(
                                                                        width:
                                                                            2.0),
                                                                    Text(
                                                                      "อาหาร",
                                                                      style:
                                                                          TextStyle(
                                                                        fontSize:
                                                                            18,
                                                                        fontWeight:
                                                                            FontWeight.bold,
                                                                        fontFamily:
                                                                            'mitr',
                                                                        height:
                                                                            1,
                                                                      ),
                                                                    ),
                                                                  ]),
                                                            ),
                                                            SizedBox(height: 2),
                                                            Container(
                                                              margin: EdgeInsets
                                                                  .all(3),
                                                              child: Text(
                                                                document[
                                                                        'food'] ??
                                                                    "Animal engname",
                                                                style:
                                                                    TextStyle(
                                                                  fontSize: 16,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  fontFamily:
                                                                      'mitr',
                                                                  height: 1.2,
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      SizedBox(height: 8),
                                                      //พฤติกรรม/สถานภาพปัจจุบัน/อายุเฉลี่ย
                                                      Card(
                                                        color: Colors.pink[100],
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(15),
                                                        ),
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            //พฤติกรรม
                                                            Container(
                                                              margin: EdgeInsets
                                                                  .all(3),
                                                              child: Row(
                                                                children: [
                                                                  Icon(
                                                                    Icons
                                                                        .psychology,
                                                                    color: Colors
                                                                            .red[
                                                                        600],
                                                                  ),
                                                                  SizedBox(
                                                                      width:
                                                                          2.0),
                                                                  Text(
                                                                    "พฤติกรรม",
                                                                    style:
                                                                        TextStyle(
                                                                      fontSize:
                                                                          18.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      fontFamily:
                                                                          'mitr',
                                                                      height: 1,
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            SizedBox(height: 2),
                                                            Container(
                                                              margin: EdgeInsets
                                                                  .all(3),
                                                              child: Text(
                                                                document[
                                                                        'behavior'] ??
                                                                    "Animal engname",
                                                                style:
                                                                    TextStyle(
                                                                  fontSize: 16,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  fontFamily:
                                                                      'mitr',
                                                                  height: 1.2,
                                                                ),
                                                              ),
                                                            ),
                                                            SizedBox(height: 8),
                                                            //สถานภาพปัจจุบัน
                                                            Container(
                                                              margin: EdgeInsets
                                                                  .all(3),
                                                              child: Row(
                                                                  children: [
                                                                    Icon(
                                                                      Icons
                                                                          .download_done_outlined,
                                                                      color: Colors
                                                                              .red[
                                                                          600],
                                                                    ),
                                                                    SizedBox(
                                                                        width:
                                                                            2.0),
                                                                    Text(
                                                                      "สถานภาพปัจจุบัน",
                                                                      style:
                                                                          TextStyle(
                                                                        fontSize:
                                                                            18.0,
                                                                        fontWeight:
                                                                            FontWeight.bold,
                                                                        fontFamily:
                                                                            'mitr',
                                                                        height:
                                                                            1,
                                                                      ),
                                                                    ),
                                                                  ]),
                                                            ),
                                                            SizedBox(height: 2),
                                                            Container(
                                                              margin: EdgeInsets
                                                                  .all(3),
                                                              child: Text(
                                                                document[
                                                                        'currentstatus'] ??
                                                                    "Animal engname",
                                                                style:
                                                                    TextStyle(
                                                                  fontSize: 16,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  fontFamily:
                                                                      'mitr',
                                                                  height: 1.2,
                                                                ),
                                                              ),
                                                            ),
                                                            SizedBox(height: 8),
                                                            //อายุเฉลี่ย
                                                            Container(
                                                              margin: EdgeInsets
                                                                  .all(3),
                                                              child: Row(
                                                                  children: [
                                                                    Icon(
                                                                      Icons
                                                                          .filter_1,
                                                                      color: Colors
                                                                              .red[
                                                                          600],
                                                                    ),
                                                                    SizedBox(
                                                                        width:
                                                                            2),
                                                                    Text(
                                                                      "อายุเฉลี่ย",
                                                                      style:
                                                                          TextStyle(
                                                                        fontSize:
                                                                            18.0,
                                                                        fontWeight:
                                                                            FontWeight.bold,
                                                                        fontFamily:
                                                                            'mitr',
                                                                        height:
                                                                            1,
                                                                      ),
                                                                    ),
                                                                  ]),
                                                            ),
                                                            SizedBox(height: 2),
                                                            Container(
                                                              margin: EdgeInsets
                                                                  .all(3),
                                                              child: Text(
                                                                document[
                                                                        'ageavg'] ??
                                                                    "Animal engname",
                                                                style:
                                                                    TextStyle(
                                                                  fontSize: 16,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  fontFamily:
                                                                      'mitr',
                                                                  height: 1.2,
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      SizedBox(height: 8),
                                                      //วัยเจริญพันธุ์/ขนาดและน้ำหนัก/สถานที่ชม
                                                      Card(
                                                        color: Colors.pink[200],
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(15),
                                                        ),
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            //วัยเจริญพันธุ์
                                                            Container(
                                                              margin: EdgeInsets
                                                                  .all(3),
                                                              child: Row(
                                                                children: [
                                                                  Icon(
                                                                    Icons
                                                                        .whatshot,
                                                                    color: Colors
                                                                            .red[
                                                                        600],
                                                                  ),
                                                                  SizedBox(
                                                                      width:
                                                                          2.0),
                                                                  Text(
                                                                    "วัยเจริญพันธุ์",
                                                                    style:
                                                                        TextStyle(
                                                                      fontSize:
                                                                          18.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      fontFamily:
                                                                          'mitr',
                                                                      height: 1,
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            SizedBox(height: 2),
                                                            Container(
                                                              margin: EdgeInsets
                                                                  .all(3),
                                                              child: Text(
                                                                document[
                                                                        'reproductiveage'] ??
                                                                    "Animal engname",
                                                                style:
                                                                    TextStyle(
                                                                  fontSize: 16,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  fontFamily:
                                                                      'mitr',
                                                                  height: 1.2,
                                                                ),
                                                              ),
                                                            ),
                                                            SizedBox(height: 8),
                                                            //ขนาดและน้ำหนัก
                                                            Container(
                                                              margin: EdgeInsets
                                                                  .all(3),
                                                              child: Row(
                                                                  children: [
                                                                    Icon(
                                                                      Icons
                                                                          .format_size,
                                                                      color: Colors
                                                                              .red[
                                                                          600],
                                                                    ),
                                                                    SizedBox(
                                                                        width:
                                                                            2),
                                                                    Text(
                                                                      "ขนาดและน้ำหนัก",
                                                                      style:
                                                                          TextStyle(
                                                                        fontSize:
                                                                            18,
                                                                        fontWeight:
                                                                            FontWeight.bold,
                                                                        fontFamily:
                                                                            'mitr',
                                                                        height:
                                                                            1,
                                                                      ),
                                                                    ),
                                                                  ]),
                                                            ),
                                                            SizedBox(height: 2),
                                                            Container(
                                                              margin: EdgeInsets
                                                                  .all(3),
                                                              child: Text(
                                                                document[
                                                                        'sizeandweight'] ??
                                                                    "Animal engname",
                                                                style:
                                                                    TextStyle(
                                                                  fontSize: 16,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  fontFamily:
                                                                      'mitr',
                                                                  height: 1.2,
                                                                ),
                                                              ),
                                                            ),
                                                            SizedBox(height: 8),
                                                            //สถานที่ชม
                                                            Container(
                                                              margin: EdgeInsets
                                                                  .all(3),
                                                              child: Row(
                                                                  children: [
                                                                    Icon(
                                                                      Icons
                                                                          .museum,
                                                                      color: Colors
                                                                              .red[
                                                                          600],
                                                                    ),
                                                                    SizedBox(
                                                                        width:
                                                                            2),
                                                                    Text(
                                                                      "สถานที่ชม",
                                                                      style:
                                                                          TextStyle(
                                                                        fontSize:
                                                                            18,
                                                                        fontWeight:
                                                                            FontWeight.bold,
                                                                        fontFamily:
                                                                            'mitr',
                                                                        height:
                                                                            1,
                                                                      ),
                                                                    ),
                                                                  ]),
                                                            ),
                                                            SizedBox(height: 2),
                                                            Container(
                                                              margin: EdgeInsets
                                                                  .all(3),
                                                              child: Text(
                                                                document[
                                                                        'placetowatch'] ??
                                                                    "Animal engname",
                                                                style:
                                                                    TextStyle(
                                                                  fontSize: 16,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  fontFamily:
                                                                      'mitr',
                                                                  height: 1.2,
                                                                ),
                                                              ),
                                                            ),
                                                          ],
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
                                                        document['nameTh'] ??
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
                                                        document['nameEng'] ??
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
              ],
            ),
          ),
        ),
        //ลูกศรย้อนกลับ
        CustomBackButtonA(),
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
