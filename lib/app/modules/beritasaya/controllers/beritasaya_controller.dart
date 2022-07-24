import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class BeritasayaController extends GetxController {
  Stream<QuerySnapshot> collectionStream = FirebaseFirestore.instance
      .collection('berita')
      .orderBy('${FirebaseAuth.instance.currentUser?.uid}', descending: true)
      .snapshots();
}
