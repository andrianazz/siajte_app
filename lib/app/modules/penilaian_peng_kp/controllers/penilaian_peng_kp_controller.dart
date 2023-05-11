import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:siajte_app/app/modules/penilaian_peng_kp/views/penilaian_peng_kp_view.dart';
import 'package:siajte_app/app/widgets/penilaian_kp_penguji/form_nilai_penguji.dart';

class PenilaianPengKpController extends GetxController {
  PageController pageController = PageController();

  RxInt selectedChips = 0.obs;

  //Pembimbing KP
  RxList<String> listPenilaianPengKP = [
    "Form Nilai",
    "Saran Perbaikan",
  ].obs;

  RxList<String> listFormNilaiPengKP = [
    "Presentasi",
    "Materi",
    "Tanya Jawab",
  ].obs;

  RxInt indexFormNilaiPengKP = 0.obs;

  Widget viewListPenilaianPengKP() {
    switch (selectedChips.value) {
      case 0:
        return const FormNilaiPenguji();

      case 1:
        return const SaranPerbaikanKPView();

      default:
        // return const FormNilaiKPView();
        return const Text("Form Nilai Penguji KP");
    }
  }

  RxMap scoreMapPeng = {
    "presentasi": 0.0,
    "materi": 0.0,
    "tanya_jawab": 0.0,
  }.obs;
}
