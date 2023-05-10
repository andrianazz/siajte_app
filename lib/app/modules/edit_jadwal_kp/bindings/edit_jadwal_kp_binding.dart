import 'package:get/get.dart';

import '../controllers/edit_jadwal_kp_controller.dart';

class EditJadwalKpBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditJadwalKpController>(
      () => EditJadwalKpController(),
    );
  }
}
