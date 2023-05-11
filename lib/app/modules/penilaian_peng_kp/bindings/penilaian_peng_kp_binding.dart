import 'package:get/get.dart';

import '../controllers/penilaian_peng_kp_controller.dart';

class PenilaianPengKpBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PenilaianPengKpController>(
      () => PenilaianPengKpController(),
    );
  }
}
