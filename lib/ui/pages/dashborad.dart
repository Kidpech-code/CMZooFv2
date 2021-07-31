// import 'package:cmzoofv2/main.dart';
// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:cmzoofv2/ui/screen/list_item.dart';
// import 'package:cmzoofv2/ui/screen/slider_item.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';

// class DashboradPage extends StatefulWidget {
//   @override
//   _DashboradPageState createState() => _DashboradPageState();
// }
// //แจ้งเตือน
// Future<void> _showNotification() async {
//   const AndroidNotificationDetails androidNotificationDetails =
//       AndroidNotificationDetails(
//           'nextflow_noti_001', 'แจ้งเตือนทั่วไป', 'แจ้งเตือนด่วน',
//           importance: Importance.max,
//           priority: Priority.high,
//           ticker: 'ticker');
//   const NotificationDetails platformChannelDetails = NotificationDetails(
//     android: androidNotificationDetails,
//   );

//   await flutterLocalNotificationsPlugin.show(
//       0, 'สวนสัตว์เชียงใหม่', 'วันนี้มีกิจกรรมใหม่', platformChannelDetails);
// }

// class _DashboradPageState extends State<DashboradPage> {
//   List<String> zooImageNews = [
//     "images/clspanda.jpg",
//     "images/BannerNoPlastic.jpg",
//     "images/slider05.png",
//     "images/slider04.png",
//   ];

//   List<String> zooImageLocation = [
//     "images/unnamed.jpg",
//     "images/Hippo.jpg",
//     "images/park.jpg",
//     "images/park1.jpg",
//     "images/park2.jpg",
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.lightGreen[100],
//       appBar: AppBar(
//         centerTitle: true,
//         automaticallyImplyLeading: false,
//         backgroundColor: Colors.lightGreen[900],
//         title: Text(
//           'สวนสัตว์เชียงใหม่',
//           style: TextStyle(
//             fontSize: 20.0,
//             fontWeight: FontWeight.bold,
//             fontFamily: 'mitr',
//           ),
//         ),
//         actions: [
//           IconButton(
//             icon: Icon(Icons.notifications_none),
//             onPressed: () {
//               _showNotification();
//             },
//           ),
//         ],
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 10.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 "ข่าวสารทางสวนสัตว์",
//                 textAlign: TextAlign.left,
//                 style: TextStyle(
//                   color: Colors.green[900],
//                   fontSize: 26.0,
//                   fontWeight: FontWeight.bold,
//                   fontFamily: 'mitr',
//                 ),
//               ),
//               CarouselSlider(
//                 options: CarouselOptions(
//                   height: 200.0,
//                   enlargeCenterPage: true,
//                   autoPlay: true,
//                   aspectRatio: 16 / 9,
//                   autoPlayCurve: Curves.fastOutSlowIn,
//                   enableInfiniteScroll: true,
//                   autoPlayAnimationDuration: Duration(milliseconds: 800),
//                   viewportFraction: 0.8,
//                 ),
//                 items: [
//                   sliderItem(zooImageNews[0]),
//                   sliderItem(zooImageNews[1]),
//                   sliderItem(zooImageNews[2]),
//                   sliderItem(zooImageNews[3]),
//                 ],
//               ),
//               Text(
//                 "สถานที่แนะนำ",
//                 style: TextStyle(
//                   color: Colors.green[900],
//                   fontSize: 22.0,
//                   fontWeight: FontWeight.w600,
//                   fontFamily: 'mitr',
//                 ),
//               ),
//               Container(
//                 height: 500.0,
//                 width: double.infinity,
//                 child: ListView(
//                   scrollDirection: Axis.vertical,
//                   children: [
//                     listItem(zooImageLocation[0]),
//                     listItem(zooImageLocation[1]),
//                     listItem(zooImageLocation[2]),
//                     listItem(zooImageLocation[3]),
//                     listItem(zooImageLocation[4]),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
