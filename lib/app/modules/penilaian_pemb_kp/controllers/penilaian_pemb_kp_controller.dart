// ignore_for_file: invalid_use_of_protected_member

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:siajte_app/app/data/models/penilaian_kp_pemb_model.dart';
import 'package:siajte_app/app/data/models/penjadwalan_kp_model.dart';
import 'package:siajte_app/app/modules/home/controllers/home_controller.dart';
import 'package:siajte_app/app/modules/penilaian_pemb_kp/views/penilaian_pemb_kp_view.dart';
import 'package:siajte_app/app/modules/penilaian_peng_kp/controllers/penilaian_peng_kp_controller.dart';
import 'package:siajte_app/app/theme/variable.dart';
import 'package:siajte_app/app/widgets/penilaian_kp_pembimbing/card_ba_kp_widget.dart';
import 'package:siajte_app/app/widgets/penilaian_kp_pembimbing/form_nilai_kp.dart';

class PenilaianPembKpController extends GetxController {
  Dio dio = Dio();
  RxBool isLoading = false.obs;

  late PenilaianKpPemb existPenilaianKpPemb;

  HomeController homeC = Get.put(HomeController());
  PenilaianPengKpController penilaianPengKpC =
      Get.put(PenilaianPengKpController());

  PenjadwalanKp penjadwalanKp = Get.arguments;

  RxDouble totalNilai = 0.0.obs;
  RxString nilaiHuruf = "".obs;

  PageController pageController = PageController();
  TextEditingController nilaiLapanganC = TextEditingController();
  TextEditingController catatan1C = TextEditingController();
  TextEditingController catatan2C = TextEditingController();
  TextEditingController catatan3C = TextEditingController();

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

  RxMap<String, dynamic> scoreMapPemb = {
    "presentasi": 0.0,
    "materi": 0.0,
    "tanya_jawab": 0.0,
  }.obs;

  // Berita Acara
  RxInt baNilaiSeminar = 0.obs;
  RxInt baNilaiPembimbing = 0.obs;
  RxInt baNilaiLapangan = 0.obs;
  RxInt baTotalAkhir = 0.obs;

