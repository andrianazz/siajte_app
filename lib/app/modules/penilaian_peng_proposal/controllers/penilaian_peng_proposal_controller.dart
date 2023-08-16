// ignore_for_file: invalid_use_of_protected_member

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:siajte_app/app/data/models/penilaian_sempro_pemb_model.dart';
import 'package:siajte_app/app/data/models/penilaian_sempro_peng_model.dart';
import 'package:siajte_app/app/data/models/penjadwalan_sempro_model.dart';
import 'package:siajte_app/app/modules/home/controllers/home_controller.dart';
import 'package:siajte_app/app/modules/penilaian_peng_proposal/views/penilaian_peng_proposal_view.dart';
import 'package:siajte_app/app/theme/variable.dart';
import 'package:siajte_app/app/widgets/penilaian_peng_sempro/card_ba_sempro.dart';
import 'package:siajte_app/app/widgets/penilaian_peng_sempro/form_nilai_peng_sempro.dart';

class PenilaianPengProposalController extends GetxController {
  RxBool isLoading = false.obs;
  PageController pageController = PageController();

  PenjadwalanSempro penjadwalanSempro = Get.arguments;

  Dio dio = Dio();

  HomeController homeC = Get.put(HomeController());
  PenjadwalanSempro jadwalSempro = Get.arguments;

  late PenilaianSemproPeng existPenilaianSemproPeng;

  TextEditingController revisiNaskah1C = TextEditingController();
  TextEditingController revisiNaskah2C = TextEditingController();
  TextEditingController revisiNaskah3C = TextEditingController();
  TextEditingController revisiNaskah4C = TextEditingController();
  TextEditingController revisiNaskah5C = TextEditingController();

  TextEditingController oldJudulC = TextEditingController();
  TextEditingController newJudulC = TextEditingController();

  RxDouble totalNilai = 0.0.obs;
  RxString nilaiHuruf = "E".obs;

  RxDouble baNilaiAkhir = 0.0.obs;
  RxString baNilaiHuruf = "E".obs;
  RxString baKeterangan = "Tidak Lulus".obs;

  RxInt selectedChips = 0.obs;

