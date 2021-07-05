import 'dart:convert';

class MammalFirebase {
  final String cover;
  final String nameeng;
  final String nameth;
  MammalFirebase({
    required this.cover,
    required this.nameeng,
    required this.nameth,
  });

  MammalFirebase copyWith({
    String? cover,
    String? nameeng,
    String? nameth,
  }) {
    return MammalFirebase(
      cover: cover ?? this.cover,
      nameeng: nameeng ?? this.nameeng,
      nameth: nameth ?? this.nameth,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'cover': cover,
      'nameeng': nameeng,
      'nameth': nameth,
    };
  }

  factory MammalFirebase.fromMap(Map<String, dynamic> map) {
    return MammalFirebase(
      cover: map['cover'],
      nameeng: map['nameeng'],
      nameth: map['nameth'],
    );
  }

  String toJson() => json.encode(toMap());

  factory MammalFirebase.fromJson(String source) =>
      MammalFirebase.fromMap(json.decode(source));

  @override
  String toString() =>
      'AnimalFirebase(cover: $cover, nameeng: $nameeng, nameth: $nameth)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is MammalFirebase &&
        other.cover == cover &&
        other.nameeng == nameeng &&
        other.nameth == nameth;
  }

  @override
  int get hashCode => cover.hashCode ^ nameeng.hashCode ^ nameth.hashCode;
}

class DataMammalFB {
  final String img;
  final String nameth;
  final String nameeng;
  final String nameSci;
  final String interestingthing;
  final String habitat;
  final String food;
  final String behavior;
  final String currentstatus;
  final String ageavg;
  final String reproductiveage;
  final String sizeandweight;
  final String placetowatch;
  DataMammalFB({
    required this.img,
    required this.nameth,
    required this.nameeng,
    required this.nameSci,
    required this.interestingthing,
    required this.habitat,
    required this.food,
    required this.behavior,
    required this.currentstatus,
    required this.ageavg,
    required this.reproductiveage,
    required this.sizeandweight,
    required this.placetowatch,
  });
  

  DataMammalFB copyWith({
    String? img,
    String? nameth,
    String? nameEng,
    String? nameSci,
    String? interestingthing,
    String? habitat,
    String? food,
    String? behavior,
    String? currentstatus,
    String? ageavg,
    String? reproductiveage,
    String? sizeandweight,
    String? placetowatch,
  }) {
    return DataMammalFB(
      img: img ?? this.img,
      nameth: nameth ?? this.nameth,
      nameeng: nameEng ?? this.nameeng,
      nameSci: nameSci ?? this.nameSci,
      interestingthing: interestingthing ?? this.interestingthing,
      habitat: habitat ?? this.habitat,
      food: food ?? this.food,
      behavior: behavior ?? this.behavior,
      currentstatus: currentstatus ?? this.currentstatus,
      ageavg: ageavg ?? this.ageavg,
      reproductiveage: reproductiveage ?? this.reproductiveage,
      sizeandweight: sizeandweight ?? this.sizeandweight,
      placetowatch: placetowatch ?? this.placetowatch,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'img': img,
      'nameth': nameth,
      'nameEng': nameeng,
      'nameSci': nameSci,
      'interestingthing': interestingthing,
      'habitat': habitat,
      'food': food,
      'behavior': behavior,
      'currentstatus': currentstatus,
      'ageavg': ageavg,
      'reproductiveage': reproductiveage,
      'sizeandweight': sizeandweight,
      'placetowatch': placetowatch,
    };
  }

  factory DataMammalFB.fromMap(Map<String, dynamic> map) {
    return DataMammalFB(
      img: map['img'],
      nameth: map['nameth'],
      nameeng: map['nameeng'],
      nameSci: map['nameSci'],
      interestingthing: map['interestingthing'],
      habitat: map['habitat'],
      food: map['food'],
      behavior: map['behavior'],
      currentstatus: map['currentstatus'],
      ageavg: map['ageavg'],
      reproductiveage: map['reproductiveage'],
      sizeandweight: map['sizeandweight'],
      placetowatch: map['placetowatch'],
    );
  }

  String toJson() => json.encode(toMap());

  factory DataMammalFB.fromJson(String source) => DataMammalFB.fromMap(json.decode(source));

  @override
  String toString() {
    return 'DataMammalFB(img: $img, nameth: $nameth, nameEng: $nameeng, nameSci: $nameSci, interestingthing: $interestingthing, habitat: $habitat, food: $food, behavior: $behavior, currentstatus: $currentstatus, ageavg: $ageavg, reproductiveage: $reproductiveage, sizeandweight: $sizeandweight, placetowatch: $placetowatch)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is DataMammalFB &&
      other.img == img &&
      other.nameth == nameth &&
      other.nameeng == nameeng &&
      other.nameSci == nameSci &&
      other.interestingthing == interestingthing &&
      other.habitat == habitat &&
      other.food == food &&
      other.behavior == behavior &&
      other.currentstatus == currentstatus &&
      other.ageavg == ageavg &&
      other.reproductiveage == reproductiveage &&
      other.sizeandweight == sizeandweight &&
      other.placetowatch == placetowatch;
  }

  @override
  int get hashCode {
    return img.hashCode ^
      nameth.hashCode ^
      nameeng.hashCode ^
      nameSci.hashCode ^
      interestingthing.hashCode ^
      habitat.hashCode ^
      food.hashCode ^
      behavior.hashCode ^
      currentstatus.hashCode ^
      ageavg.hashCode ^
      reproductiveage.hashCode ^
      sizeandweight.hashCode ^
      placetowatch.hashCode;
  }
}
