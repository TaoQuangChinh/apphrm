import 'package:get/get.dart';

import '../controllers/screen_saver_controller.dart';

class ScreenSaverBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ScreenSaverController>(
      () => ScreenSaverController(),
    );
  }
}
