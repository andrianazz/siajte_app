import 'package:get/get.dart';

import '../controllers/penialian_pemb_skipsi_controller.dart';

class PenialianPembSkipsiBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PenialianPembSkipsiController>(
      () => PenialianPembSkipsiController(),
    );
  }
}
