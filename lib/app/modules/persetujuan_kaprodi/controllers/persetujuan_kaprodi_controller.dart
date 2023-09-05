import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:siajte_app/app/data/models/penilaian_skripsi_pemb_model.dart';
import 'package:siajte_app/app/data/models/penilaian_skripsi_peng_model.dart';
import 'package:siajte_app/app/data/models/penjadwalan_skripsi_model.dart';
import 'package:siajte_app/app/modules/home/controllers/home_controller.dart';
import 'package:siajte_app/app/modules/penialian_pemb_skipsi/controllers/penialian_pemb_skipsi_controller.dart';
import 'package:siajte_app/app/modules/penilaian_peng_skripsi/controllers/penilaian_peng_skripsi_controller.dart';
import 'package:siajte_app/app/theme/variable.dart';
import 'package:siajte_app/app/widgets/kaprodi/card_ba_skripsi_kaprodi.dart';

class PersetujuanKaprodiController extends GetxController {
  PenilaianPengSkripsiController penilaianPengController =
      Get.put(PenilaianPengSkripsiController());
  PenialianPembSkipsiController penilaianPembController =
      Get.put(PenialianPembSkipsiController());

  late Future<PenilaianSkripsiPeng?> penguji1;
  late Future<PenilaianSkripsiPeng?> penguji2;
  late Future<PenilaianSkripsiPeng?> penguji3;
  late Future<PenilaianSkripsiPemb?> pembimbing1;
  late Future<PenilaianSkripsiPemb?> pembimbing2;

  RxBool isLoading = false.obs;
  PageController pageController = PageController();

  Dio dio = Dio();

  late PenilaianSkripsiPeng existPenilaianSkripsiPeng;

  HomeController homeC = Get.put(HomeController());
  PenjadwalanSkripsi jadwalSkripsi = Get.arguments;

  RxInt selectedChips = 0.obs;

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
  RxList<String> listPenilaianPengSkripsi = ["Berita Acara"].obs;

  RxInt indexFormNilaiPengSkripsi = 0.obs;

  Widget viewListPenilaianPengProposal() {
    switch (selectedChips.value) {
      case 0:
        return const CardBASkripsiKaprodi();

      default:
        return const CardBASkripsiKaprodi();
    }
  }

