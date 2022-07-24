import 'package:get/get.dart';

import '../controllers/detailberita_controller.dart';

class DetailberitaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailberitaController>(
      () => DetailberitaController(),
    );
  }
}
