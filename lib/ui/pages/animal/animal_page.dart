import 'package:cmzoofv2/components/app_bar.dart';
import 'package:cmzoofv2/ui/pages/animal/components/rare_recommended.dart';
import 'package:cmzoofv2/ui/pages/animal/components/rareanimal_recommended.dart';
import 'package:cmzoofv2/ui/pages/animal/components/type_categoris.dart';
import 'package:cmzoofv2/ui/pages/animal/components/type_animal.dart';
import 'package:flutter/material.dart';

class AnimalsPage extends StatelessWidget {
  const AnimalsPage({Key? key}) : super(key: key);

  Widget bgImg() {
    return Opacity(
      opacity: 0.6,
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
    //Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        bgImg(),
        Scaffold(
          extendBody: true,
          appBar: buildAppBar(
            context,
            title: 'Animal',
            actions: [],
            leading: EmptyMenu(),
          ),
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Column(
              children: [
                TypeRemonmended(),
                TypeCategories(),
                RareRemonmended(),
                RareAnimalRecommended(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
