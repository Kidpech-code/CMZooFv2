import 'package:cmzoofv2/responsive.dart';
import 'package:cmzoofv2/service/data/travel_banner/travel_data.dart';
import 'package:cmzoofv2/ui/pages/home/components/grid_place_card.dart';
import 'package:flutter/material.dart';

class RecommendedPlaces extends StatelessWidget {
  const RecommendedPlaces({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GridView.count(
        crossAxisCount: isLandscape(context) ? 3 : 2,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        padding: EdgeInsets.all(20),
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
        childAspectRatio: 1.2,
        children: List.generate(
          travelPlaces.length,
          (index) {
            return GridPlaceCard(
              place: travelPlaces[index],
              tapEvent: () {},
            );
          },
        ),
      ),
    );
  }
}
