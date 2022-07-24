import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class DetailberitaController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  Future<DocumentSnapshot<Object?>> getBerita1(String docID) async {
    DocumentReference docRef = firestore.collection("berita").doc(docID);
    return await docRef.get();
  }
}
