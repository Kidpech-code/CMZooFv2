import 'package:cmzoofv2/components/app_bar.dart';
import 'package:cmzoofv2/ui/pages/home/components/banner_places.dart';
import 'package:cmzoofv2/ui/pages/home/components/recommended.dart';
import 'package:cmzoofv2/ui/pages/home/components/recommended_places.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: buildAppBar(
        context,
        title: 'ZooNews',
        actions: [
          Notifi(),
        ],
        leading: EmptyMenu(),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // PlacesCategories(),
            BannerPlaces(),
            Recommended(),
            RecommendedPlaces(),
          ],
        ),
      ),
    );
  }
}
