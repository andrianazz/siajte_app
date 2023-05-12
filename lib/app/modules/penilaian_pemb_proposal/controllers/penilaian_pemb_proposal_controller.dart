import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:siajte_app/app/widgets/penilaian_pemb_sempro/form_nilai_pemb_sempro.dart';

class PenilaianPembProposalController extends GetxController {
  PageController pageController = PageController();

  RxInt selectedChips = 0.obs;

  //Pembimbing KP
  RxList<String> listPenilaianPembSempro = [
    "Form Nilai",
  ].obs;

  RxList<String> listFormNilaiPembSempro = [
    "Penguasaan Dasar Teori",
    "Tingkat Penguasaan Materi",
    "Tinjauan Pustaka",
    "Tata Tulis",
    "Sikap dan Kepribadian ketika bimbingan"
  ].obs;

  RxInt indexFormNilaiPembSempro = 0.obs;

  Widget viewListPenilaianPembSempro() {
    switch (selectedChips.value) {
      case 0:
        return const FormNilaiPembSempro();

      default:
        return const FormNilaiPembSempro();
      // return const Text("Form Nilai ");
    }
  }

  RxMap scoreMapPembSempro = {
    "penguasaan_dasar_teori": 0.0,
    "tingkat_penguasaan_materi": 0.0,
    "tinjauan_pustaka": 0.0,
    "tata_tulis": 0.0,
    "sikap_dan_kepribadian": 0.0
  }.obs;
}
