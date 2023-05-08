import 'package:get/get.dart';

import '../controllers/edit_mahasiswa_controller.dart';

class EditMahasiswaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditMahasiswaController>(
      () => EditMahasiswaController(),
    );
  }
}
