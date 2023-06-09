import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:siajte_app/app/modules/penilaian_seminar/views/penilaian_seminar_view.dart';
import 'package:siajte_app/app/widgets/penilaian_kp_pembimbing/card_ba_kp_widget.dart';

import '../../../widgets/penilaian_kp_pembimbing/form_nilai_kp.dart';

class PenilaianSeminarController extends GetxController {
  PageController pageController = PageController();

  RxInt selectedChips = 0.obs;

  //Pembimbing KP
  RxList<String> listPenilaianPembKP = [
    "Form Nilai",
    "Nilai Pembimbing",
    "Catatan",
    "Berita Acara",
  ].obs;

  RxList<String> listFormNilaiPembKP = [
    "Presentasi",
    "Materi",
    "Tanya Jawab",
  ].obs;
  RxInt indexFormNilaiPembKP = 0.obs;

  Widget viewListPenilaianPembKP() {
    switch (selectedChips.value) {
      case 0:
        return const FormNilaiKPView();
      case 1:
        return const PenilaianPembimbingView();
      case 2:
        return const CatatanKPView();
      case 3:
        return const CardBAKP();
      default:
        return const FormNilaiKPView();
    }
  }

  RxMap scoreMapPemb = {
    "presentasi": 0.0,
    "materi": 0.0,
    "tanya_jawab": 0.0,
  }.obs;

  //Penguji KP
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
        return const Center(child: Text("Form Nilai"));
      case 1:
        return const Center(child: Text("Saran Perbaikan"));

      default:
        return const FormNilaiKPView();
    }
  }

  RxMap scoreMapPeng = {
    "presentasi": 0.0,
    "materi": 0.0,
    "tanya_jawab": 0.0,
  }.obs;
}
