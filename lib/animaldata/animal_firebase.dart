import 'dart:convert';

class AnimalFirebase {
  final String cover;
  final String nameeng;
  final String nameth;
  AnimalFirebase({
    required this.cover,
    required this.nameeng,
    required this.nameth,
  });

  AnimalFirebase copyWith({
    String? cover,
    String? nameeng,
    String? nameth,
  }) {
    return AnimalFirebase(
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

  factory AnimalFirebase.fromMap(Map<String, dynamic> map) {
    return AnimalFirebase(
      cover: map['cover'],
      nameeng: map['nameeng'],
      nameth: map['nameth'],
    );
  }

  String toJson() => json.encode(toMap());

  factory AnimalFirebase.fromJson(String source) => AnimalFirebase.fromMap(json.decode(source));

  @override
  String toString() => 'AnimalFirebase(cover: $cover, nameeng: $nameeng, nameth: $nameth)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is AnimalFirebase &&
      other.cover == cover &&
      other.nameeng == nameeng &&
      other.nameth == nameth;
  }

  @override
  int get hashCode => cover.hashCode ^ nameeng.hashCode ^ nameth.hashCode;
}
