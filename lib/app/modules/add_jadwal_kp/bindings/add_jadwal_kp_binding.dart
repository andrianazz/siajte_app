import 'package:get/get.dart';

import '../controllers/add_jadwal_kp_controller.dart';

class AddJadwalKpBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddJadwalKpController>(
      () => AddJadwalKpController(),
    );
  }
}
