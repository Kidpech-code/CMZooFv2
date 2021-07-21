import 'package:cloud_firestore/cloud_firestore.dart';

class FireBase {
  void getQuery({required String path}) {
    final reference = FirebaseFirestore.instance.collection(path);
    final query = reference
        .where(
          'nameth',
        )
        .where('nameeng');
    query.get().then(
      (querySnapshot) {
        querySnapshot.docs.forEach(
          (doc) {
            if (doc.exists) {
              print(doc.data());
            }
          },
        );
      },
    ).catchError(
      (err) {
        print(err);
      },
    );
  }
}
