import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class EditBeritaController extends GetxController {
  File? imageeee;
  final storageRef = FirebaseStorage.instance.ref();
  final ImagePicker picker = ImagePicker();
  final user = FirebaseAuth.instance.currentUser;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;
  TextEditingController isiBeritaC = TextEditingController();
  TextEditingController judulBeritaC = TextEditingController();

  Future<DocumentSnapshot<Object?>> getBerita(String docID) async {
    DocumentReference docRef = firestore.collection("berita").doc(docID);
    return await docRef.get();
  }

  Future<void> editBerita(
    String isiBeritaEditC,
    String judulBeritaEditC,
    String docID,
  ) async {
    DocumentReference docRef = firestore.collection("berita").doc(docID);

    try {
      await docRef.update(
        {
          "judul": judulBeritaEditC,
          "isi": isiBeritaEditC,
        },
      );
      Get.back();
      Get.snackbar(
        '-',
        '-',
        titleText: const Center(
          child: Text(
            'Berhasil',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
        messageText:
            const Center(child: Text('Yeayy! Berhasil mengedit berita🎉')),
        snackStyle: SnackStyle.GROUNDED,
        backgroundColor: Colors.white,
      );
    } catch (e) {
      Get.snackbar(
        '-',
        '-',
        titleText: const Center(
          child: Text(
            'Kesalahan',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
        messageText: const Center(
            child: Text('Gagal mengedit berita, silahkan coba lagi!')),
        snackStyle: SnackStyle.GROUNDED,
        backgroundColor: Colors.white,
      );
    }
  }

  Future<void> deleteBerita(String docID) async {
    DocumentReference docRef = firestore.collection("berita").doc(docID);
    try {
      await docRef.delete();
      Get.back();
      Get.snackbar(
        '-',
        '-',
        titleText: const Center(
          child: Text(
            'Berhasil',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
        messageText: const Center(child: Text('Berita berhasil dihapus')),
        snackStyle: SnackStyle.GROUNDED,
        backgroundColor: Colors.white,
        barBlur: 0.5,
      );
    } catch (e) {
      Get.snackbar(
        '-',
        '-',
        titleText: const Center(
          child: Text(
            'Kesalahan',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
        messageText: const Center(child: Text('Berita tidak berhasil dihapus')),
        snackStyle: SnackStyle.GROUNDED,
        backgroundColor: Colors.white,
        barBlur: 0.5,
      );
    }
  }
}
