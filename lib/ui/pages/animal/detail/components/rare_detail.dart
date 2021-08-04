import 'package:cmzoofv2/Model/animal_model.dart';
import 'package:cmzoofv2/components/app_bar.dart';
import 'package:cmzoofv2/components/custom_back_button.dart';
import 'package:cmzoofv2/ui/pages/animal/detail/components/rare_image.dart';
import 'package:cmzoofv2/ui/pages/animal/detail/components/rare_information.dart';
import 'package:flutter/material.dart';

class RareDetailsScreen extends StatelessWidget {
  const RareDetailsScreen({Key? key, required this.rare}) : super(key: key);

  final Rareanimal rare;

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
        children: [
          RareImage(rare: rare),
          RareInformation(rare: rare),
        ],
      ),
    );
  }
}
