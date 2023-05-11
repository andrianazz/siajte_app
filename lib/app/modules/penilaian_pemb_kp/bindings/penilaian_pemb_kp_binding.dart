import 'package:get/get.dart';

import '../controllers/penilaian_pemb_kp_controller.dart';

class PenilaianPembKpBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PenilaianPembKpController>(
      () => PenilaianPembKpController(),
    );
  }
}
