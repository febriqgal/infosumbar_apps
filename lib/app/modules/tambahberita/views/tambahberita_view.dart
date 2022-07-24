import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/tambahberita_controller.dart';

class TambahberitaView extends GetView<TambahberitaController> {
  const TambahberitaView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<TambahberitaController>();
    return Scaffold(
      appBar: AppBar(title: const Text('Tambah Berita')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            TextField(
              maxLines: 3,
              controller: controller.judulBeritaC,
              autocorrect: false,
              cursorColor: Colors.amber,
              style: const TextStyle(color: Colors.grey),
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                hintText: 'Judul Berita',
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                ),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: controller.sumberC,
              autocorrect: false,
              style: const TextStyle(color: Colors.grey),
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                hintText: 'Sumber',
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                ),
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton.icon(
                onPressed: () {
                  controller.pickfotoberita();
                },
                icon: const Icon(Icons.camera_alt),
                label: const Text('Pilih Gambar Berita')),
            const SizedBox(height: 10),
            TextField(
              maxLines: 10,
              controller: controller.isiBeritaC,
              autocorrect: false,
              style: const TextStyle(color: Colors.grey),
              decoration: const InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                hintText: 'isi berita',
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                ),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(),
                onPressed: () {
                  controller.tambahBerita(
                    controller.isiBeritaC.text,
                    controller.judulBeritaC.text,
                    controller.sumberC.text,
                  );
                },
                child: const Text(
                  'Kirim',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
