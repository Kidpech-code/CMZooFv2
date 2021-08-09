import 'package:cmzoofv2/service/data/animal_data/animal_menu_data.dart';
import 'package:cmzoofv2/ui/pages/animal/components/grid_animal_menu.dart';
import 'package:cmzoofv2/ui/pages/animal/detail/components/try_detail.dart';
import 'package:flutter/material.dart';

class NewAnimalMenu extends StatelessWidget {
  const NewAnimalMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GridView.count(
        crossAxisCount: 2,
        childAspectRatio: 1,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 12),
        scrollDirection: Axis.horizontal,
        children: List.generate(
          getAnimalMenu.length,
          (index) {
            return GridAnimalMenu(
              menus: getAnimalMenu[index],
              tapEvent: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Trydetail(
                      menus: getAnimalMenu[index],
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
