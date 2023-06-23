import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:siajte_app/app/data/models/penilaian_skripsi_pemb_model.dart';
import 'package:siajte_app/app/data/models/penjadwalan_skripsi_model.dart';
import 'package:siajte_app/app/modules/home/controllers/home_controller.dart';
import 'package:siajte_app/app/theme/variable.dart';
import 'package:siajte_app/app/widgets/penilaian_pemb_skripsi/form_nilai_pemb_skripsi.dart';

class PenialianPembSkipsiController extends GetxController {
  RxBool isLoading = false.obs;
  Dio dio = Dio();
  PageController pageController = PageController();

  late PenilaianSkripsiPemb existPenilaianSkripsiPemb;

  RxDouble totalNilai = 0.0.obs;
  RxString nilaiHuruf = "".obs;

  HomeController homeC = Get.put(HomeController());

  PenjadwalanSkripsi penjadwalanSkripsi = Get.arguments;

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

  Future<void> getPenilaianSkripsi(String nipPemb) async {
    isLoading.value = true;
    List<PenilaianSkripsiPemb> listPenilaianSkripsi = <PenilaianSkripsiPemb>[];

    var response = await dio.get("$baseUrlAPI/penilaian-skripsi-pembimbing");
    for (var item in response.data['data']) {
      listPenilaianSkripsi.add(PenilaianSkripsiPemb.fromJson(item));
    }

    if (listPenilaianSkripsi
        .where((element) => element.pembimbingNip!.contains(nipPemb))
        .toList()
        .isNotEmpty) {
      print("Ada data Pembimbing");
      existPenilaianSkripsiPemb = listPenilaianSkripsi
          .where((element) => element.pembimbingNip!.contains(nipPemb))
          .first;

      scoreMapPembSkripsi.value['penguasaan_dasar_teori'] =
          existPenilaianSkripsiPemb.penguasaanDasarTeori == null
              ? 0.0
              : double.parse(
                  existPenilaianSkripsiPemb.penguasaanDasarTeori.toString());
      scoreMapPembSkripsi.value['tingkat_penguasaan_materi'] =
          existPenilaianSkripsiPemb.tingkatPenguasaanMateri == null
              ? 0.0
              : double.parse(
                  existPenilaianSkripsiPemb.tingkatPenguasaanMateri.toString());
      scoreMapPembSkripsi.value['tinjauan_pustaka'] = existPenilaianSkripsiPemb
                  .tinjauanPustaka ==
              null
          ? 0.0
          : double.parse(existPenilaianSkripsiPemb.tinjauanPustaka.toString());
      scoreMapPembSkripsi.value['tata_tulis'] =
          existPenilaianSkripsiPemb.tataTulis == null
              ? 0.0
              : double.parse(existPenilaianSkripsiPemb.tataTulis.toString());
      scoreMapPembSkripsi.value['hasil_dan_pembahasan'] =
          existPenilaianSkripsiPemb.hasilDanPembahasan == null
              ? 0.0
              : double.parse(
                  existPenilaianSkripsiPemb.hasilDanPembahasan.toString());
      scoreMapPembSkripsi.value['sikap_dan_kepribadian'] =
          existPenilaianSkripsiPemb.sikapDanKepribadian == null
              ? 0.0
              : double.parse(
                  existPenilaianSkripsiPemb.sikapDanKepribadian.toString());

      await getTotalandHuruf();
    } else {
      print("Buat Baru pembimbing");

      await addPenilaianSkripsiPembAPI(nipPemb);
    }
  }

  Future<void> getTotalandHuruf() async {
    //sum value of scoreMapPemb
    double total = (scoreMapPembSkripsi.value['penguasaan_dasar_teori'] +
        scoreMapPembSkripsi.value['tingkat_penguasaan_materi'] +
        scoreMapPembSkripsi.value['tinjauan_pustaka'] +
        scoreMapPembSkripsi.value['tata_tulis'] +
        scoreMapPembSkripsi.value['hasil_dan_pembahasan'] +
        scoreMapPembSkripsi.value['sikap_dan_kepribadian']);

    if (total >= 44) {
      nilaiHuruf.value = "A";
    } else if (total >= 42) {
      nilaiHuruf.value = "A-";
    } else if (total >= 40) {
      nilaiHuruf.value = "B+";
    } else if (total >= 39) {
      nilaiHuruf.value = "B";
    } else if (total >= 35) {
      nilaiHuruf.value = "B-";
    } else if (total >= 31) {
      nilaiHuruf.value = "C+";
    } else if (total >= 29) {
      nilaiHuruf.value = "C";
    } else if (total >= 20) {
      nilaiHuruf.value = "D";
    } else {
      nilaiHuruf.value = "E";
    }

    totalNilai.value = total;
  }

  Future<Map<String, dynamic>> addPenilaianSkripsiPembAPI(
      String nipPemb) async {
    isLoading.value = true;

    try {
      var response = await dio.post(
        "$baseUrlAPI/penilaian-skripsi-pembimbing",
        data: {
          "penjadwalan_skripsi_id": penjadwalanSkripsi.id,
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
        Get.snackbar("Add Penilaian Berhasil", "${data['status']}");
        existPenilaianSkripsiPemb = PenilaianSkripsiPemb.fromJson(data['data']);

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

  Future<Map<String, dynamic>> updateFormNilaiPembSkripsiAPI(String id) async {
    isLoading.value = true;

    getTotalandHuruf();

    try {
      var response = await dio.put(
        "$baseUrlAPI/penilaian-skripsi-pembimbing/$id",
        data: scoreMapPembSkripsi,
        options: Options(
          receiveDataWhenStatusError: true,
          sendTimeout: const Duration(seconds: 5), // 60 seconds
          receiveTimeout: const Duration(seconds: 2),
        ),
      );

      var response2 = await dio.put(
        "$baseUrlAPI/penilaian-skripsi-pembimbing/$id",
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
        existPenilaianSkripsiPemb = PenilaianSkripsiPemb.fromJson(data['data']);

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
    if (penjadwalanSkripsi.pembimbingsatuNip.toString() ==
        homeC.mapUser['data']['nip'].toString()) {
      print("pemb sempro 1");
      await getPenilaianSkripsi(
          penjadwalanSkripsi.pembimbingsatuNip.toString());
    } else if (penjadwalanSkripsi.pembimbingduaNip != null) {
      if (penjadwalanSkripsi.pembimbingduaNip.toString() ==
          homeC.mapUser['data']['nip'].toString()) {
        print("pemb sempro 2");
        await getPenilaianSkripsi(
            penjadwalanSkripsi.pembimbingduaNip.toString());
      }
    }
  }
}
