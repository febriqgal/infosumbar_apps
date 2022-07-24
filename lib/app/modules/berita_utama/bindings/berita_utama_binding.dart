import 'package:get/get.dart';

import '../controllers/berita_utama_controller.dart';

class BeritaUtamaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BeritaUtamaController>(
      () => BeritaUtamaController(),
    );
  }
}
