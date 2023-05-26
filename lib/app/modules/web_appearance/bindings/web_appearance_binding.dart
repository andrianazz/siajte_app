import 'package:get/get.dart';

import '../controllers/web_appearance_controller.dart';

class WebAppearanceBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WebAppearanceController>(
      () => WebAppearanceController(),
    );
  }
}
