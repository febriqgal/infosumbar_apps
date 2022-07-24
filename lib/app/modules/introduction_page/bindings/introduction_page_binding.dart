import 'package:get/get.dart';

import '../controllers/introduction_page_controller.dart';

class IntroductionPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IntroductionPageController>(
      () => IntroductionPageController(),
    );
  }
}
