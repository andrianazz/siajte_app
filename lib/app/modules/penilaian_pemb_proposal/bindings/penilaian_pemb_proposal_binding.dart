import 'package:get/get.dart';

import '../controllers/penilaian_pemb_proposal_controller.dart';

class PenilaianPembProposalBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PenilaianPembProposalController>(
      () => PenilaianPembProposalController(),
    );
  }
}
