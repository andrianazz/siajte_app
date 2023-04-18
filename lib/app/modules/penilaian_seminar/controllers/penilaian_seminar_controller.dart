import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:siajte_app/app/modules/penilaian_seminar/views/penilaian_seminar_view.dart';

class PenilaianSeminarController extends GetxController {
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

  Widget viewFormKP() {
    switch (indexFormNilaiKP.value) {
      case 0:
        return CardPenilaian(no: "1", title: listFormNilaiKP[0]);
      case 1:
        return CardPenilaian(no: "2", title: listFormNilaiKP[1]);
      case 2:
        return CardPenilaian(no: "3", title: listFormNilaiKP[2]);
      default:
        return CardPenilaian(no: "1", title: listFormNilaiKP[0]);
    }
  }

  RxInt score = 0.obs;
}
