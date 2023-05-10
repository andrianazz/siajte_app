import 'package:get/get.dart';

import '../controllers/edit_jadwal_proposal_controller.dart';

class EditJadwalProposalBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditJadwalProposalController>(
      () => EditJadwalProposalController(),
    );
  }
}
