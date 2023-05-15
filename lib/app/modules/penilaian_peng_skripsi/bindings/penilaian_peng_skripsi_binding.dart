import 'package:get/get.dart';

import '../controllers/penilaian_peng_skripsi_controller.dart';

class PenilaianPengSkripsiBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PenilaianPengSkripsiController>(
      () => PenilaianPengSkripsiController(),
    );
  }
}
