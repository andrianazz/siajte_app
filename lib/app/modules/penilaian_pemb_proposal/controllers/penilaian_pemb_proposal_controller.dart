// ignore_for_file: invalid_use_of_protected_member

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:siajte_app/app/data/models/penilaian_sempro_pemb_model.dart';
import 'package:siajte_app/app/data/models/penjadwalan_sempro_model.dart';
import 'package:siajte_app/app/modules/home/controllers/home_controller.dart';
import 'package:siajte_app/app/theme/variable.dart';
import 'package:siajte_app/app/widgets/penilaian_pemb_sempro/form_nilai_pemb_sempro.dart';

class PenilaianPembProposalController extends GetxController {
  RxBool isLoading = false.obs;
  PageController pageController = PageController();
  Dio dio = Dio();
  HomeController homeC = Get.find<HomeController>();

  late PenilaianSemproPemb existPenilaianSemproPemb;

  PenjadwalanSempro penjadwalanSempro = Get.arguments;

  RxDouble totalNilai = 0.0.obs;
  RxString nilaiHuruf = "".obs;

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

  Future<void> getPenilaianSempro(String nipPemb) async {
    isLoading.value = true;
    List<PenilaianSemproPemb> listPenilaianKP = <PenilaianSemproPemb>[];

    var response = await dio.get("$baseUrlAPI/penilaian-sempro-pembimbing");
    for (var item in response.data['data']) {
      listPenilaianKP.add(PenilaianSemproPemb.fromJson(item));
    }

    if (listPenilaianKP
        .where((element) => element.pembimbingNip!.contains(nipPemb))
        .toList()
        .isNotEmpty) {
      print("Ada data Pembimbing");
      existPenilaianSemproPemb = listPenilaianKP
          .where((element) => element.pembimbingNip!.contains(nipPemb))
          .first;

      scoreMapPembSempro.value['penguasaan_dasar_teori'] =
          existPenilaianSemproPemb.penguasaanDasarTeori == null
              ? 0.0
              : double.parse(
                  existPenilaianSemproPemb.penguasaanDasarTeori.toString());
      scoreMapPembSempro.value['tingkat_penguasaan_materi'] =
          existPenilaianSemproPemb.tingkatPenguasaanMateri == null
              ? 0.0
              : double.parse(
                  existPenilaianSemproPemb.tingkatPenguasaanMateri.toString());
      scoreMapPembSempro.value['tinjauan_pustaka'] = existPenilaianSemproPemb
                  .tinjauanPustaka ==
              null
          ? 0.0
          : double.parse(existPenilaianSemproPemb.tinjauanPustaka.toString());
      scoreMapPembSempro.value['tata_tulis'] =
          existPenilaianSemproPemb.tataTulis == null
              ? 0.0
              : double.parse(existPenilaianSemproPemb.tataTulis.toString());
      scoreMapPembSempro.value['sikap_dan_kepribadian'] =
          existPenilaianSemproPemb.sikapDanKepribadian == null
              ? 0.0
              : double.parse(
                  existPenilaianSemproPemb.sikapDanKepribadian.toString());

      await getTotalandHuruf();
    } else {
      print("Buat Baru pembimbing");

      await addPenilaianSemproPembAPI(nipPemb);
    }
  }

  Future<void> getTotalandHuruf() async {
    //sum value of scoreMapPemb
    double total = (scoreMapPembSempro.value['penguasaan_dasar_teori'] +
        scoreMapPembSempro.value['tingkat_penguasaan_materi'] +
        scoreMapPembSempro.value['tinjauan_pustaka'] +
        scoreMapPembSempro.value['tata_tulis'] +
        scoreMapPembSempro.value['sikap_dan_kepribadian']);

    if (total > 39) {
      nilaiHuruf.value = "A";
    } else if (total > 35) {
      nilaiHuruf.value = "A-";
    } else if (total > 33) {
      nilaiHuruf.value = "B+";
    } else if (total > 32) {
      nilaiHuruf.value = "B";
    } else if (total > 30) {
      nilaiHuruf.value = "B-";
    } else if (total > 26) {
      nilaiHuruf.value = "C+";
    } else if (total > 24) {
      nilaiHuruf.value = "C";
    } else if (total > 17) {
      nilaiHuruf.value = "D";
    } else {
      nilaiHuruf.value = "E";
    }

    totalNilai.value = total;
  }

  Future<Map<String, dynamic>> addPenilaianSemproPembAPI(String nipPemb) async {
    isLoading.value = true;

    try {
      var response = await dio.post(
        "$baseUrlAPI/penilaian-sempro-pembimbing",
        data: {
          "penjadwalan_sempro_id": penjadwalanSempro.id,
          "pembimbing_nip": nipPemb,
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
        existPenilaianSemproPemb = PenilaianSemproPemb.fromJson(data['data']);

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

  Future<Map<String, dynamic>> updateFormNilaiPembSemproAPI(String id) async {
    isLoading.value = true;

    try {
      var response = await dio.put(
        "$baseUrlAPI/penilaian-sempro-pembimbing/$id",
        data: scoreMapPembSempro,
        options: Options(
          receiveDataWhenStatusError: true,
          sendTimeout: const Duration(seconds: 5), // 60 seconds
          receiveTimeout: const Duration(seconds: 2),
        ),
      );

      var response2 = await dio.put(
        "$baseUrlAPI/penilaian-sempro-pembimbing/$id",
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
        getTotalandHuruf();

        Get.snackbar("UPDATE Penilaian FORM Berhasil", "${data['message']}");
        existPenilaianSemproPemb = PenilaianSemproPemb.fromJson(data['data']);

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
    if (penjadwalanSempro.pembimbingsatuNip.toString() ==
        homeC.mapUser['data']['nip'].toString()) {
      print("pemb sempro 1");
      await getPenilaianSempro(penjadwalanSempro.pembimbingsatuNip.toString());
    } else if (penjadwalanSempro.pembimbingduaNip.toString() ==
        homeC.mapUser['data']['nip'].toString()) {
      print("pemb sempro 2");
      await getPenilaianSempro(penjadwalanSempro.pembimbingduaNip.toString());
    }
  }
}