  Future<void> selesaikanSeminar(id) async {
    isLoading.value = true;

    var response = await dio.put(
      "$baseUrlAPI/penjadwalan-kp/$id",
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
    isLoading.value = false;
  }

  Future<void> getPenilaianKP() async {
    isLoading.value = true;
    List<PenilaianKpPemb> listPenilaianKP = <PenilaianKpPemb>[];

    var response = await dio.get("$baseUrlAPI/penilaian-kp-pembimbing");
    for (var item in response.data['data']) {
      listPenilaianKP.add(PenilaianKpPemb.fromJson(item));
    }

    if (listPenilaianKP
        .where((element) =>
            element.pembimbingNip!.contains(homeC.mapUser['data']['nip']))
        .where((element) => element.penjadwalanKpId
            .toString()
            .contains(penjadwalanKp.id.toString()))
        .toList()
        .isNotEmpty) {
      print("Ada data Pembimbing");
      existPenilaianKpPemb = listPenilaianKP
          .where((element) =>
              element.pembimbingNip!.contains(homeC.mapUser['data']['nip']))
          .where((element) => element.penjadwalanKpId
              .toString()
              .contains(penjadwalanKp.id.toString()))
          .first;

      print(existPenilaianKpPemb.presentasi);

      scoreMapPemb.value['presentasi'] =
          existPenilaianKpPemb.presentasi.toString() == "null"
              ? 0.0
              : double.parse(existPenilaianKpPemb.presentasi);
      scoreMapPemb.value['materi'] =
          existPenilaianKpPemb.materi.toString() == "null"
              ? 0.0
              : double.parse(existPenilaianKpPemb.materi);
      scoreMapPemb.value['tanya_jawab'] =
          existPenilaianKpPemb.tanyaJawab.toString() == "null"
              ? 0.0
              : double.parse(existPenilaianKpPemb.tanyaJawab);

      await getTotalandHuruf();

      nilaiLapanganC.text = existPenilaianKpPemb.nilaiPembimbingLapangan ?? "";
      catatan1C.text = existPenilaianKpPemb.catatan1 ?? "";
      catatan2C.text = existPenilaianKpPemb.catatan2 ?? "";
      catatan3C.text = existPenilaianKpPemb.catatan3 ?? "";
    } else {
      print("Buat Baru pembimbing");
      await addPenilaianKPPembAPI();
    }
  }

  Future<PenilaianKpPemb> getPenilaianKPReturn() async {
    isLoading.value = true;
    List<PenilaianKpPemb> listPenilaianKP = <PenilaianKpPemb>[];

    var response = await dio.get("$baseUrlAPI/penilaian-kp-pembimbing");
    for (var item in response.data['data']) {
      listPenilaianKP.add(PenilaianKpPemb.fromJson(item));
    }

    if (listPenilaianKP
        .where((element) =>
            element.pembimbingNip!.contains(homeC.mapUser['data']['nip']))
        .where((element) => element.penjadwalanKpId
            .toString()
            .contains(penjadwalanKp.id.toString()))
        .toList()
        .isNotEmpty) {
      print("Ada data Pembimbing");
      existPenilaianKpPemb = listPenilaianKP
          .where((element) =>
              element.pembimbingNip!.contains(homeC.mapUser['data']['nip']))
          .where((element) => element.penjadwalanKpId
              .toString()
              .contains(penjadwalanKp.id.toString()))
          .first;

      scoreMapPemb.value['presentasi'] =
          existPenilaianKpPemb.presentasi.toString() == "null"
              ? 0.0
              : double.parse(existPenilaianKpPemb.presentasi);
      scoreMapPemb.value['materi'] =
          existPenilaianKpPemb.materi.toString() == "null"
              ? 0.0
              : double.parse(existPenilaianKpPemb.materi);
      scoreMapPemb.value['tanya_jawab'] =
          existPenilaianKpPemb.tanyaJawab.toString() == "null"
              ? 0.0
              : double.parse(existPenilaianKpPemb.tanyaJawab);

      await getTotalandHuruf();

      nilaiLapanganC.text = existPenilaianKpPemb.nilaiPembimbingLapangan ?? "";
      catatan1C.text = existPenilaianKpPemb.catatan1 ?? "";
      catatan2C.text = existPenilaianKpPemb.catatan2 ?? "";
      catatan3C.text = existPenilaianKpPemb.catatan3 ?? "";
      return existPenilaianKpPemb;
    } else {
      print("Buat Baru pembimbing");
      await addPenilaianKPPembAPI();
      return existPenilaianKpPemb;
    }
  }

  Future<void> getTotalandHuruf() async {
    //sum value of scoreMapPemb
    double total = (scoreMapPemb.value['presentasi'] +
            scoreMapPemb.value['materi'] +
            scoreMapPemb.value['tanya_jawab']) *
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

  Future<Map<String, dynamic>> addPenilaianKPPembAPI() async {
    isLoading.value = true;

    try {
      var response = await dio.post(
        "$baseUrlAPI/penilaian-kp-pembimbing",
        data: {
          "penjadwalan_kp_id": penjadwalanKp.id,
          "pembimbing_nip": penjadwalanKp.pembimbingNip,
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
        existPenilaianKpPemb = PenilaianKpPemb.fromJson(data['data']);

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
        "$baseUrlAPI/penilaian-kp-pembimbing/$id",
        data: scoreMapPemb,
        options: Options(
          receiveDataWhenStatusError: true,
          sendTimeout: const Duration(seconds: 5), // 60 seconds
          receiveTimeout: const Duration(seconds: 2),
        ),
      );

      var response2 = await dio.put(
        "$baseUrlAPI/penilaian-kp-pembimbing/$id",
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
        existPenilaianKpPemb = PenilaianKpPemb.fromJson(data['data']);

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

  Future<Map<String, dynamic>> updateNilaiLapPembKPAPI(String id) async {
    isLoading.value = true;

    try {
      var response = await dio.put(
        "$baseUrlAPI/penilaian-kp-pembimbing/$id",
        data: {
          "nilai_pembimbing_lapangan": nilaiLapanganC.text,
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
        existPenilaianKpPemb = PenilaianKpPemb.fromJson(data['data']);

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
        "$baseUrlAPI/penilaian-kp-pembimbing/$id",
        data: {
          "catatan1": catatan1C.text,
          "catatan2": catatan2C.text,
          "catatan3": catatan3C.text,
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
        existPenilaianKpPemb = PenilaianKpPemb.fromJson(data['data']);

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

  Future<void> getBeritaAcara() async {
    baNilaiLapangan.value = existPenilaianKpPemb.nilaiPembimbingLapangan == null
        ? 0
        : (int.parse(existPenilaianKpPemb.nilaiPembimbingLapangan) * 0.4)
            .toInt();
    baNilaiPembimbing.value = existPenilaianKpPemb.totalNilaiAngka == null
        ? 0
        : (int.parse(existPenilaianKpPemb.totalNilaiAngka) * 0.3).toInt();
    baNilaiSeminar.value = penilaianPengKpC
                .existPenilaianKpPeng.totalNilaiAngka ==
            null
        ? 0
        : (int.parse(penilaianPengKpC.existPenilaianKpPeng.totalNilaiAngka) *
                0.3)
            .toInt();

    baTotalAkhir.value =
        baNilaiLapangan.value + baNilaiPembimbing.value + baNilaiSeminar.value;
  }

  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    await getPenilaianKP();
    await penilaianPengKpC
        .getPenilaianKPPeng(penjadwalanKp.pengujiNip.toString());
    Get.forceAppUpdate();
  }
}
