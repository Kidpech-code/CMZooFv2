import 'package:flutter/material.dart';

class Travel {
  final int id;
  final String image;
  final String name;
  final String description;
  final String location;
  final double rating;

  Travel({
    required this.id,
    required this.image,
    required this.name,
    required this.description,
    required this.location,
    required this.rating,
  });
}
