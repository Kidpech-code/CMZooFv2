import 'package:cloud_firestore/cloud_firestore.dart';

class FBService {
  final CollectionReference _listbanner =
      FirebaseFirestore.instance.collection('list_banner');

  Future<List?> get getCarouselImage async {
    try {
      final data = await _listbanner.doc('HDHMpwE6pbo0xzxeZ6Lz').get();
      return data['img'];
    } catch (e) {
      return null;
    }
  }
}
