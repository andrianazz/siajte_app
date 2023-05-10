import 'package:get/get.dart';

import '../controllers/add_jadwal_proposal_controller.dart';

class AddJadwalProposalBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddJadwalProposalController>(
      () => AddJadwalProposalController(),
    );
  }
}
