import 'package:get/get.dart';

import '../controllers/beritasaya_controller.dart';

class BeritasayaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BeritasayaController>(
      () => BeritasayaController(),
    );
  }
}
