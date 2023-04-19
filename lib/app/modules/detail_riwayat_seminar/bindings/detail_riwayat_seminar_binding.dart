import 'package:get/get.dart';

import '../controllers/detail_riwayat_seminar_controller.dart';

class DetailRiwayatSeminarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailRiwayatSeminarController>(
      () => DetailRiwayatSeminarController(),
    );
  }
}