  RxList<String> listFormNilaiPengSempro = [
    "Presentasi",
    "Tingkat Penguasaan Materi",
    "Keaslian",
    "Ketepatan Metodologi",
    "Penguasaan Dasar Teori",
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
          oldJudulC.text = penjadwalanSempro.judulProposal!;
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
    "penguasaan_dasar_teori": 0.0,
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

  Future<void> getPenilaianKPPeng(String nipPeng) async {
    isLoading.value = true;
    List<PenilaianSemproPeng> listPenilaianKPPeng = <PenilaianSemproPeng>[];

    var response = await dio.get("$baseUrlAPI/penilaian-sempro-penguji");
    for (var item in response.data['data']) {
      listPenilaianKPPeng.add(PenilaianSemproPeng.fromJson(item));
    }

    if (listPenilaianKPPeng
        .where((element) => element.pengujiNip!.contains(nipPeng))
        .where((element) => element.penjadwalanSemproId
            .toString()
            .contains(penjadwalanSempro.id.toString()))
        .toList()
        .isNotEmpty) {
      print("Ada data Penguji");
      existPenilaianSemproPeng = listPenilaianKPPeng
          .where((element) => element.pengujiNip!.contains(nipPeng))
          .where((element) => element.penjadwalanSemproId
              .toString()
              .contains(penjadwalanSempro.id.toString()))
          .first;

      scoreMapPengSempro.value['presentasi'] =
          existPenilaianSemproPeng.presentasi != null
              ? double.parse(existPenilaianSemproPeng.presentasi!.toString())
              : 0.0;
      scoreMapPengSempro.value['tingkat_penguasaan_materi'] =
          existPenilaianSemproPeng.tingkatPenguasaanMateri != null
              ? double.parse(
                  existPenilaianSemproPeng.tingkatPenguasaanMateri!.toString())
              : 0.0;
      scoreMapPengSempro.value['keaslian'] =
          existPenilaianSemproPeng.keaslian != null
              ? double.parse(existPenilaianSemproPeng.keaslian!.toString())
              : 0.0;
      scoreMapPengSempro.value['ketepatan_metodologi'] =
          existPenilaianSemproPeng.ketepatanMetodologi != null
              ? double.parse(
                  existPenilaianSemproPeng.ketepatanMetodologi!.toString())
              : 0.0;
      scoreMapPengSempro.value['penguasaan_dasar_teori'] =
          existPenilaianSemproPeng.penguasaanDasarTeori != null
              ? double.parse(
                  existPenilaianSemproPeng.penguasaanDasarTeori!.toString())
              : 0.0;
      scoreMapPengSempro.value['kecermatan_perumusan_masalah'] =
          existPenilaianSemproPeng.kecermatanPerumusanMasalah != null
              ? double.parse(existPenilaianSemproPeng
                  .kecermatanPerumusanMasalah!
                  .toString())
              : 0.0;
      scoreMapPengSempro.value['tinjauan_pustaka'] = existPenilaianSemproPeng
                  .tinjauanPustaka !=
              null
          ? double.parse(existPenilaianSemproPeng.tinjauanPustaka!.toString())
          : 0.0;
      scoreMapPengSempro.value['tata_tulis'] =
          existPenilaianSemproPeng.tataTulis != null
              ? double.parse(existPenilaianSemproPeng.tataTulis!)
              : 0.0;
      scoreMapPengSempro.value['sumbangan_pemikiran'] =
          existPenilaianSemproPeng.sumbanganPemikiran != null
              ? double.parse(
                  existPenilaianSemproPeng.sumbanganPemikiran!.toString())
              : 0.0;

      await getTotalandHuruf();

      revisiNaskah1C.text = existPenilaianSemproPeng.revisiNaskah1 ?? "";
      revisiNaskah2C.text = existPenilaianSemproPeng.revisiNaskah2 ?? "";
      revisiNaskah3C.text = existPenilaianSemproPeng.revisiNaskah3 ?? "";
      revisiNaskah4C.text = existPenilaianSemproPeng.revisiNaskah4 ?? "";
      revisiNaskah5C.text = existPenilaianSemproPeng.revisiNaskah5 ?? "";
    } else {
      print("Buat Baru Penguji");
      await addPenilaianKPPengAPI(nipPeng);
    }
  }

  Future<void> getTotalandHuruf() async {
    //sum value of scoreMapPemb
    double total = scoreMapPengSempro.value['presentasi'] +
        scoreMapPengSempro.value['tingkat_penguasaan_materi'] +
        scoreMapPengSempro.value['keaslian'] +
        scoreMapPengSempro.value['ketepatan_metodologi'] +
        scoreMapPengSempro.value['penguasaan_dasar_teori'] +
        scoreMapPengSempro.value['kecermatan_perumusan_masalah'] +
        scoreMapPengSempro.value['tinjauan_pustaka'] +
        scoreMapPengSempro.value['tata_tulis'] +
        scoreMapPengSempro.value['sumbangan_pemikiran'];

    if (total >= 47) {
      nilaiHuruf.value = "A";
    } else if (total >= 44) {
      nilaiHuruf.value = "A-";
    } else if (total >= 42) {
      nilaiHuruf.value = "B+";
    } else if (total >= 39) {
      nilaiHuruf.value = "B";
    } else if (total >= 36) {
      nilaiHuruf.value = "B-";
    } else if (total >= 33) {
      nilaiHuruf.value = "C+";
    } else if (total >= 31) {
      nilaiHuruf.value = "C";
    } else if (total >= 22) {
      nilaiHuruf.value = "D";
    } else {
      nilaiHuruf.value = "E";
    }

    totalNilai.value = total;
  }

  Future<Map<String, dynamic>> addPenilaianKPPengAPI(String nipPemb) async {
    isLoading.value = true;

    try {
      var response = await dio.post(
        "$baseUrlAPI/penilaian-sempro-penguji",
        data: {
          "penjadwalan_sempro_id": penjadwalanSempro.id,
          "penguji_nip": nipPemb,
        },
        options: Options(
          receiveDataWhenStatusError: true,
          sendTimeout: const Duration(seconds: 5), // 60 seconds
          receiveTimeout: const Duration(seconds: 2),
        ),
      );

      var data = response.data;

      if (data != null) {
        Get.snackbar("Add Penilaian Berhasil", "${data['message']}");
        existPenilaianSemproPeng = PenilaianSemproPeng.fromJson(data['data']);

        isLoading.value = false;

        return data;
      } else if (response.statusCode == 401) {
        isLoading.value = false;
        Get.snackbar("Add Penilaian Gagal", "Status 401");
        return {"status": false, "message": "Terjadi kesalahan"};
      } else {
        isLoading.value = false;
        Get.snackbar("Add Penilaian Gagal", "Status 500");
        return {"status": false, "message": "Terjadi kesalahan"};
      }
    } on DioError catch (e) {
      if (e.type == DioErrorType.connectionTimeout) {
        isLoading.value = false;
        Get.snackbar("Add Penilaian Gagal", "Terjadi kesalahan koneksi");
        return {"status": false, "message": "Terjadi kesalahan"};
      }
      if (e.type == DioErrorType.receiveTimeout) {
        isLoading.value = false;
        Get.snackbar("Add Penilaian Gagal", "Terjadi kesalahan koneksi");
        return {"status": false, "message": "Terjadi kesalahan"};
      }
      if (e.type == DioErrorType.sendTimeout) {
        isLoading.value = false;
        Get.snackbar("Add Penilaian Gagal", "Terjadi kesalahan koneksi");
        return {"status": false, "message": "Terjadi kesalahan"};
      }
    }

    return {"status": false, "message": "Terjadi kesalahan"};
  }

  Future<Map<String, dynamic>> updateFormNilaiPengSemproAPI(String id) async {
    isLoading.value = true;
    getTotalandHuruf();

    try {
      var response = await dio.put(
        "$baseUrlAPI/penilaian-sempro-penguji/$id",
        data: scoreMapPengSempro,
        options: Options(
          receiveDataWhenStatusError: true,
          sendTimeout: const Duration(seconds: 5), // 60 seconds
          receiveTimeout: const Duration(seconds: 2),
        ),
      );

      var response2 = await dio.put(
        "$baseUrlAPI/penilaian-sempro-penguji/$id",
        data: {
          'total_nilai_angka': totalNilai.value.ceilToDouble(),
          'total_nilai_huruf': nilaiHuruf.value,
        },
        options: Options(
          receiveDataWhenStatusError: true,
          sendTimeout: const Duration(seconds: 5), // 60 seconds
          receiveTimeout: const Duration(seconds: 2),
        ),
      );
      print(response2.statusCode);

      var data = response.data;

      if (data != null) {
        Get.snackbar("UPDATE Penilaian FORM Berhasil", "${data['message']}");
        existPenilaianSemproPeng = PenilaianSemproPeng.fromJson(data['data']);

        isLoading.value = false;

        return data;
      } else if (response.statusCode == 401) {
        isLoading.value = false;
        Get.snackbar("UPDATE Penilaian FORM Gagal", "Status 401");
        return {"status": false, "message": "Terjadi kesalahan"};
      } else {
        isLoading.value = false;
        Get.snackbar("UPDATE Penilaian FORM Gagal", "Status 500");
        return {"status": false, "message": "Terjadi kesalahan"};
      }
    } on DioError catch (e) {
      if (e.type == DioErrorType.connectionTimeout) {
        isLoading.value = false;
        Get.snackbar(
            "UPDATE Penilaian FORM Gagal", "Terjadi kesalahan koneksi");
        return {"status": false, "message": "Terjadi kesalahan"};
      }
      if (e.type == DioErrorType.receiveTimeout) {
        isLoading.value = false;
        Get.snackbar(
            "UPDATE Penilaian FORM Gagal", "Terjadi kesalahan koneksi");
        return {"status": false, "message": "Terjadi kesalahan"};
      }
      if (e.type == DioErrorType.sendTimeout) {
        isLoading.value = false;
        Get.snackbar(
            "UPDATE Penilaian FORM Gagal", "Terjadi kesalahan koneksi");
        return {"status": false, "message": "Terjadi kesalahan"};
      }
    }

    return {"status": false, "message": "Terjadi kesalahan"};
  }

  Future<void> selesaikanSeminar(id) async {
    isLoading.value = true;

    var response = await dio.put(
      "$baseUrlAPI/penjadwalan-sempro/$id",
      data: {
        "status_seminar": 1,
      },
      options: Options(
        receiveDataWhenStatusError: true,
        sendTimeout: const Duration(seconds: 5), // 60 seconds
        receiveTimeout: const Duration(seconds: 2),
      ),
    );

    var data = response.data;
    Get.snackbar("Berhasil Selesaikan Seminar", "${data['status']}");
  }

  Future<Map<String, dynamic>> updateCatatanSemproAPI(String id) async {
    isLoading.value = true;

    try {
      var response = await dio.put(
        "$baseUrlAPI/penilaian-sempro-penguji/$id",
        data: {
          "revisi_naskah1": revisiNaskah1C.text,
          "revisi_naskah2": revisiNaskah2C.text,
          "revisi_naskah3": revisiNaskah3C.text,
          "revisi_naskah4": revisiNaskah4C.text,
          "revisi_naskah5": revisiNaskah5C.text,
        },
        options: Options(
          receiveDataWhenStatusError: true,
          sendTimeout: const Duration(seconds: 5), // 60 seconds
          receiveTimeout: const Duration(seconds: 2),
        ),
      );

      var data = response.data;

      if (data != null) {
        getTotalandHuruf();

        Get.snackbar("UPDATE Penilaian FORM Berhasil", "${data['message']}");
        existPenilaianSemproPeng = PenilaianSemproPeng.fromJson(data['data']);

        isLoading.value = false;

        return data;
      } else if (response.statusCode == 401) {
        isLoading.value = false;
        Get.snackbar("UPDATE Penilaian FORM Gagal", "Status 401");
        return {"status": false, "message": "Terjadi kesalahan"};
      } else {
        isLoading.value = false;
        Get.snackbar("UPDATE Penilaian FORM Gagal", "Status 500");
        return {"status": false, "message": "Terjadi kesalahan"};
      }
    } on DioError catch (e) {
      if (e.type == DioErrorType.connectionTimeout) {
        isLoading.value = false;
        Get.snackbar(
            "UPDATE Penilaian FORM Gagal", "Terjadi kesalahan koneksi");
        return {"status": false, "message": "Terjadi kesalahan"};
      }
      if (e.type == DioErrorType.receiveTimeout) {
        isLoading.value = false;
        Get.snackbar(
            "UPDATE Penilaian FORM Gagal", "Terjadi kesalahan koneksi");
        return {"status": false, "message": "Terjadi kesalahan"};
      }
      if (e.type == DioErrorType.sendTimeout) {
        isLoading.value = false;
        Get.snackbar(
            "UPDATE Penilaian FORM Gagal", "Terjadi kesalahan koneksi");
        return {"status": false, "message": "Terjadi kesalahan"};
      }
    }

    return {"status": false, "message": "Terjadi kesalahan"};
  }

  Future<Map<String, dynamic>> updateRevisiSemproAPI(String id) async {
    isLoading.value = true;

    try {
      var response = await dio.put(
        "$baseUrlAPI/penilaian-sempro-penguji/$id",
        data: {
          "revisi_naskah1": revisiNaskah1C.text,
          "revisi_naskah2": revisiNaskah2C.text,
          "revisi_naskah3": revisiNaskah3C.text,
          "revisi_naskah4": revisiNaskah4C.text,
          "revisi_naskah5": revisiNaskah5C.text,
        },
        options: Options(
          receiveDataWhenStatusError: true,
          sendTimeout: const Duration(seconds: 5), // 60 seconds
          receiveTimeout: const Duration(seconds: 2),
        ),
      );

      var data = response.data;

      if (data != null) {
        getTotalandHuruf();

        Get.snackbar("UPDATE Penilaian FORM Berhasil", "${data['message']}");
        existPenilaianSemproPeng = PenilaianSemproPeng.fromJson(data['data']);

        isLoading.value = false;

        return data;
      } else if (response.statusCode == 401) {
        isLoading.value = false;
        Get.snackbar("UPDATE Penilaian FORM Gagal", "Status 401");
        return {"status": false, "message": "Terjadi kesalahan"};
      } else {
        isLoading.value = false;
        Get.snackbar("UPDATE Penilaian FORM Gagal", "Status 500");
        return {"status": false, "message": "Terjadi kesalahan"};
      }
    } on DioError catch (e) {
      if (e.type == DioErrorType.connectionTimeout) {
        isLoading.value = false;
        Get.snackbar(
            "UPDATE Penilaian FORM Gagal", "Terjadi kesalahan koneksi");
        return {"status": false, "message": "Terjadi kesalahan"};
      }
      if (e.type == DioErrorType.receiveTimeout) {
        isLoading.value = false;
        Get.snackbar(
            "UPDATE Penilaian FORM Gagal", "Terjadi kesalahan koneksi");
        return {"status": false, "message": "Terjadi kesalahan"};
      }
      if (e.type == DioErrorType.sendTimeout) {
        isLoading.value = false;
        Get.snackbar(
            "UPDATE Penilaian FORM Gagal", "Terjadi kesalahan koneksi");
        return {"status": false, "message": "Terjadi kesalahan"};
      }
    }

    return {"status": false, "message": "Terjadi kesalahan"};
  }

  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    if (jadwalSempro.pengujisatuNip!.contains(homeC.mapUser['data']['nip'])) {
      print("peng sempro 1");
      await getPenilaianKPPeng(penjadwalanSempro.pengujisatuNip.toString());
      listPenilaianPengSempro.addAll([
        "Revisi Judul",
        "Berita Acara",
      ]);
      Get.forceAppUpdate();
    }

    if (jadwalSempro.pengujiduaNip!.contains(homeC.mapUser['data']['nip'])) {
      print("peng sempro 2");
      await getPenilaianKPPeng(penjadwalanSempro.pengujiduaNip.toString());
      Get.forceAppUpdate();
    } else if (jadwalSempro.pengujitigaNip != null) {
      if (jadwalSempro.pengujitigaNip!.contains(homeC.mapUser['data']['nip'])) {
        print("peng sempro 3");
        await getPenilaianKPPeng(penjadwalanSempro.pengujitigaNip.toString());
        Get.forceAppUpdate();
      }
    }
  }

