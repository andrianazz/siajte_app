import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:siajte_app/app/data/models/penjadwalan_skripsi_model.dart';
import 'package:siajte_app/app/modules/home/controllers/home_controller.dart';
import 'package:siajte_app/app/modules/penilaian_peng_skripsi/views/penilaian_peng_skripsi_view.dart';
import 'package:siajte_app/app/widgets/penilaian_peng_skripsi/card_ba_skripsi.dart';
import 'package:siajte_app/app/widgets/penilaian_peng_skripsi/form_nilai_peng_skripsi.dart';

class PenilaianPengSkripsiController extends GetxController {
  PageController pageController = PageController();

  HomeController homeC = Get.put(HomeController());
  PenjadwalanSkripsi jadwalSkripsi = Get.arguments;

  RxInt selectedChips = 0.obs;

  RxList<String> listFormNilaiPengSkripsi = [
    "Presentasi",
    "Tingkat Penguasan Materi",
    "Keaslian",
    "Ketepatan Metodologi",
    "Penguasan Dasar Teori",
    "Kecermatan Perumusan Masalah",
    "Tinjauan Pustaka",
    "Tata Tulis",
    "Tools",
    "Penyajian Data",
    "Hasil",
    "Pembahasan",
    "Kesimpulan",
    "Luaran",
    "Sumbangan Pemikiran",
  ].obs;

  //Pembimbing KP
  RxList<String> listPenilaianPengSkripsi = [
    "Form Nilai",
    "Saran Perbaikan",
  ].obs;

  RxInt indexFormNilaiPengSkripsi = 0.obs;

  Widget viewListPenilaianPengProposal() {
    if (jadwalSkripsi.pengujisatuNip!.contains(homeC.mapUser['data']['nip'])) {
      switch (selectedChips.value) {
        case 0:
          return const FormNilaiPengSkripsi();
        // return const Text("Form Nilai");

        case 1:
          return const SaranPerbaikanskripsiView();
        // return const Text("Saran Perbaikan");

        case 2:
          return const RevisiJudulView();
        // return const Text("Revisi Judul");

        case 3:
          return const CardBASkripsi();

        default:
          return const FormNilaiPengSkripsi();
        // return const Text("Form Nilai");
      }
    } else {
      switch (selectedChips.value) {
        case 0:
          return const FormNilaiPengSkripsi();
        // return const Text("Form Nilai");

        case 1:
          return const SaranPerbaikanskripsiView();
        // return const Text("Saran Perbaikan");

        default:
          return const FormNilaiPengSkripsi();
        // return const Text("Form Nilai");
      }
    }
  }

  RxMap scoreMapPengSkripsi = {
    "presentasi": 0.0,
    "tingkat_penguasaan_materi": 0.0,
    "keaslian": 0.0,
    "ketepatan_metodologi": 0.0,
    "penguasan_dasar_teori": 0.0,
    "kecermatan_perumusan_masalah": 0.0,
    "tinjauan_pustaka": 0.0,
    "tata_tulis": 0.0,
    "tools": 0.0,
    "penyajian_data": 0.0,
    "hasil": 0.0,
    "pembahasan": 0.0,
    "kesimpulan": 0.0,
    "luaran": 0.0,
    "sumbangan_pemikiran": 0.0,
  }.obs;

  List<List<double>> valueRadioAll = [
    [0.4, 0.8, 1.2, 1.6, 2],
    [0.6, 1.2, 1.8, 2.4, 3],
    [0.4, 0.8, 1.2, 1.6, 2],
    [0.8, 1.6, 2.4, 3.2, 4],
    [0.8, 1.6, 2.4, 3.2, 4],
    [0.6, 1.2, 1.8, 2.4, 3],
    [0.6, 1.2, 1.8, 2.4, 3],
    [0.4, 0.8, 1.2, 1.6, 2],
    [0.4, 0.8, 1.2, 1.6, 2],
    [0.6, 1.2, 1.8, 2.4, 3],
    [0.8, 1.6, 2.4, 3.2, 4],
    [0.8, 1.6, 2.4, 3.2, 4],
    [0.6, 1.2, 1.8, 2.4, 3],
    [0.6, 1.2, 1.8, 2.4, 3],
    [0.6, 1.2, 1.8, 2.4, 3],
  ];

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    if (jadwalSkripsi.pengujisatuNip!.contains(homeC.mapUser['data']['nip'])) {
      listPenilaianPengSkripsi.addAll([
        "Revisi Judul",
        "Berita Acara",
      ]);
    }
  }
}
