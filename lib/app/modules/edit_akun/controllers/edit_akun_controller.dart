import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:infosumbar/app/routes/app_pages.dart';

class EditAkunController extends GetxController {
  File? imageeee;
  final storageRef = FirebaseStorage.instance.ref();
  final ImagePicker picker = ImagePicker();
  final user = FirebaseAuth.instance.currentUser;
  TextEditingController passwordBaruC = TextEditingController();
  TextEditingController ubahNamaC = TextEditingController();

  Future<void> pickFotoProfile() async {
    final XFile? imageeee = await picker.pickImage(
      source: ImageSource.gallery,
      maxWidth: 500,
      maxHeight: 500,
    );
    if (imageeee != null) {
      File file = File(imageeee.path);
      var adminView = this;
      adminView.imageeee = file;
      try {
        final mountainImagesRef = storageRef.child("foto_user/${user?.uid}");
        Get.defaultDialog(
          barrierDismissible: false,
          radius: 5,
          title: 'Pemberitahuan',
          middleText: 'Sedang mengupload...',
        );
        await mountainImagesRef.putFile(
          file,
        );
        Get.back();
        Get.defaultDialog(
          barrierDismissible: false,
          radius: 5,
          title: 'Pemberitahuan',
          middleText: 'Foto berhasil diupload',
        );
      } catch (e) {
        Get.defaultDialog(
            title: 'Pemberitahuan',
            middleText: 'Gagal mengupload, silahkan coba lagi!');
      }
    } else {
      Get.defaultDialog(
          radius: 5,
          title: 'Pemberitahuan',
          middleText: 'membatalkan mengupload');
    }
  }

  ubahFotoProfile() async {
    await user?.updatePhotoURL(
      "https://firebasestorage.googleapis.com/v0/b/infosumbar-a0bd6.appspot.com/o/foto_user%2F${user?.uid}?alt=media&token=76c0eb29-4ee5-4448-b3af-2491e1489fa0",
    );
    update();
    Get.back();
    Get.snackbar(
      '-',
      '-',
      titleText: const Center(
        child: Text(
          'Pemberitahuan',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      messageText: const Center(child: Text('Foto profile berhasil diubah!')),
      backgroundColor: Colors.white,
      snackStyle: SnackStyle.GROUNDED,
    );
  }

  ubahPassword(String passwordBaruC) async {
    if (passwordBaruC.isEmpty) {
      Get.snackbar(
        '-',
        '-',
        titleText: const Center(
            child: Text(
          'Pemberitahuan',
          style: TextStyle(fontWeight: FontWeight.bold),
        )),
        messageText: const Center(child: Text('Nama tidak boleh kosong!')),
        backgroundColor: Colors.white,
        snackStyle: SnackStyle.GROUNDED,
      );
    } else {
      try {
        await user?.updatePassword(passwordBaruC);
        Get.offAllNamed(Routes.LOGIN);
        Get.defaultDialog(
          radius: 8,
          title: 'Pemberitahuan',
          middleText: 'Password berhasil diubah, Silahkan Login kembali!',
        );
      } catch (e) {
        Get.defaultDialog(
          radius: 8,
          title: 'Pemberitahuan',
          middleText:
              'Gagal mengubah password, silahkan coba lagi atau hubungi admin!',
        );
      }
    }
  }

  ubahNama(String ubahNamaC) async {
    if (ubahNamaC.isEmpty) {
      Get.snackbar(
        '-',
        '-',
        titleText: const Center(
            child: Text(
          'Pemberitahuan',
          style: TextStyle(fontWeight: FontWeight.bold),
        )),
        messageText: const Center(child: Text('Nama tidak boleh kosong!')),
        backgroundColor: Colors.white,
        snackStyle: SnackStyle.GROUNDED,
      );
    } else {
      try {
        await user?.updateDisplayName(ubahNamaC);
        Get.back();
        Get.back();
        Get.snackbar(
          '-',
          '-',
          titleText: const Center(
            child: Text(
              'Pemberitahuan',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          messageText: const Center(child: Text('Nama berhasil diubah!')),
          backgroundColor: Colors.white,
          snackStyle: SnackStyle.GROUNDED,
        );
      } catch (e) {
        Get.snackbar(
          '-',
          '-',
          titleText: const Center(
            child: Text(
              'Kesalahan',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          messageText: const Center(
              child: Text('Gagal mengubah nama, silahkan coba lagi!')),
          backgroundColor: Colors.white,
          snackStyle: SnackStyle.GROUNDED,
        );
      }
    }
  }
}