  Future<void> getBeritaAcara() async {
    final responsePemb =
        await dio.get("$baseUrlAPI/penilaian-sempro-pembimbing");
    final responsePeng = await dio.get("$baseUrlAPI/penilaian-sempro-penguji");

    if (responsePemb.statusCode == 200 && responsePeng.statusCode == 200) {
      List<PenilaianSemproPemb> pemb = [];
      List<PenilaianSemproPeng> peng = [];

      final dataPemb = responsePemb.data['data'];
      final dataPeng = responsePeng.data['data'];

      if (dataPemb != null && dataPeng != null) {
        dataPemb.forEach((element) {
          if (element['penjadwalan_sempro_id'].toString() ==
              penjadwalanSempro.id.toString()) {
            pemb.add(PenilaianSemproPemb.fromJson(element));
          }
        });

        if (pemb.last.pembimbingNip.toString().contains("null")) {
          pemb.removeLast();
        }

        dataPeng.forEach((element) {
          if (element['penjadwalan_sempro_id'].toString() ==
              penjadwalanSempro.id.toString()) {
            peng.add(PenilaianSemproPeng.fromJson(element));
          }
        });

        double totalPemb = pemb.map((expense) => expense.totalNilaiAngka).fold(
            0,
            (prev, amount) =>
                double.parse(prev.toString()) +
                double.parse(amount.toString()));

        // double totalPemb = dataPemb.map((e) => e['total_nilai_angka']).fold(
        //     0,
        //     (prev, amount) =>
        //         double.parse(prev.toString()) +
        //         double.parse(amount.toString()));

        totalPemb = totalPemb / pemb.length;

        double totalPeng = peng.map((e) => e.totalNilaiAngka).fold(
            0,
            (prev, amount) =>
                double.parse(prev.toString()) +
                double.parse(amount.toString()));

        // double totalPeng = dataPeng.map((e) => e['total_nilai_angka']).fold(
        //     0,
        //     (prev, amount) =>
        //         double.parse(prev.toString()) +
        //         double.parse(amount.toString()));

        totalPeng = totalPeng / peng.length;

        baNilaiAkhir.value = (totalPemb + totalPeng).ceilToDouble();
        if (baNilaiAkhir > 70) {
          //Kondisi Penilaian

          baNilaiHuruf.value = "B";
          baKeterangan.value = "Lulus";
        }

        if (baNilaiAkhir >= 85) {
          baNilaiHuruf.value = "A";
          baKeterangan.value = "Lulus";
        } else if (baNilaiAkhir >= 80) {
          baNilaiHuruf.value = "A-";
          baKeterangan.value = "Lulus";
        } else if (baNilaiAkhir >= 75) {
          baNilaiHuruf.value = "B+";
          baKeterangan.value = "Lulus";
        } else if (baNilaiAkhir >= 70) {
          baNilaiHuruf.value = "B";
          baKeterangan.value = "Lulus";
        } else if (baNilaiAkhir >= 65) {
          baNilaiHuruf.value = "B-";
          baKeterangan.value = "Lulus";
        } else if (baNilaiAkhir >= 60) {
          baNilaiHuruf.value = "C+";
          baKeterangan.value = "Lulus";
        } else if (baNilaiAkhir >= 55) {
          baNilaiHuruf.value = "C";
          baKeterangan.value = "Tidak Lulus";
        } else if (baNilaiAkhir >= 40) {
          baNilaiHuruf.value = "D";
          baKeterangan.value = "Tidak Lulus";
        } else {
          baNilaiHuruf.value = "E";
          baKeterangan.value = "Tidak Lulus";
        }

        isLoading.value = false;
      }
    }
  }
}
