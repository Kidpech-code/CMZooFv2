import 'package:cmzoofv2/Model/map_model.dart';

List<MapData> zone() {
  return <MapData>[
    new MapData(
      "images/hz.png",
      "HUAYKAEW ZONE",
      Author_Ma(
          "1.สัตว์แอฟริกา 2.สัตว์แอฟริกา 3.นกฟลามิงโก 4.ฮิปโปโปเตมัส 5.สิงโต 6.เสือโคร่ง",
          "1.ห้องน้ำ 4 แห่ง 2.ร้านอาหาร 3 แห่ง 3.จุดรอรถ 3 แห่ง"),
    ),
    new MapData("images/sz.png", "SUTHEP ZONE", Author_Ma("", "")),
    new MapData("images/dz.png", "DOIPUI ZONE", Author_Ma("", "")),
    new MapData("images/wz.png", "WIENGJEDLIN ZONE", Author_Ma("", "")),
  ];
}
