class MapData {
  String namezone;
  String imgzone;
  Author detailzone;

  MapData(this.imgzone, this.namezone, this.detailzone);
}

List<MapData> zone() {
  return <MapData>[
    new MapData(
      "images/hz.png",
      "HUAYKAEW ZONE",
      Author(
          "1.สัตว์แอฟริกา 2.สัตว์แอฟริกา 3.นกฟลามิงโก 4.ฮิปโปโปเตมัส 5.สิงโต 6.เสือโคร่ง",
          "1.ห้องน้ำ 4 แห่ง 2.ร้านอาหาร 3 แห่ง 3.จุดรอรถ 3 แห่ง"),
    ),
    new MapData("images/sz.png", "SUTHEP ZONE", Author("", "")),
    new MapData("images/dz.png", "DOIPUI ZONE", Author("", "")),
    new MapData("images/wz.png", "WIENGJEDLIN ZONE", Author("", "")),
  ];
}

class Author {
  String animal;
  String place;

  Author(this.animal, this.place);
}
