import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:siajte_app/app/modules/penilaian_seminar/views/penilaian_seminar_view.dart';

class PenilaianSeminarController extends GetxController {
  PageController pageController = PageController();

  RxInt selectedChips = 0.obs;
  RxList<String> listPenilaianKP = [
    "Form Nilai",
    "Nilai Pembimbing",
    "Catatan",
    "Berita Acara",
  ].obs;

  RxList<String> listFormNilaiKP = [
    "Presentasi",
    "Materi",
    "Tanya Jawab",
  ].obs;
  RxInt indexFormNilaiKP = 0.obs;

  Widget viewListPenilaianKP() {
    switch (selectedChips.value) {
      case 0:
        return const FormNilaiKPView();
      case 1:
        return const PenilaianPembimbingView();
      case 2:
        return const CatatanKPView();
      case 3:
        return const Center(child: Text("Berita Acara"));
      default:
        return const FormNilaiKPView();
    }
  }

  RxDouble score = 0.0.obs;
  RxMap scoreMap = {
    "Presentasi": 0.0,
    "Materi": 0.0,
    "Tanya Jawab": 0.0,
  }.obs;
}
