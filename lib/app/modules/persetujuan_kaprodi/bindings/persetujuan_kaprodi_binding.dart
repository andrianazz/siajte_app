import 'package:get/get.dart';

import '../controllers/persetujuan_kaprodi_controller.dart';

class PersetujuanKaprodiBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PersetujuanKaprodiController>(
      () => PersetujuanKaprodiController(),
    );
  }
}
