// ignore_for_file: invalid_use_of_protected_member

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:siajte_app/app/data/models/penilaian_kp_peng_model.dart';
import 'package:siajte_app/app/data/models/penjadwalan_kp_model.dart';
import 'package:siajte_app/app/modules/home/controllers/home_controller.dart';
import 'package:siajte_app/app/modules/penilaian_peng_kp/views/penilaian_peng_kp_view.dart';
import 'package:siajte_app/app/theme/variable.dart';
import 'package:siajte_app/app/widgets/penilaian_kp_penguji/form_nilai_penguji.dart';

class PenilaianPengKpController extends GetxController {
  HomeController homeC = Get.put(HomeController());
  PenjadwalanKp penjadwalanKp = Get.arguments;

  RxBool isLoading = false.obs;
  PageController pageController = PageController();

  late PenilaianKpPeng existPenilaianKpPeng;

  RxDouble totalNilai = 0.0.obs;
  RxString nilaiHuruf = "".obs;

  TextEditingController revisiNaskah1C = TextEditingController();
  TextEditingController revisiNaskah2C = TextEditingController();
  TextEditingController revisiNaskah3C = TextEditingController();
  TextEditingController revisiNaskah4C = TextEditingController();
  TextEditingController revisiNaskah5C = TextEditingController();

  Dio dio = Dio();

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
        // return const FormNilaiPenguji();
        return const FormNilaiPenguji();

      case 1:
        return const SaranPerbaikanKPView();

