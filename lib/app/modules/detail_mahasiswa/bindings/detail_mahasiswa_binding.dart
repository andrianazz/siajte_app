import 'package:get/get.dart';

import '../controllers/detail_mahasiswa_controller.dart';

class DetailMahasiswaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailMahasiswaController>(
      () => DetailMahasiswaController(),
    );
  }
}
