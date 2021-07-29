import 'package:flutter/material.dart';

List<String> bannerNews = [
  "images/clspanda.jpg",
  "images/BannerNoPlastic.jpg",
  "images/unnamed.jpg",
  "images/slider05.png",
  "images/slider04.png",
];

class Travel {
  final int id;
  final String image;

  Travel({
    required this.id,
    required this.image,
  });
}

// demo places

List<Travel> travelPlaces = [
  Travel(
    id: 1,
    image: 'images/unnamed.jpg',
  ),
  Travel(
    id: 2,
    image: 'images/park.jpg',
  ),
  Travel(
    id: 3,
    image: 'images/park1.jpg',
  ),
  Travel(
    id: 4,
    image: 'images/park2.jpg',
  ),
  Travel(
    id: 5,
    image: 'images/Hippo.jpg',
  ),
  Travel(
    id: 6,
    image: 'images/slider04.png',
  ),
];
