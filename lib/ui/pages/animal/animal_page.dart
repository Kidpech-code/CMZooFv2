import 'package:cmzoofv2/components/app_bar.dart';
import 'package:cmzoofv2/ui/pages/animal/components/rare_recommended.dart';
import 'package:cmzoofv2/ui/pages/animal/components/rareanimal_recommended.dart';
import 'package:cmzoofv2/ui/pages/animal/components/type_categoris.dart';
import 'package:cmzoofv2/ui/pages/animal/components/type_animal.dart';
import 'package:flutter/material.dart';

class AnimalsPage extends StatelessWidget {
  const AnimalsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: buildAppBar(
        context,
        title: 'TypeAnimal',
        actions: [],
        leading: EmptyMenu(),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 5),
            TypeRemonmended(),
            TypeCategories(),
            RareRemonmended(),
            //RareAnimalRecommended(),
          ],
        ),
      ),
    );
  }
}
