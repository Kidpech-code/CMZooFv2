import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cmzoofv2/components/app_bar.dart';
import 'package:cmzoofv2/responsive.dart';
import 'package:cmzoofv2/service/fire_base/search_service.dart';
import 'package:cmzoofv2/util.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class SearchAnimal extends StatefulWidget {
  const SearchAnimal({Key? key}) : super(key: key);

  @override
  _SearchAnimalState createState() => _SearchAnimalState();
}

class _SearchAnimalState extends State<SearchAnimal> {
  var queryResultSet = [];
  var tempSearchStore = [];

  //function search
  initiaeSearch(value) {
    if (value.length == 0) {
      setState(() {
        queryResultSet = [];
        tempSearchStore = [];
      });
    }

    var capitalizedValue =
        value.substring(0, 1).toUpperCase() + value.substring(1);

    if (queryResultSet.length == 0 && value.length == 1) {
      SearchService().searchByName(value).then((QuerySnapshot docs) {
        for (int i = 0; i < docs.docs.length; ++i) {
          queryResultSet.add(docs.docs[i].data());
        }
      });
    } else {
      tempSearchStore = [];
      queryResultSet.forEach((element) {
        if (element['nameEng'].startsWith(capitalizedValue)) {
          setState(() {
            tempSearchStore.add(element);
          });
        }
      });
    }
  }

