import 'package:get/get.dart';

import '../controllers/jadwal_seminar_controller.dart';

class JadwalSeminarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<JadwalSeminarController>(
      () => JadwalSeminarController(),
    );
  }
}
