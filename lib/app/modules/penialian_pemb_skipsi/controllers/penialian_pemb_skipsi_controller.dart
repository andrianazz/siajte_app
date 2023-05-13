import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:siajte_app/app/widgets/penilaian_pemb_skripsi/form_nilai_pemb_skripsi.dart';

class PenialianPembSkipsiController extends GetxController {
  PageController pageController = PageController();

  RxInt selectedChips = 0.obs;

  //Pembimbing KP
  RxList<String> listPenilaianPembSkripsi = [
    "Form Nilai",
  ].obs;

  RxList<String> listFormNilaiPembSkripsi = [
    "Penguasaan Dasar Teori",
    "Tingkat Penguasaan Materi",
    "Tinjauan Pustaka",
    "Tata Tulis",
    "Hasil dan Pembahasan",
    "Sikap dan Kepribadian ketika bimbingan"
  ].obs;

  RxInt indexFormNilaiPembSkripsi = 0.obs;

  Widget viewListPenilaianPembSkripsi() {
    switch (selectedChips.value) {
      case 0:
        return const FormNilaiPembSkripsi();

      default:
        return const FormNilaiPembSkripsi();

      // return const Text("Form Nilai ");
    }
  }

  RxMap scoreMapPembSkripsi = {
    "penguasaan_dasar_teori": 0.0,
    "tingkat_penguasaan_materi": 0.0,
    "tinjauan_pustaka": 0.0,
    "tata_tulis": 0.0,
    "hasil_dan_pembahasan": 0.0,
    "sikap_dan_kepribadian": 0.0
  }.obs;

  List<List<double>> valueRadioAll = [
    [2, 4, 6, 8, 10],
    [2, 4, 6, 8, 10],
    [1.8, 3.6, 5.4, 7.2, 9],
    [1.6, 3.2, 4.8, 6.4, 8],
    [1.6, 4, 6, 8, 10],
    [1.6, 3.2, 4.8, 6.4, 8]
  ];
}