      default:
        return const FormNilaiPenguji();
    }
  }

  RxMap<String, dynamic> scoreMapPeng = {
    "presentasi": 0.0,
    "materi": 0.0,
    "tanya_jawab": 0.0,
  }.obs;

  Future<void> getPenilaianKPPeng(String nipPeng) async {
    isLoading.value = true;
    List<PenilaianKpPeng> listPenilaianKPPeng = <PenilaianKpPeng>[];

    var response = await dio.get("$baseUrlAPI/penilaian-kp-penguji");
    for (var item in response.data['data']) {
      listPenilaianKPPeng.add(PenilaianKpPeng.fromJson(item));
    }

    if (listPenilaianKPPeng
        .where((element) => element.pengujiNip!.contains(nipPeng))
        .where((element) => element.penjadwalanKpId
            .toString()
            .contains(penjadwalanKp.id.toString()))
        .toList()
        .isNotEmpty) {
      print("Ada data Penguji");
      existPenilaianKpPeng = listPenilaianKPPeng
          .where((element) => element.pengujiNip!.contains(nipPeng))
          .where((element) => element.penjadwalanKpId
              .toString()
              .contains(penjadwalanKp.id.toString()))
          .first;

      scoreMapPeng.value['presentasi'] = existPenilaianKpPeng.presentasi != null
          ? double.parse(existPenilaianKpPeng.presentasi!)
          : 0.0;
      scoreMapPeng.value['materi'] = existPenilaianKpPeng.materi != null
          ? double.parse(existPenilaianKpPeng.materi!)
          : 0.0;
      scoreMapPeng.value['tanya_jawab'] =
          existPenilaianKpPeng.tanyaJawab != null
              ? double.parse(existPenilaianKpPeng.tanyaJawab!)
              : 0.0;

      await getTotalandHuruf();

      revisiNaskah1C.text = existPenilaianKpPeng.revisiNaskah1 ?? "";
      revisiNaskah2C.text = existPenilaianKpPeng.revisiNaskah2 ?? "";
      revisiNaskah3C.text = existPenilaianKpPeng.revisiNaskah3 ?? "";
      revisiNaskah4C.text = existPenilaianKpPeng.revisiNaskah4 ?? "";
      revisiNaskah5C.text = existPenilaianKpPeng.revisiNaskah5 ?? "";
    } else {
      print("Buat Baru Penguji");
      await addPenilaianKPPengAPI();
    }
  }

  Future<PenilaianKpPeng?> getPenilaianKPPengReturn(String nipPeng) async {
    isLoading.value = true;
    List<PenilaianKpPeng> listPenilaianKPPeng = <PenilaianKpPeng>[];

    var response = await dio.get("$baseUrlAPI/penilaian-kp-penguji",
        options: Options(
          receiveDataWhenStatusError: true,
          sendTimeout: const Duration(seconds: 5), // 60 seconds
          receiveTimeout: const Duration(seconds: 2),
        ));
    for (var item in response.data['data']) {
      listPenilaianKPPeng.add(PenilaianKpPeng.fromJson(item));
    }

    if (listPenilaianKPPeng
        .where((element) => element.pengujiNip!.contains(nipPeng))
        .where((element) => element.penjadwalanKpId
            .toString()
            .contains(penjadwalanKp.id.toString()))
        .toList()
        .isNotEmpty) {
      print("Ada data Penguji");
      existPenilaianKpPeng = listPenilaianKPPeng
          .where((element) => element.pengujiNip!.contains(nipPeng))
          .where((element) => element.penjadwalanKpId
              .toString()
              .contains(penjadwalanKp.id.toString()))
          .first;

      scoreMapPeng.value['presentasi'] = existPenilaianKpPeng.presentasi != null
          ? double.parse(existPenilaianKpPeng.presentasi!)
          : 0.0;
      scoreMapPeng.value['materi'] = existPenilaianKpPeng.materi != null
          ? double.parse(existPenilaianKpPeng.materi!)
          : 0.0;
      scoreMapPeng.value['tanya_jawab'] =
          existPenilaianKpPeng.tanyaJawab != null
              ? double.parse(existPenilaianKpPeng.tanyaJawab!)
              : 0.0;

      await getTotalandHuruf();

      revisiNaskah1C.text = existPenilaianKpPeng.revisiNaskah1 ?? "";
      revisiNaskah2C.text = existPenilaianKpPeng.revisiNaskah2 ?? "";
      revisiNaskah3C.text = existPenilaianKpPeng.revisiNaskah3 ?? "";
      revisiNaskah4C.text = existPenilaianKpPeng.revisiNaskah4 ?? "";
      revisiNaskah5C.text = existPenilaianKpPeng.revisiNaskah5 ?? "";

      return existPenilaianKpPeng;
    } else {
      print("Buat Baru Penguji");
      await addPenilaianKPPengAPI();
      return null;
    }
  }

  Future<void> getTotalandHuruf() async {
    //sum value of scoreMapPemb
    double total = (scoreMapPeng.value['presentasi'] +
            scoreMapPeng.value['materi'] +
            scoreMapPeng.value['tanya_jawab']) *
        3.333;

    if (total > 85) {
      nilaiHuruf.value = "A";
    } else if (total > 79) {
      nilaiHuruf.value = "A-";
    } else if (total > 75) {
      nilaiHuruf.value = "B+";
    } else if (total > 70) {
      nilaiHuruf.value = "B";
    } else if (total > 65) {
      nilaiHuruf.value = "B-";
    } else if (total > 60) {
      nilaiHuruf.value = "C+";
    } else if (total > 55) {
      nilaiHuruf.value = "C";
    } else if (total > 40) {
      nilaiHuruf.value = "D";
    } else {
      nilaiHuruf.value = "E";
    }

    totalNilai.value = total;
  }

  Future<Map<String, dynamic>> addPenilaianKPPengAPI() async {
    isLoading.value = true;

    try {
      var response = await dio.post(
        "$baseUrlAPI/penilaian-kp-penguji",
        data: {
          "penjadwalan_kp_id": penjadwalanKp.id,
          "penguji_nip": penjadwalanKp.pengujiNip,
        },
        options: Options(
          receiveDataWhenStatusError: true,
          sendTimeout: const Duration(seconds: 5), // 60 seconds
          receiveTimeout: const Duration(seconds: 2),
        ),
      );

      var data = response.data;

      if (data != null) {
        Get.snackbar("Add Penilaian Berhasil", "${data['status']}");
        existPenilaianKpPeng = PenilaianKpPeng.fromJson(data['data']);

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

  Future<Map<String, dynamic>> updateFormNilaiPembKPAPI(String id) async {
    isLoading.value = true;

    getTotalandHuruf();

    try {
      var response = await dio.put(
        "$baseUrlAPI/penilaian-kp-penguji/$id",
        data: scoreMapPeng,
        options: Options(
          receiveDataWhenStatusError: true,
          sendTimeout: const Duration(seconds: 5), // 60 seconds
          receiveTimeout: const Duration(seconds: 2),
        ),
      );

      var response2 = await dio.put(
        "$baseUrlAPI/penilaian-kp-penguji/$id",
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
        Get.snackbar("UPDATE Penilaian FORM Berhasil", "${data['status']}");
        existPenilaianKpPeng = PenilaianKpPeng.fromJson(data['data']);

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

  Future<Map<String, dynamic>> updateCatatanKPAPI(String id) async {
    isLoading.value = true;

    try {
      var response = await dio.put(
        "$baseUrlAPI/penilaian-kp-penguji/$id",
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

        Get.snackbar("UPDATE Penilaian FORM Berhasil", "${data['status']}");
        existPenilaianKpPeng = PenilaianKpPeng.fromJson(data['data']);

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
    await getPenilaianKPPeng(penjadwalanKp.pengujiNip.toString());
    Get.forceAppUpdate();
  }
}
