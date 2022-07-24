import 'package:get/get.dart';

import '../controllers/tambahberita_controller.dart';

class TambahberitaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TambahberitaController>(
      () => TambahberitaController(),
    );
  }
}
