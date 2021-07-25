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

  factory MammalFirebase.fromJson(String source) => MammalFirebase.fromMap(json.decode(source));

  @override
  String toString() => 'MammalFirebase(cover: $cover, nameeng: $nameeng, nameth: $nameth)';

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

