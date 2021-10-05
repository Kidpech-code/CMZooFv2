import 'package:carousel_slider/carousel_slider.dart';
import 'package:cmzoofv2/responsive.dart';
import 'package:cmzoofv2/service/fire_base/firebase.dart';
import 'package:flutter/material.dart';

class BannerPlaces extends StatefulWidget {
  const BannerPlaces({
    Key? key,
  }) : super(key: key);

  @override
  State<BannerPlaces> createState() => _BannerPlacesState();
}

class _BannerPlacesState extends State<BannerPlaces> {

  List imgs = [];

  get getCarouselImage async {
    final img = await FBService().getCarouselImage;
    print(img);
    setState(() {
      imgs = img!;
    });
  }

  @override
  Widget build(BuildContext context) {
    getCarouselImage;
    return SizedBox(
      width: double.infinity,
      height: isTab(context) ? 450 : 200,
      child: Column(
        children: [
          Stack(
            children: [
              CarouselSlider.builder(
                itemCount: imgs.length,
                itemBuilder: (context, i, idx) {
                  return Container(
                    height: isTab(context) ? 250 : 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      image: DecorationImage(
                        image: NetworkImage(imgs[i]),
                        fit: BoxFit.fill,
                      ),
                    ),
                  );
                },
                options: CarouselOptions(
                  height: isTab(context) ? 450 : 165,
                  enlargeCenterPage: true,
                  autoPlay: true,
                  aspectRatio: 16 / 9,
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enableInfiniteScroll: true,
                  autoPlayAnimationDuration: Duration(milliseconds: 800),
                  viewportFraction: 0.8,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
