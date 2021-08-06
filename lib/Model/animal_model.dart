import 'package:flutter/material.dart';

class Mammals {
  String mammalsImg;
  String mammalsname;
  Author_M author;
  String mammalsnameENG;

  Mammals(this.mammalsImg, this.mammalsname, this.mammalsnameENG, this.author);
}

class Author_M {
  String name;
  String nameEng;
  String nameSci;
  String interestingthing;
  String habitat;
  String food;
  String behavior;
  String currentstatus;
  String ageavg;
  String reproductiveage;
  String sizeandweight;
  String placetowatch;

  Author_M(
    this.name,
    this.nameEng,
    this.nameSci,
    this.interestingthing,
    this.habitat,
    this.food,
    this.behavior,
    this.currentstatus,
    this.ageavg,
    this.reproductiveage,
    this.sizeandweight,
    this.placetowatch,
  );
}

class Amphibian {
  String amphibianImg;
  String amphibianname;
  Author_A author;
  String amphibiannameENG;

  Amphibian(this.amphibianImg, this.amphibianname, this.amphibiannameENG,
      this.author);
}

class Author_A {
  String name;
  String nameEng;
  String nameSci;
  String interestingthing;
  String habitat;
  String food;
  String behavior;
  String currentstatus;
  String ageavg;
  String reproductiveage;
  String sizeandweight;
  String placetowatch;

  Author_A(
    this.name,
    this.nameEng,
    this.nameSci,
    this.interestingthing,
    this.habitat,
    this.food,
    this.behavior,
    this.currentstatus,
    this.ageavg,
    this.reproductiveage,
    this.sizeandweight,
    this.placetowatch,
  );
}

class Poultry {
  String poultryImg;
  String poultryname;
  Author_P author;
  String poultrynameENG;

  Poultry(this.poultryImg, this.poultryname, this.poultrynameENG, this.author);
}

class Author_P {
  String name;
  String nameEng;
  String nameSci;
  String interestingthing;
  String habitat;
  String food;
  String behavior;
  String currentstatus;
  String ageavg;
  String reproductiveage;
  String sizeandweight;
  String placetowatch;

  Author_P(
    this.name,
    this.nameEng,
    this.nameSci,
    this.interestingthing,
    this.habitat,
    this.food,
    this.behavior,
    this.currentstatus,
    this.ageavg,
    this.reproductiveage,
    this.sizeandweight,
    this.placetowatch,
  );
}

class Reptiles {
  String reptilesImg;
  String reptilesname;
  Author_R author;
  String reptilesnameENG;

  Reptiles(
      this.reptilesImg, this.reptilesname, this.reptilesnameENG, this.author);
}

class Author_R {
  String name;
  String nameEng;
  String nameSci;
  String interestingthing;
  String habitat;
  String food;
  String behavior;
  String currentstatus;
  String ageavg;
  String reproductiveage;
  String sizeandweight;
  String placetowatch;

  Author_R(
    this.name,
    this.nameEng,
    this.nameSci,
    this.interestingthing,
    this.habitat,
    this.food,
    this.behavior,
    this.currentstatus,
    this.ageavg,
    this.reproductiveage,
    this.sizeandweight,
    this.placetowatch,
  );
}

class Rareanimal {
  final int id;
  final String rareanimalName;
  final String rareanimalEngname;
  final String rareanimalImg;
  final String rareanimalType;
  final String description;
  final String location;

  Rareanimal({
    required this.id,
    required this.rareanimalImg,
    required this.rareanimalName,
    required this.rareanimalEngname,
    required this.rareanimalType,
    required this.description,
    required this.location,
  });
}

class Tryanimal {
  final int id;
  final String image;
  final String name;

  Tryanimal({
    required this.id,
    required this.image,
    required this.name,
  });
}
