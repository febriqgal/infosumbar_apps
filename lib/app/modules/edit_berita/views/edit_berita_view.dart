import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../controllers/edit_berita_controller.dart';

class EditBeritaView extends GetView<EditBeritaController> {
  const EditBeritaView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final storageRef = FirebaseStorage.instance.ref();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Berita'),
        centerTitle: true,
      ),
      body: FutureBuilder<DocumentSnapshot<Object?>>(
        future: controller.getBerita(Get.arguments),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            var dataEditBerita = snapshot.data?.data() as Map<String?, dynamic>;
            controller.isiBeritaC.text = dataEditBerita['isi'];
            controller.judulBeritaC.text = dataEditBerita['judul'];
            final hapusFoto =
                storageRef.child("foto_berita/${dataEditBerita['namagambar']}");
            return Padding(
              padding: const EdgeInsets.all(20),
              child: ListView(
                children: [
                  TextField(
                    maxLines: 3,
                    controller: controller.judulBeritaC,
                    autocorrect: false,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                      hintText: 'Judul Berita',
                      focusedBorder: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    maxLines: 10,
                    controller: controller.isiBeritaC,
                    autocorrect: false,
                    decoration: const InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                      hintText: 'isi berita',
                      focusedBorder: OutlineInputBorder(),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        fixedSize: Size(Get.width, 40),
                      ),
                      onPressed: () async {
                        await controller.editBerita(controller.isiBeritaC.text,
                            controller.judulBeritaC.text, '${Get.arguments}');
                      },
                      child: const Text('Kirim'),
                    ),
                  ),
                  TextButton(
                      onPressed: () async {
                        controller.deleteBerita('${Get.arguments}');
                        await hapusFoto.delete();
                      },
                      child: const Text('Hapus Berita'))
                ],
              ),
            );
          } else {
            return Center(
              child: LottieBuilder.asset(
                'assets/loading.json',
                frameRate: FrameRate.max,
              ),
            );
          }
        },
      ),
    );
  }
}
