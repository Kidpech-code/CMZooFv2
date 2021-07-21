import 'package:cloud_firestore/cloud_firestore.dart';

class Firebase {
  Future<String?> getData({
    required String path,
  }) async {
    final reference = FirebaseFirestore.instance.doc(path);
    try {
    final docSnapshot = await reference.get();
    if (docSnapshot.exists){
      return docSnapshot.data().toString();
    }
    return null;
  } catch (e) {
    rethrow;
  }
  }
  
}
