import 'package:get/get.dart';

import '../controllers/riwayat_seminar_controller.dart';

class RiwayatSeminarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RiwayatSeminarController>(
      () => RiwayatSeminarController(),
    );
  }
}
