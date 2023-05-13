import 'package:get/get.dart';

import '../controllers/penilaian_peng_proposal_controller.dart';

class PenilaianPengProposalBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PenilaianPengProposalController>(
      () => PenilaianPengProposalController(),
    );
  }
}
