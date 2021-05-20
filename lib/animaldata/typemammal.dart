import 'package:cmzoofv2/animaldata/animaldata.dart';
import 'package:flutter/material.dart';

class TypeMammal extends StatelessWidget {
  final Mammals mammals;

  TypeMammal({
    required this.mammals,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      //backgroundColor: Colors.lightGreen[100],
      body: Stack(
        children: [
          Container(
            child: Hero(
              tag: mammals.mammalsImg,
              child: Image.asset(
                mammals.mammalsImg,
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
          Padding(
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
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Icon(
                      Icons.arrow_back,
                      color: Colors.green[900],
                    ),
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: size.height * 0.75,
              padding: EdgeInsets.only(top: 65),
              decoration: BoxDecoration(
                color: Colors.green[100],
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.only(right: 32, left: 32, bottom: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            mammals.author.name,
                            style: TextStyle(
                              fontSize: 25.0,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'mitr',
                              height: 1,
                            ),
                          ),
                          SizedBox(height: 10.0),
                          Row(
                            children: [
                              Text(
                                "ชื่อภาษาอังกฤษ / ",
                                style: TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'mitr',
                                  height: 1,
                                ),
                              ),
                              Text(
                                mammals.author.nameEng,
                                style: TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'mitr',
                                  height: 1,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10.0),
                          Row(
                            children: [
                              Text(
                                "ชื่อวิทยาศาสตร์ / ",
                                style: TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'mitr',
                                  height: 1,
                                ),
                              ),
                              Text(
                                mammals.author.nameSci,
                                style: TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'mitr',
                                  height: 1,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10.0),
                          Expanded(
                            child: SingleChildScrollView(
                              physics: BouncingScrollPhysics(),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  //สิ่งที่น่าสนใจ
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.favorite,
                                        color: Colors.red[600],
                                      ),
                                      SizedBox(width: 2.0),
                                      Text(
                                        "สิ่งที่น่าสนใจ",
                                        style: TextStyle(
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'mitr',
                                          height: 1,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 2.0),
                                  Text(
                                    mammals.author.interestingthing,
                                    style: TextStyle(
                                      fontSize: 18.0,
                                      fontFamily: 'mitr',
                                      height: 1.15,
                                    ),
                                  ),
                                  SizedBox(height: 8.0),
                                  //ถื่นอาศัย
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.filter_hdr,
                                        color: Colors.green[600],
                                      ),
                                      SizedBox(width: 2.0),
                                      Text(
                                        "ถื่นอาศัย",
                                        style: TextStyle(
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'mitr',
                                          height: 1,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 2.0),
                                  Text(
                                    mammals.author.habitat,
                                    style: TextStyle(
                                      fontSize: 18.0,
                                      fontFamily: 'mitr',
                                      height: 1.15,
                                    ),
                                  ),
                                  SizedBox(height: 8.0),
                                  //อาหาร
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.restaurant,
                                        color: Colors.yellow[800],
                                      ),
                                      SizedBox(width: 2.0),
                                      Text(
                                        "อาหาร",
                                        style: TextStyle(
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'mitr',
                                          height: 1,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 2.0),
                                  Text(
                                    mammals.author.food,
                                    style: TextStyle(
                                      fontSize: 18.0,
                                      fontFamily: 'mitr',
                                      height: 1.15,
                                    ),
                                  ),
                                  SizedBox(height: 8.0),
                                  //พฤติกรรม
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.psychology,
                                        color: Colors.pink[600],
                                      ),
                                      SizedBox(width: 2.0),
                                      Text(
                                        "พฤติกรรม",
                                        style: TextStyle(
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'mitr',
                                          height: 1,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 2.0),
                                  Text(
                                    mammals.author.behavior,
                                    style: TextStyle(
                                      fontSize: 18.0,
                                      fontFamily: 'mitr',
                                      height: 1.15,
                                    ),
                                  ),
                                  SizedBox(height: 8.0),
                                  //สถานภาพปัจจุบัน
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.download_done_outlined,
                                        color: Colors.orange[600],
                                      ),
                                      SizedBox(width: 2.0),
                                      Text(
                                        "สถานภาพปัจจุบัน",
                                        style: TextStyle(
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'mitr',
                                          height: 1,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 2.0),
                                  Text(
                                    mammals.author.currentstatus,
                                    style: TextStyle(
                                      fontSize: 18.0,
                                      fontFamily: 'mitr',
                                      height: 1.15,
                                    ),
                                  ),
                                  SizedBox(height: 8.0),
                                  //อายุเฉลี่ย
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.filter_1,
                                        color: Colors.teal[700],
                                      ),
                                      SizedBox(width: 2.0),
                                      Text(
                                        "อายุเฉลี่ย",
                                        style: TextStyle(
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'mitr',
                                          height: 1,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 2.0),
                                  Text(
                                    mammals.author.ageavg,
                                    style: TextStyle(
                                      fontSize: 18.0,
                                      fontFamily: 'mitr',
                                      height: 1.15,
                                    ),
                                  ),
                                  SizedBox(height: 8.0),
                                  //วัยเจริญพันธุ์
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.whatshot,
                                        color: Colors.pinkAccent[400],
                                      ),
                                      SizedBox(width: 2.0),
                                      Text(
                                        "วัยเจริญพันธุ์",
                                        style: TextStyle(
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'mitr',
                                          height: 1,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 2.0),
                                  Text(
                                    mammals.author.reproductiveage,
                                    style: TextStyle(
                                      fontSize: 18.0,
                                      fontFamily: 'mitr',
                                      height: 1.15,
                                    ),
                                  ),
                                  SizedBox(height: 8.0),
                                  //ขนาดและน้ำหนัก
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.format_size,
                                        color: Colors.cyan[800],
                                      ),
                                      SizedBox(width: 2.0),
                                      Text(
                                        "ขนาดและน้ำหนัก",
                                        style: TextStyle(
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'mitr',
                                          height: 1,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 2.0),
                                  Text(
                                    mammals.author.sizeandweight,
                                    style: TextStyle(
                                      fontSize: 18.0,
                                      fontFamily: 'mitr',
                                      height: 1.15,
                                    ),
                                  ),
                                  SizedBox(height: 8.0),
                                  //สถานที่ชม
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.museum,
                                        color: Colors.blue[900],
                                      ),
                                      SizedBox(width: 2.0),
                                      Text(
                                        "สถานที่ชม",
                                        style: TextStyle(
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'mitr',
                                          height: 1,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 2.0),
                                  Text(
                                    mammals.author.placetowatch,
                                    style: TextStyle(
                                      fontSize: 18.0,
                                      fontFamily: 'mitr',
                                      height: 1.15,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 32, bottom: (size.height * 0.7)),
              child: Card(
                color: Colors.green[200],
                elevation: 4.0,
                clipBehavior: Clip.antiAlias,
                margin: EdgeInsets.all(0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(mammals.mammalsImg),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
