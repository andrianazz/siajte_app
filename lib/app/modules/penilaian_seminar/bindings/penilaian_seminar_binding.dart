import 'package:get/get.dart';

import '../controllers/penilaian_seminar_controller.dart';

class PenilaianSeminarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PenilaianSeminarController>(
      () => PenilaianSeminarController(),
    );
  }
}
