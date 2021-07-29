import 'package:carousel_slider/carousel_slider.dart';
import 'package:cmzoofv2/Model/travel.dart';
import 'package:flutter/material.dart';

class BannerPlaces extends StatefulWidget {
  const BannerPlaces({
    Key? key,
  }) : super(key: key);

  @override
  State<BannerPlaces> createState() => _BannerPlacesState();
}

class _BannerPlacesState extends State<BannerPlaces> {
  int currentSlider = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 200,
      child: Column(
        children: [
          CarouselSlider(
            options: CarouselOptions(
              height: 200.0,
              enlargeCenterPage: true,
              autoPlay: true,
              aspectRatio: 16 / 9,
              autoPlayCurve: Curves.fastOutSlowIn,
              enableInfiniteScroll: true,
              autoPlayAnimationDuration: Duration(milliseconds: 800),
              viewportFraction: 0.8,
            ),
            items: [
              sliderItem(bannerNews[0]),
              sliderItem(bannerNews[1]),
              sliderItem(bannerNews[2]),
              sliderItem(bannerNews[3]),
              sliderItem(bannerNews[4]),
            ],
          ),
        ],
      ),
    );
  }

  Widget sliderItem(String img) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 172.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              image: DecorationImage(
                image: AssetImage(img),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
