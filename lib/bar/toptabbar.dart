import 'package:flutter/material.dart';

class TopTabBar extends StatefulWidget {
  @override
  _TopTabBarState createState() => _TopTabBarState();
}

class _TopTabBarState extends State<TopTabBar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: TabBar(
          tabs: <Widget>[],
        ),
      ),
    );
  }
}
