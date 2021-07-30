import 'package:cmzoofv2/ui/pages/animal/animalpage.dart';
import 'package:cmzoofv2/ui/pages/home/home_page.dart';
import 'package:cmzoofv2/ui/pages/map/mappage.dart';
import 'package:cmzoofv2/ui/pages/ticket/ticketpage.dart';
import 'package:flutter/material.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';

class ConvexBar extends StatefulWidget {
  @override
  _ConvexBarState createState() => _ConvexBarState();
}

class _ConvexBarState extends State<ConvexBar> {
  int selectpage = 0;
  final _pageOption = [
    // DashboradPage(),
    HomePage(),
    AnimalPage(),
    //AquariumPage(),
    TicketPage(),
    //CarPage(),
    MapPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pageOption[selectpage],
      bottomNavigationBar: ConvexAppBar(
        backgroundColor: Colors.tealAccent[700],
        style: TabStyle.reactCircle,
        items: [
          TabItem(icon: Icons.home, title: "หน้าหลัก"),
          TabItem(icon: Icons.pets, title: "สัตว์"),
          //TabItem(icon: Icons.anchor, title: "อควาเรียม"),
          TabItem(icon: Icons.confirmation_num, title: "บัตรสวนสัตว์"),
          //TabItem(icon: Icons.airport_shuttle, title: "รถบริการ"),
          TabItem(icon: Icons.map, title: "แผนที่"),
        ],
        initialActiveIndex: selectpage,
        onTap: (int index) {
          setState(() {
            selectpage = index;
          });
        },
      ),
    );
  }
}
