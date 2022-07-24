import 'package:get/get.dart';

import '../controllers/edit_berita_controller.dart';

class EditBeritaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditBeritaController>(
      () => EditBeritaController(),
    );
  }
}
