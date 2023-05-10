import 'package:get/get.dart';

import '../controllers/edit_jadwal_skripsi_controller.dart';

class EditJadwalSkripsiBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditJadwalSkripsiController>(
      () => EditJadwalSkripsiController(),
    );
  }
}
