import 'package:get/get.dart';

import '../controllers/detail_jadwal_seminar_controller.dart';

class DetailJadwalSeminarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailJadwalSeminarController>(
      () => DetailJadwalSeminarController(),
    );
  }
}
