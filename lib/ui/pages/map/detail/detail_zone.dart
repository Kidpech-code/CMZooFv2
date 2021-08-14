import 'package:cmzoofv2/Model/map_model.dart';
import 'package:cmzoofv2/components/app_bar.dart';
import 'package:cmzoofv2/components/custom_back_button.dart';
import 'package:cmzoofv2/ui/pages/map/components/zone_informtion.dart';
import 'package:cmzoofv2/ui/pages/map/components/zone_place_img.dart';
import 'package:flutter/material.dart';

class ZoneDetailScreen extends StatelessWidget {
  const ZoneDetailScreen({
    Key? key,
    required this.zones,
  }) : super(key: key);

  final ZoneData zones;

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
          ZonePlaceImage(zones: zones),
          ZoneInformation(zones: zones),
        ],
      ),
    );
  }
}
