import 'package:cmzoofv2/responsive.dart';
import 'package:cmzoofv2/service/data/map_data/mapdata.dart';
import 'package:cmzoofv2/ui/pages/map/components/zone_gird_card.dart';
import 'package:cmzoofv2/ui/pages/map/detail/detail_zone.dart';
import 'package:flutter/material.dart';

class ZonePlace extends StatelessWidget {
  const ZonePlace({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GridView.count(
        crossAxisCount: isLandscape(context) ? 3 : 2,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        padding: isLandscape(context)
            ? EdgeInsets.symmetric(vertical: 20, horizontal: 50)
            : EdgeInsets.all(20),
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
        childAspectRatio: 1.2,
        children: List.generate(
          zonePlaces.length,
          (index) {
            return ZoneGridCard(
              zones: zonePlaces[index],
              //กดที่รูป
              tapEvent: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ZoneDetailScreen(
                      zones: zonePlaces[index],
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}