import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:siajte_app/app/data/models/penjadwalan_sempro_model.dart';
import 'package:siajte_app/app/modules/home/controllers/home_controller.dart';
import 'package:siajte_app/app/modules/penilaian_peng_proposal/views/penilaian_peng_proposal_view.dart';
import 'package:siajte_app/app/widgets/penilaian_peng_sempro/card_ba_sempro.dart';
import 'package:siajte_app/app/widgets/penilaian_peng_sempro/form_nilai_peng_sempro.dart';

class PenilaianPengProposalController extends GetxController {
  PageController pageController = PageController();

  HomeController homeC = Get.put(HomeController());
  PenjadwalanSempro jadwalSempro = Get.arguments;

  RxInt selectedChips = 0.obs;

  RxList<String> listFormNilaiPengSempro = [
    "Presentasi",
    "Tingkat Penguasan Materi",
    "Keaslian",
    "Ketepatan Metodologi",
    "Penguasan Dasar Teori",
    "Kecermatan Perumusan Masalah",
    "Tinjauan Pustaka",
    "Tata Tulis",
    "Sumbangan Pemikiran",
  ].obs;

  //Pembimbing KP
  RxList<String> listPenilaianPengSempro = [
    "Form Nilai",
    "Saran Perbaikan",
  ].obs;

  RxInt indexFormNilaiPengSempro = 0.obs;

  Widget viewListPenilaianPengProposal() {
    if (jadwalSempro.pengujisatuNip!.contains(homeC.mapUser['data']['nip'])) {
      switch (selectedChips.value) {
        case 0:
          return const FormNilaiPengSempro();

        case 1:
          return const SaranPerbaikanSemproView();

        case 2:
          return const RevisiJudulView();

        case 3:
          return const CardBASempro();

        default:
          // return const FormNilaiKPView();
          return const FormNilaiPengSempro();
      }
    } else {
      switch (selectedChips.value) {
        case 0:
          return const FormNilaiPengSempro();

        case 1:
          return const SaranPerbaikanSemproView();

        default:
          // return const FormNilaiKPView();
          return const FormNilaiPengSempro();
      }
    }
  }

  RxMap scoreMapPengSempro = {
    "presentasi": 0.0,
    "tingkat_penguasaan_materi": 0.0,
    "keaslian": 0.0,
    "ketepatan_metodologi": 0.0,
    "penguasan_dasar_teori": 0.0,
    "kecermatan_perumusan_masalah": 0.0,
    "tinjauan_pustaka": 0.0,
    "tata_tulis": 0.0,
    "sumbangan_pemikiran": 0.0,
  }.obs;

  List<List<double>> valueRadioAll = [
    [1, 2, 3, 4, 5],
    [1.6, 3.2, 4.8, 6.4, 8],
    [1, 2, 3, 4, 5],
    [1.4, 2.8, 4.2, 5.6, 7],
    [1.2, 2.4, 3.6, 4.8, 6],
    [1.2, 2.4, 3.6, 4.8, 6],
    [1.4, 2.8, 4.2, 5.6, 7],
    [1, 2, 3, 4, 5],
    [1.2, 2.4, 3.6, 4.8, 6]
  ];

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    if (jadwalSempro.pengujisatuNip!.contains(homeC.mapUser['data']['nip'])) {
      listPenilaianPengSempro.addAll([
        "Revisi Judul",
        "Berita Acara",
      ]);
    }
  }
}
