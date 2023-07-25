import 'package:get/get.dart';

import '../controllers/persetujuan_koor_ta_controller.dart';

class PersetujuanKoorTaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PersetujuanKoorTaController>(
      () => PersetujuanKoorTaController(),
    );
  }
}
