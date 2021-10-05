import 'package:cmzoofv2/components/app_bar.dart';
import 'package:cmzoofv2/ui/pages/home/components/banner_places.dart';
import 'package:cmzoofv2/ui/pages/home/components/recommended.dart';
import 'package:cmzoofv2/ui/pages/home/components/recommended_places_fb.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  Widget bgImg() {
    return Opacity(
      opacity: 0.55,
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
            title: 'ZooNews',
            actions: [],
            leading: EmptyMenu(),
          ),
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Column(
              children: [
                BannerPlaces(),
                Recommended(),
                RecommendedPlacesFB(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
