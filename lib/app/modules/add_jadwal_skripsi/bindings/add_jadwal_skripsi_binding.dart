import 'package:get/get.dart';

import '../controllers/add_jadwal_skripsi_controller.dart';

class AddJadwalSkripsiBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddJadwalSkripsiController>(
      () => AddJadwalSkripsiController(),
    );
  }
}