  RxMap scoreMapPengSkripsi = {
    "presentasi": 0.0,
    "tingkat_penguasaan_materi": 0.0,
    "keaslian": 0.0,
    "ketepatan_metodologi": 0.0,
    "penguasaan_dasar_teori": 0.0,
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

  Future<void> getPenilaianSkripsiPeng(String nipPeng) async {
    isLoading.value = true;
    List<PenilaianSkripsiPeng> listPenilaianSkripsiPeng =
        <PenilaianSkripsiPeng>[];

    var response = await dio.get("$baseUrlAPI/penilaian-skripsi-penguji");
    for (var item in response.data['data']) {
      listPenilaianSkripsiPeng.add(PenilaianSkripsiPeng.fromJson(item));
    }

    if (listPenilaianSkripsiPeng
        .where((element) => element.pengujiNip!.contains(nipPeng))
        .where((element) => element.penjadwalanSkripsiId
            .toString()
            .contains(jadwalSkripsi.id.toString()))
        .toList()
        .isNotEmpty) {
      print("Ada data Penguji");

      existPenilaianSkripsiPeng = listPenilaianSkripsiPeng
          .where((element) => element.pengujiNip!.contains(nipPeng))
          .where((element) => element.penjadwalanSkripsiId
              .toString()
              .contains(jadwalSkripsi.id.toString()))
          .first;

      scoreMapPengSkripsi.value['presentasi'] =
          existPenilaianSkripsiPeng.presentasi != null
              ? double.parse(existPenilaianSkripsiPeng.presentasi!.toString())
              : 0.0;
      scoreMapPengSkripsi.value['tingkat_penguasaan_materi'] =
          existPenilaianSkripsiPeng.tingkatPenguasaanMateri != null
              ? double.parse(
                  existPenilaianSkripsiPeng.tingkatPenguasaanMateri!.toString())
              : 0.0;
      scoreMapPengSkripsi.value['keaslian'] =
          existPenilaianSkripsiPeng.keaslian != null
              ? double.parse(existPenilaianSkripsiPeng.keaslian!.toString())
              : 0.0;
      scoreMapPengSkripsi.value['ketepatan_metodologi'] =
          existPenilaianSkripsiPeng.ketepatanMetodologi != null
              ? double.parse(
                  existPenilaianSkripsiPeng.ketepatanMetodologi!.toString())
              : 0.0;
      scoreMapPengSkripsi.value['penguasaan_dasar_teori'] =
          existPenilaianSkripsiPeng.penguasaanDasarTeori != null
              ? double.parse(
                  existPenilaianSkripsiPeng.penguasaanDasarTeori!.toString())
              : 0.0;
      scoreMapPengSkripsi.value['kecermatan_perumusan_masalah'] =
          existPenilaianSkripsiPeng.kecermatanPerumusanMasalah != null
              ? double.parse(existPenilaianSkripsiPeng
                      .kecermatanPerumusanMasalah!
                      .toString())
                  .toDouble()
              : 0.0;
      scoreMapPengSkripsi.value['tinjauan_pustaka'] = existPenilaianSkripsiPeng
                  .tinjauanPustaka !=
              null
          ? double.parse(existPenilaianSkripsiPeng.tinjauanPustaka!.toString())
          : 0.0;
      scoreMapPengSkripsi.value['tata_tulis'] =
          existPenilaianSkripsiPeng.tataTulis != null
              ? double.parse(existPenilaianSkripsiPeng.tataTulis!.toString())
              : 0.0;
      scoreMapPengSkripsi.value['tools'] =
          existPenilaianSkripsiPeng.tools != null
              ? double.parse(existPenilaianSkripsiPeng.tools!.toString())
              : 0.0;
      scoreMapPengSkripsi.value['penyajian_data'] = existPenilaianSkripsiPeng
                  .penyajianData !=
              null
          ? double.parse(existPenilaianSkripsiPeng.penyajianData!.toString())
          : 0.0;
      scoreMapPengSkripsi.value['hasil'] =
          existPenilaianSkripsiPeng.hasil != null
              ? double.parse(existPenilaianSkripsiPeng.hasil!.toString())
              : 0.0;
      scoreMapPengSkripsi.value['pembahasan'] =
          existPenilaianSkripsiPeng.pembahasan != null
              ? double.parse(existPenilaianSkripsiPeng.pembahasan!.toString())
              : 0.0;
      scoreMapPengSkripsi.value['kesimpulan'] =
          existPenilaianSkripsiPeng.kesimpulan != null
              ? double.parse(existPenilaianSkripsiPeng.kesimpulan!.toString())
              : 0.0;
      scoreMapPengSkripsi.value['luaran'] =
          existPenilaianSkripsiPeng.luaran != null
              ? double.parse(existPenilaianSkripsiPeng.luaran!.toString())
              : 0.0;
      scoreMapPengSkripsi.value['sumbangan_pemikiran'] =
          existPenilaianSkripsiPeng.sumbanganPemikiran != null
              ? double.parse(
                  existPenilaianSkripsiPeng.sumbanganPemikiran!.toString())
              : 0.0;

      await getTotalandHuruf();

      revisiNaskah1C.text = existPenilaianSkripsiPeng.revisiNaskah1 ?? "";
      revisiNaskah2C.text = existPenilaianSkripsiPeng.revisiNaskah2 ?? "";
      revisiNaskah3C.text = existPenilaianSkripsiPeng.revisiNaskah3 ?? "";
      revisiNaskah4C.text = existPenilaianSkripsiPeng.revisiNaskah4 ?? "";
      revisiNaskah5C.text = existPenilaianSkripsiPeng.revisiNaskah5 ?? "";
    } else {
      print("Buat Baru Penguji");
      await addPenilaianSkripsiPengAPI(nipPeng);
    }
  }

  Future<void> selesaikanSeminar(id) async {
    isLoading.value = true;

    var response = await dio.put(
      "$baseUrlAPI/penjadwalan-skripsi/$id",
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

  Future<void> getTotalandHuruf() async {
    //sum value of scoreMapPemb
    double total = scoreMapPengSkripsi.value['presentasi'] +
        scoreMapPengSkripsi.value['tingkat_penguasaan_materi'] +
        scoreMapPengSkripsi.value['keaslian'] +
        scoreMapPengSkripsi.value['ketepatan_metodologi'] +
        scoreMapPengSkripsi.value['penguasaan_dasar_teori'] +
        scoreMapPengSkripsi.value['kecermatan_perumusan_masalah'] +
        scoreMapPengSkripsi.value['tinjauan_pustaka'] +
        scoreMapPengSkripsi.value['tata_tulis'] +
        scoreMapPengSkripsi.value['tools'] +
        scoreMapPengSkripsi.value['penyajian_data'] +
        scoreMapPengSkripsi.value['hasil'] +
        scoreMapPengSkripsi.value['pembahasan'] +
        scoreMapPengSkripsi.value['kesimpulan'] +
        scoreMapPengSkripsi.value['luaran'] +
        scoreMapPengSkripsi.value['sumbangan_pemikiran'];

    if (total > 47) {
      nilaiHuruf.value = "A";
    } else if (total > 45) {
      nilaiHuruf.value = "A-";
    } else if (total > 42) {
      nilaiHuruf.value = "B+";
    } else if (total > 40) {
      nilaiHuruf.value = "B";
    } else if (total > 36) {
      nilaiHuruf.value = "B-";
    } else if (total > 33) {
      nilaiHuruf.value = "C+";
    } else if (total > 32) {
      nilaiHuruf.value = "C";
    } else if (total > 22) {
      nilaiHuruf.value = "D";
    } else {
      nilaiHuruf.value = "E";
    }

    totalNilai.value = total;
  }

  Future<Map<String, dynamic>> addPenilaianSkripsiPengAPI(
      String nipPemb) async {
    isLoading.value = true;

    try {
      var response = await dio.post(
        "$baseUrlAPI/penilaian-skripsi-penguji",
        data: {
          "penjadwalan_skripsi_id": jadwalSkripsi.id,
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
        existPenilaianSkripsiPeng = PenilaianSkripsiPeng.fromJson(data['data']);

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

  Future<void> getBeritaAcara() async {
    final responsePemb =
        await dio.get("$baseUrlAPI/penilaian-skripsi-pembimbing");
    final responsePeng = await dio.get("$baseUrlAPI/penilaian-skripsi-penguji");

    if (responsePemb.statusCode == 200 && responsePeng.statusCode == 200) {
      List<PenilaianSkripsiPemb> pemb = [];
      List<PenilaianSkripsiPeng> peng = [];

      final dataPemb = responsePemb.data['data'];
      final dataPeng = responsePeng.data['data'];

      if (dataPemb != null && dataPeng != null) {
        dataPemb.forEach((element) {
          if (element['penjadwalan_skripsi_id'].toString() ==
              jadwalSkripsi.id.toString()) {
            pemb.add(PenilaianSkripsiPemb.fromJson(element));
          }
        });

        dataPeng.forEach((element) {
          if (element['penjadwalan_skripsi_id'].toString() ==
              jadwalSkripsi.id.toString()) {
            peng.add(PenilaianSkripsiPeng.fromJson(element));
          }
        });

        double totalPemb = pemb.map((expense) => expense.totalNilaiAngka).fold(
            0,
            (prev, amount) =>
                double.parse(prev.toString()) +
                double.parse(amount.toString()));

        totalPemb = totalPemb / pemb.length;

        double totalPeng = peng.map((e) => e.totalNilaiAngka).fold(
            0,
            (prev, amount) =>
                double.parse(prev.toString()) +
                double.parse(amount.toString()));

        totalPeng = totalPeng / peng.length;

        baNilaiAkhir.value = (totalPemb + totalPeng).ceilToDouble();
        if (baNilaiAkhir > 70) {
          //Kondisi Penilaian

          baNilaiHuruf.value = "B";
          baKeterangan.value = "Lulus";
        }

        isLoading.value = false;
      }
    }
  }

  Future<Map<String, dynamic>> updateFormNilaiPengSkripsiAPI(String id) async {
    isLoading.value = true;
    getTotalandHuruf();

    try {
      var response = await dio.put(
        "$baseUrlAPI/penilaian-skripsi-penguji/$id",
        data: scoreMapPengSkripsi,
        options: Options(
          receiveDataWhenStatusError: true,
          sendTimeout: const Duration(seconds: 5), // 60 seconds
          receiveTimeout: const Duration(seconds: 2),
        ),
      );

      var response2 = await dio.put(
        "$baseUrlAPI/penilaian-skripsi-penguji/$id",
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
        existPenilaianSkripsiPeng = PenilaianSkripsiPeng.fromJson(data['data']);

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

  Future<Map<String, dynamic>> updateCatatanSkripsiAPI(String id) async {
    isLoading.value = true;

    try {
      var response = await dio.put(
        "$baseUrlAPI/penilaian-skripsi-penguji/$id",
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
        existPenilaianSkripsiPeng = PenilaianSkripsiPeng.fromJson(data['data']);

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

  Future<Map<String, dynamic>> updateRevisiSkripsiAPI(String id) async {
    isLoading.value = true;

    try {
      var response = await dio.put(
        "$baseUrlAPI/penilaian-skripsi-penguji/$id",
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
        existPenilaianSkripsiPeng = PenilaianSkripsiPeng.fromJson(data['data']);

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
    penguji1 = penilaianPengController.getPenilaianSkripsiPengReturn(
        penilaianPengController.jadwalSkripsi.pengujisatuNip.toString());
    penguji2 = penilaianPengController.getPenilaianSkripsiPengReturn(
        penilaianPengController.jadwalSkripsi.pengujiduaNip.toString());
    penguji3 = penilaianPengController.getPenilaianSkripsiPengReturn(
        penilaianPengController.jadwalSkripsi.pengujitigaNip.toString());
    pembimbing1 = penilaianPembController.getPenilaianSkripsiReturn(
        penilaianPembController.penjadwalanSkripsi.pembimbingsatuNip
            .toString());

    update();

    if (penilaianPembController.penjadwalanSkripsi.pembimbingduaNip
            .toString() !=
        "null") {
      pembimbing2 = penilaianPembController.getPenilaianSkripsiReturn(
          penilaianPembController.penjadwalanSkripsi.pembimbingduaNip
              .toString());
    }

    if (jadwalSkripsi.pengujisatuNip!.contains(homeC.mapUser['data']['nip'])) {
      print("peng sempro 1");

      await getPenilaianSkripsiPeng(jadwalSkripsi.pengujisatuNip.toString());
      Get.forceAppUpdate();
    }

    if (jadwalSkripsi.pengujiduaNip!.contains(homeC.mapUser['data']['nip'])) {
      print("peng sempro 2");
      await getPenilaianSkripsiPeng(jadwalSkripsi.pengujiduaNip.toString());
      Get.forceAppUpdate();
    } else if (jadwalSkripsi.pengujitigaNip != null) {
      if (jadwalSkripsi.pengujitigaNip!
          .contains(homeC.mapUser['data']['nip'])) {
        print("peng sempro 3");
        await getPenilaianSkripsiPeng(jadwalSkripsi.pengujitigaNip.toString());
        Get.forceAppUpdate();
      }
    }
  }
}
