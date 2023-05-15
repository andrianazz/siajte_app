import 'package:get/get.dart';

import '../controllers/search_mahasiswa_controller.dart';

class SearchMahasiswaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SearchMahasiswaController>(
      () => SearchMahasiswaController(),
    );
  }
}
