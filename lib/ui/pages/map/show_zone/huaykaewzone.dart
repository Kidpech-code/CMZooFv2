// import 'package:cmzoofv2/Model/map_model.dart';
// import 'package:flutter/material.dart';

// class HuaykaewZone extends StatelessWidget {
//   final MapData hzs;

//   HuaykaewZone({
//     required this.hzs,
//   });

//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return Scaffold(
//       body: Stack(
//         children: [
//           Container(
//             child: Hero(
//               tag: hzs.imgzone,
//               child: Image.asset(
//                 hzs.imgzone,
//                 fit: BoxFit.fitWidth,
//               ),
//             ),
//           ),
//           Padding(
//             padding: EdgeInsets.only(
//               top: 40,
//               left: 20,
//             ),
//             child: GestureDetector(
//               onTap: () {
//                 Navigator.pop(context);
//               },
//               child: Align(
//                 alignment: Alignment.topLeft,
//                 child: Container(
//                   height: 40.0,
//                   width: 40.0,
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     shape: BoxShape.circle,
//                   ),
//                   child: Center(
//                     child: Icon(
//                       Icons.arrow_back,
//                       color: Colors.green[900],
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ),
//           Align(
//             alignment: Alignment.bottomCenter,
//             child: Container(
//               height: size.height * 0.75,
//               padding: EdgeInsets.only(top: 65),
//               decoration: BoxDecoration(
//                 color: Colors.green[100],
//                 borderRadius: BorderRadius.only(
//                   topLeft: Radius.circular(40),
//                 ),
//               ),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.stretch,
//                 children: [
//                   Expanded(
//                     child: Container(
//                       padding: EdgeInsets.only(right: 32, left: 32, bottom: 16),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.stretch,
//                         children: [
//                           Expanded(
//                             child: SingleChildScrollView(
//                               physics: BouncingScrollPhysics(),
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.stretch,
//                                 children: [
//                                   //???????????????????????????
//                                   Row(
//                                     children: [
//                                       Icon(
//                                         Icons.restaurant,
//                                         color: Colors.red[600],
//                                       ),
//                                       SizedBox(width: 2.0),
//                                       Text(
//                                         "??????????????????????????? 3 ?????????",
//                                         style: TextStyle(
//                                           fontSize: 20.0,
//                                           fontWeight: FontWeight.bold,
//                                           fontFamily: 'mitr',
//                                           height: 1,
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                   SizedBox(height: 8.0),
//                                   //?????????????????????
//                                   Row(
//                                     children: [
//                                       Icon(
//                                         Icons.wc,
//                                         color: Colors.green[600],
//                                       ),
//                                       SizedBox(width: 2.0),
//                                       Text(
//                                         "????????????????????? 4 ?????????",
//                                         style: TextStyle(
//                                           fontSize: 20.0,
//                                           fontWeight: FontWeight.bold,
//                                           fontFamily: 'mitr',
//                                           height: 1,
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                   SizedBox(height: 8.0),
//                                   //?????????????????????
//                                   Row(
//                                     children: [
//                                       Icon(
//                                         Icons.restaurant,
//                                         color: Colors.yellow[800],
//                                       ),
//                                       SizedBox(width: 2.0),
//                                       Text(
//                                         "????????????????????? 2 ?????????",
//                                         style: TextStyle(
//                                           fontSize: 20.0,
//                                           fontWeight: FontWeight.bold,
//                                           fontFamily: 'mitr',
//                                           height: 1,
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                   SizedBox(height: 8.0),
//                                   //???????????????
//                                   Row(
//                                     children: [
//                                       Icon(
//                                         Icons.pets,
//                                         color: Colors.pink[600],
//                                       ),
//                                       SizedBox(width: 2.0),
//                                       Text(
//                                         "??????????????????????????????",
//                                         style: TextStyle(
//                                           fontSize: 20.0,
//                                           fontWeight: FontWeight.bold,
//                                           fontFamily: 'mitr',
//                                           height: 1,
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                   SizedBox(height: 2.0),
//                                   Text(
//                                     "    1.????????????????????????????????????",
//                                     style: TextStyle(
//                                       fontSize: 18.0,
//                                       fontFamily: 'mitr',
//                                       height: 1.15,
//                                     ),
//                                   ),
//                                   SizedBox(height: 8.0),
//                                   Text(
//                                     "    2.?????????????????????????????????????????????",
//                                     style: TextStyle(
//                                       fontSize: 18.0,
//                                       fontFamily: 'mitr',
//                                       height: 1.15,
//                                     ),
//                                   ),
//                                   SizedBox(height: 8.0),
//                                   Text(
//                                     "    3.????????????????????????????????????",
//                                     style: TextStyle(
//                                       fontSize: 18.0,
//                                       fontFamily: 'mitr',
//                                       height: 1.15,
//                                     ),
//                                   ),
//                                   SizedBox(height: 8.0),
//                                   Text(
//                                     "    4.??????????????????????????????",
//                                     style: TextStyle(
//                                       fontSize: 18.0,
//                                       fontFamily: 'mitr',
//                                       height: 1.15,
//                                     ),
//                                   ),
//                                   SizedBox(height: 8.0),
//                                   Text(
//                                     "    5.??????????????????",
//                                     style: TextStyle(
//                                       fontSize: 18.0,
//                                       fontFamily: 'mitr',
//                                       height: 1.15,
//                                     ),
//                                   ),
//                                   SizedBox(height: 8.0),
//                                   Text(
//                                     "    6.????????????????????????",
//                                     style: TextStyle(
//                                       fontSize: 18.0,
//                                       fontFamily: 'mitr',
//                                       height: 1.15,
//                                     ),
//                                   ),
//                                   SizedBox(height: 8.0),
//                                   Text(
//                                     "    7.???????????????",
//                                     style: TextStyle(
//                                       fontSize: 18.0,
//                                       fontFamily: 'mitr',
//                                       height: 1.15,
//                                     ),
//                                   ),
//                                   SizedBox(height: 8.0),
//                                   Text(
//                                     "    8.???????????????????????????",
//                                     style: TextStyle(
//                                       fontSize: 18.0,
//                                       fontFamily: 'mitr',
//                                       height: 1.15,
//                                     ),
//                                   ),
//                                   SizedBox(height: 8.0),
//                                   Text(
//                                     "    9.??????????????????????????????",
//                                     style: TextStyle(
//                                       fontSize: 18.0,
//                                       fontFamily: 'mitr',
//                                       height: 1.15,
//                                     ),
//                                   ),
//                                   SizedBox(height: 8.0),
//                                   Text(
//                                     "    10.????????????????????????",
//                                     style: TextStyle(
//                                       fontSize: 18.0,
//                                       fontFamily: 'mitr',
//                                       height: 1.15,
//                                     ),
//                                   ),
//                                   SizedBox(height: 8.0),
//                                   Text(
//                                     "    11.??????????????????",
//                                     style: TextStyle(
//                                       fontSize: 18.0,
//                                       fontFamily: 'mitr',
//                                       height: 1.15,
//                                     ),
//                                   ),
//                                   SizedBox(height: 8.0),
//                                   Text(
//                                     "    12.???????????????????????????",
//                                     style: TextStyle(
//                                       fontSize: 18.0,
//                                       fontFamily: 'mitr',
//                                       height: 1.15,
//                                     ),
//                                   ),
//                                   SizedBox(height: 8.0),
//                                   Text(
//                                     "    13.????????????????????????",
//                                     style: TextStyle(
//                                       fontSize: 18.0,
//                                       fontFamily: 'mitr',
//                                       height: 1.15,
//                                     ),
//                                   ),
//                                   SizedBox(height: 8.0),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   )
//                 ],
//               ),
//             ),
//           ),
//           Align(
//             alignment: Alignment.bottomLeft,
//             child: Padding(
//               padding: EdgeInsets.only(left: 32, bottom: (size.height * 0.7)),
//               child: Card(
//                 color: Colors.green[200],
//                 elevation: 4.0,
//                 clipBehavior: Clip.antiAlias,
//                 margin: EdgeInsets.all(0),
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(12.0),
//                 ),
//                 child: Container(
//                   width: 100,
//                   height: 100,
//                   decoration: BoxDecoration(
//                     image: DecorationImage(
//                       image: AssetImage(hzs.imgzone),
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
