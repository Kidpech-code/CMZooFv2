import 'package:cmzoofv2/Model/animal_model.dart';
import 'package:cmzoofv2/components/app_bar.dart';
import 'package:cmzoofv2/components/custom_back_button.dart';
import 'package:flutter/material.dart';

class Trydetail extends StatelessWidget {
  const Trydetail({
    Key? key,
    required this.menus,
  }) : super(key: key);

  final AnimalMenuModel menus;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      appBar: buildAppBar(
        context,
        title: '',
        actions: [],
        leading: CustomBackButton(
          tapEvent: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Stack(
        children: [],
      ),
    );
  }
}
