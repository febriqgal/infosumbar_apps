import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  Stream<QuerySnapshot?> collectionStream = FirebaseFirestore.instance
      .collection('berita')
      .orderBy('${FirebaseAuth.instance.currentUser?.uid}')
      .snapshots();
}
