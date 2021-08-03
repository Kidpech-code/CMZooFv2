import 'package:cmzoofv2/Model/travel.dart';
import 'package:cmzoofv2/components/app_bar.dart';
import 'package:cmzoofv2/components/custom_back_button.dart';
import 'package:cmzoofv2/ui/pages/details/components/place_image.dart';
import 'package:cmzoofv2/ui/pages/details/components/place_information.dart';
import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({Key? key, required this.travel}) : super(key: key);

  final Travel travel;

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
          PlaceImage(travel: travel),
          PlaceInformation(travel: travel),
        ],
      ),
    );
  }
}
