import 'package:cmzoofv2/responsive.dart';
import 'package:cmzoofv2/service/data/animal_data/rareanimal_data.dart';
import 'package:cmzoofv2/ui/pages/animal/components/grid_rare_card.dart';
import 'package:cmzoofv2/ui/pages/animal/detail/components/rare_detail.dart';
import 'package:flutter/material.dart';

class RareAnimalRecommended extends StatelessWidget {
  const RareAnimalRecommended({
    Key? key,
  }) : super(key: key);

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
          rareAnimal.length,
          (index) {
            return GridRareCard(
              rare: rareAnimal[index],
              //กดที่รูป
              tapEvent: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RareDetailsScreen(
                      rare: rareAnimal[index],
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