  Widget bgImg() {
    return Opacity(
      opacity: 1,
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/titlebg_1.jpg"),
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
          appBar: buildAppBar(
            context,
            title: 'Search Animal',
            actions: [],
            leading: EmptyMenu(),
          ),
          backgroundColor: Colors.transparent,
          body: ListView(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(10),
                child: TextField(
                  onChanged: (val) {
                    initiaeSearch(val);
                  },
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(left: 25),
                    hintText: 'Search by name',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              GridView.count(
                padding: EdgeInsets.only(left: 10, right: 10),
                crossAxisCount: 2,
                crossAxisSpacing: 4,
                mainAxisSpacing: 4,
                primary: false,
                shrinkWrap: true,
                children: tempSearchStore.map((element) {
                  return buildResultCard(element);
                }).toList(),
              ),
            ],
          ),
        ),
        CustomBackButtonS(),
      ],
    );
  }

  //สร้างตัวแปร
  Widget buildResultCard(data) {
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
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          //รูป
                          Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Container(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: Image.network(
                                  "${data['images']}",
                                  width: double.infinity,
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
                                fontWeight: FontWeight.bold,
                                fontFamily: 'mitr',
                                height: 1,
                              ),
                            ),
                            SizedBox(width: 2),
                            Text(
                              data['nameTH'] ?? "Not Found",
                              style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
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
                                fontWeight: FontWeight.bold,
                                fontFamily: 'mitr',
                                height: 1,
                              ),
                            ),
                            SizedBox(width: 2),
                            Text(
                              data['nameEng'] ?? "Not Found",
                              style: TextStyle(
                                color: Colors.teal,
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
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
                                fontWeight: FontWeight.bold,
                                fontFamily: 'mitr',
                                height: 1,
                              ),
                            ),
                            SizedBox(width: 2),
                            Text(
                              data['nameSci'] ?? "Not Found",
                              style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'mitr',
                                height: 1,
                              ),
                            ),
                          ]),
                          SizedBox(height: 10),
                          //สิ่งที่น่าสนใจ/ถื่นอาศัย/อาหาร
                          Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            color: Colors.teal[100],
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                //สิ่งที่น่าสนใจ
                                Container(
                                  margin: EdgeInsets.all(3),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.favorite,
                                        color: Colors.red[600],
                                      ),
                                      SizedBox(width: 2),
                                      Text(
                                        "สิ่งที่น่าสนใจ",
                                        style: TextStyle(
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'mitr',
                                          height: 1,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 2),
                                Container(
                                  margin: EdgeInsets.all(4),
                                  child: Text(
                                    data['interestingthing'] ?? "Not Found",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'mitr',
                                      height: 1.2,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 8),
                                //ถื่นอาศัย
                                Container(
                                  margin: EdgeInsets.all(3),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.filter_hdr,
                                        color: Colors.red[600],
                                      ),
                                      SizedBox(width: 2.0),
                                      Text(
                                        "ถื่นอาศัย",
                                        style: TextStyle(
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'mitr',
                                          height: 1,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 2),
                                Container(
                                  margin: EdgeInsets.all(3),
                                  child: Text(
                                    data['habitat'] ?? "Not Found",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'mitr',
                                      height: 1.2,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 8),
                                //อาหาร
                                Container(
                                  margin: EdgeInsets.all(3),
                                  child: Row(children: [
                                    Icon(
                                      Icons.restaurant,
                                      color: Colors.red[600],
                                    ),
                                    SizedBox(width: 2.0),
                                    Text(
                                      "อาหาร",
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'mitr',
                                        height: 1,
                                      ),
                                    ),
                                  ]),
                                ),
                                SizedBox(height: 2),
                                Container(
                                  margin: EdgeInsets.all(3),
                                  child: Text(
                                    data['food'] ?? "Not Found",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'mitr',
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
                            color: Colors.teal[200],
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                //พฤติกรรม
                                Container(
                                  margin: EdgeInsets.all(3),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.psychology,
                                        color: Colors.red[600],
                                      ),
                                      SizedBox(width: 2.0),
                                      Text(
                                        "พฤติกรรม",
                                        style: TextStyle(
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'mitr',
                                          height: 1,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 2),
                                Container(
                                  margin: EdgeInsets.all(3),
                                  child: Text(
                                    data['behavior'] ?? "Not Found",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'mitr',
                                      height: 1.2,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 8),
                                //สถานภาพปัจจุบัน
                                Container(
                                  margin: EdgeInsets.all(3),
                                  child: Row(children: [
                                    Icon(
                                      Icons.download_done_outlined,
                                      color: Colors.red[600],
                                    ),
                                    SizedBox(width: 2.0),
                                    Text(
                                      "สถานภาพปัจจุบัน",
                                      style: TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'mitr',
                                        height: 1,
                                      ),
                                    ),
                                  ]),
                                ),
                                SizedBox(height: 2),
                                Container(
                                  margin: EdgeInsets.all(3),
                                  child: Text(
                                    data['currentstatus'] ?? "Not Found",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'mitr',
                                      height: 1.2,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 8),
                                //อายุเฉลี่ย
                                Container(
                                  margin: EdgeInsets.all(3),
                                  child: Row(children: [
                                    Icon(
                                      Icons.filter_1,
                                      color: Colors.red[600],
                                    ),
                                    SizedBox(width: 2),
                                    Text(
                                      "อายุเฉลี่ย",
                                      style: TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'mitr',
                                        height: 1,
                                      ),
                                    ),
                                  ]),
                                ),
                                SizedBox(height: 2),
                                Container(
                                  margin: EdgeInsets.all(3),
                                  child: Text(
                                    data['ageavg'] ?? "Not Found",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'mitr',
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
                            color: Colors.teal[300],
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                //วัยเจริญพันธุ์
                                Container(
                                  margin: EdgeInsets.all(3),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.whatshot,
                                        color: Colors.red[600],
                                      ),
                                      SizedBox(width: 2.0),
                                      Text(
                                        "วัยเจริญพันธุ์",
                                        style: TextStyle(
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'mitr',
                                          height: 1,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 2),
                                Container(
                                  margin: EdgeInsets.all(3),
                                  child: Text(
                                    data['reproductiveage'] ?? "Not Found",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'mitr',
                                      height: 1.2,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 8),
                                //ขนาดและน้ำหนัก
                                Container(
                                  margin: EdgeInsets.all(3),
                                  child: Row(children: [
                                    Icon(
                                      Icons.format_size,
                                      color: Colors.red[600],
                                    ),
                                    SizedBox(width: 2),
                                    Text(
                                      "ขนาดและน้ำหนัก",
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'mitr',
                                        height: 1,
                                      ),
                                    ),
                                  ]),
                                ),
                                SizedBox(height: 2),
                                Container(
                                  margin: EdgeInsets.all(3),
                                  child: Text(
                                    data['sizeandweight'] ?? "Not Found",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'mitr',
                                      height: 1.2,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 8),
                                //สถานที่ชม
                                Container(
                                  margin: EdgeInsets.all(3),
                                  child: Row(children: [
                                    Icon(
                                      Icons.museum,
                                      color: Colors.red[600],
                                    ),
                                    SizedBox(width: 2),
                                    Text(
                                      "สถานที่ชม",
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'mitr',
                                        height: 1,
                                      ),
                                    ),
                                  ]),
                                ),
                                SizedBox(height: 2),
                                Container(
                                  margin: EdgeInsets.all(3),
                                  child: Text(
                                    data['placetowatch'] ?? "Not Found",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'mitr',
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
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Stack(
          children: [
            Hero(
              tag: data['id'],
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.network(
                  "${data['images']}",
                  width: double.infinity,
                  height: isTab(context) ? 400 : 250,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  width: double.infinity,
                  height: isTab(context) ? 100 : 45,
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: cardInfoDecoration,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            data['nameTH'] ?? "Not Found",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: isTab(context) ? 24 : 15,
                                fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            data['nameEng'] ?? "Not Found",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: isTab(context) ? 24 : 11,
                              fontWeight: FontWeight.w700,
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
  }
}

class CustomBackButtonS extends StatelessWidget {
  const CustomBackButtonS({
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
