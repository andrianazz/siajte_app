import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:siajte_app/app/data/models/dosen_model.dart';
import 'package:siajte_app/app/data/models/mahasiswa_model.dart';
import 'package:siajte_app/app/data/models/penjadwalan_skripsi_model.dart';
import 'package:siajte_app/app/routes/app_pages.dart';
import 'package:siajte_app/app/theme/variable.dart';

class EditJadwalSkripsiController extends GetxController {
  PenjadwalanSkripsi penjadwalanSkripsi = Get.arguments;

  Dio dio = Dio();
  late SharedPreferences prefs;

  // Type data biasa
  // late Mahasiswa mahasiswa;
  // late Dosen pembimbing1;
  // late Dosen pembimbing2;
  // late Dosen penguji1;
  // late Dosen penguji2;
  // late Dosen penguji3;

  // Type data Rx
  late Rx<Mahasiswa> mahasiswa = Mahasiswa().obs;
  late Rx<Dosen> pembimbing1 = Dosen().obs;
  late Rx<Dosen> pembimbing2 = Dosen().obs;
  late Rx<Dosen> penguji1 = Dosen().obs;
  late Rx<Dosen> penguji2 = Dosen().obs;
  late Rx<Dosen> penguji3 = Dosen().obs;

  late int prodiId = penjadwalanSkripsi.prodiId!;
  late TextEditingController judulSkripsi =
      TextEditingController(text: penjadwalanSkripsi.judulSkripsi);
  late Rx<DateTime> tanggal = DateTime.parse(penjadwalanSkripsi.tanggal!).obs;
  late Rx<TimeOfDay> waktu = TimeOfDay(
          hour: int.parse(penjadwalanSkripsi.waktu!.substring(0, 2)),
          minute: int.parse(penjadwalanSkripsi.waktu!.substring(3, 5)))
      .obs;
  late TextEditingController lokasi =
      TextEditingController(text: penjadwalanSkripsi.lokasi);

  RxBool isLoading = false.obs;

  Future<List<Mahasiswa>> getAllMahasiswa() async {
    List<Mahasiswa> allMahasiswa = [];
    try {
      var response = await dio.get('$baseUrlAPI/mahasiswa');
      if (response.statusCode == 200) {
        for (var item in response.data['data']) {
          allMahasiswa.add(Mahasiswa.fromJson(item));
        }

        mahasiswa.value = allMahasiswa
            .where((element) => element.nim == penjadwalanSkripsi.mahasiswaNim)
            .first;

        //sort mahasiswa nama
        allMahasiswa.sort((a, b) => a.nama!.compareTo(b.nama!));

        return allMahasiswa;
      }
    } catch (e) {
      print(e);
    }
    return allMahasiswa;
  }

  Future<List<Dosen>> getAllDosen1() async {
    List<Dosen> allDosen = [];
    try {
      var response = await dio.get('$baseUrlAPI/dosen');
      if (response.statusCode == 200) {
        for (var item in response.data['data']) {
          allDosen.add(Dosen.fromJson(item));
        }

        //sort mahasiswa nama
        allDosen.sort((a, b) => a.nama!.compareTo(b.nama!));

        pembimbing1.value = allDosen
            .where((element) =>
                element.nip == penjadwalanSkripsi.pembimbingsatuNip)
            .first;

        return allDosen;
      }
    } catch (e) {
      print(e);
    }
    return allDosen;
  }

  Future<List<Dosen>> getAllDosen2() async {
    List<Dosen> allDosen = [];
    try {
      var response = await dio.get('$baseUrlAPI/dosen');
      if (response.statusCode == 200) {
        for (var item in response.data['data']) {
          allDosen.add(Dosen.fromJson(item));
        }

        //sort mahasiswa nama
        allDosen.sort((a, b) => a.nama!.compareTo(b.nama!));

        if (penjadwalanSkripsi.pembimbingduaNip!.isNotEmpty) {
          pembimbing2.value = allDosen
              .where((element) =>
                  element.nip == penjadwalanSkripsi.pembimbingduaNip)
              .first;
        }

        return allDosen;
      }
    } catch (e) {
      print(e);
    }
    return allDosen;
  }

  Future<List<Dosen>> getAllDosen3() async {
    List<Dosen> allDosen = [];
    try {
      var response = await dio.get('$baseUrlAPI/dosen');
      if (response.statusCode == 200) {
        for (var item in response.data['data']) {
          allDosen.add(Dosen.fromJson(item));
        }

        //sort mahasiswa nama
        allDosen.sort((a, b) => a.nama!.compareTo(b.nama!));

        penguji1.value = allDosen
            .where(
                (element) => element.nip == penjadwalanSkripsi.pengujisatuNip)
            .first;

        return allDosen;
      }
    } catch (e) {
      print(e);
    }
    return allDosen;
  }

  Future<List<Dosen>> getAllDosen4() async {
    List<Dosen> allDosen = [];
    try {
      var response = await dio.get('$baseUrlAPI/dosen');
      if (response.statusCode == 200) {
        for (var item in response.data['data']) {
          allDosen.add(Dosen.fromJson(item));
        }

        //sort mahasiswa nama
        allDosen.sort((a, b) => a.nama!.compareTo(b.nama!));

        penguji2.value = allDosen
            .where((element) => element.nip == penjadwalanSkripsi.pengujiduaNip)
            .first;

        return allDosen;
      }
    } catch (e) {
      print(e);
    }
    return allDosen;
  }

  Future<List<Dosen>> getAllDosen5() async {
    List<Dosen> allDosen = [];
    try {
      var response = await dio.get('$baseUrlAPI/dosen');
      if (response.statusCode == 200) {
        for (var item in response.data['data']) {
          allDosen.add(Dosen.fromJson(item));
        }

        //sort mahasiswa nama
        allDosen.sort((a, b) => a.nama!.compareTo(b.nama!));

        if (penjadwalanSkripsi.pengujitigaNip!.isNotEmpty) {
          penguji3.value = allDosen
              .where(
                  (element) => element.nip == penjadwalanSkripsi.pengujitigaNip)
              .first;
        }

        return allDosen;
      }
    } catch (e) {
      print(e);
    }
    return allDosen;
  }

  Future<Map<String, dynamic>> editJadwalSkripsiAPI() async {
    isLoading.value = true;
    prefs = await SharedPreferences.getInstance();

    try {
      var response = await dio.put(
        "$baseUrlAPI/penjadwalan-skripsi/${penjadwalanSkripsi.id}",
        data: {
          "mahasiswa_nim": mahasiswa.value.nim,
          "pembimbingsatu_nip": pembimbing1.value.nip,
          "pembimbingdua_nip": pembimbing2.value.nip,
          "pengujisatu_nip": penguji1.value.nip,
          "pengujidua_nip": penguji2.value.nip,
          "pengujitiga_nip": penguji3.value.nip,
          "prodi_id": prodiId,
          "jenis_seminar": "Skripsi",
          "judul_skripsi": judulSkripsi.text,
          "tanggal": tanggal.value.toString().substring(0, 10),
          "waktu": "${waktu.value.hour}:${waktu.value.minute}:00",
          "lokasi": lokasi.text,
        },
        options: Options(
          receiveDataWhenStatusError: true,
          sendTimeout: const Duration(seconds: 5), // 60 seconds
          receiveTimeout: const Duration(seconds: 2),
        ),
      );

      var data = response.data;

      if (data != null) {
        Get.snackbar("UPDATE Jadwal Berhasil", "${data['status']}");
        isLoading.value = false;
        Get.offAllNamed(Routes.JADWAL_SEMINAR);

        return data;
      } else if (response.statusCode == 401) {
        isLoading.value = false;
        Get.snackbar("UPDATE Jadwal Gagal", "Status 401");
        return {"status": false, "message": "Terjadi kesalahan"};
      } else {
        isLoading.value = false;
        Get.snackbar("UPDATE Jadwal Gagal", "Status 500");
        return {"status": false, "message": "Terjadi kesalahan"};
      }
    } on DioError catch (e) {
      if (e.type == DioErrorType.connectionTimeout) {
        isLoading.value = false;
        Get.snackbar("UPDATE Jadwal Gagal", "Terjadi kesalahan koneksi");
        Get.offAllNamed(Routes.JADWAL_SEMINAR);

        return {"status": false, "message": "Terjadi kesalahan"};
      }
      if (e.type == DioErrorType.receiveTimeout) {
        isLoading.value = false;
        Get.snackbar("UPDATE Jadwal Gagal", "Terjadi kesalahan koneksi");
        Get.offAllNamed(Routes.JADWAL_SEMINAR);

        return {"status": false, "message": "Terjadi kesalahan"};
      }
      if (e.type == DioErrorType.sendTimeout) {
        isLoading.value = false;
        Get.snackbar("UPDATE Jadwal Gagal", "Terjadi kesalahan koneksi");
        Get.offAllNamed(Routes.JADWAL_SEMINAR);

        return {"status": false, "message": "Terjadi kesalahan"};
      }
    }
    isLoading.value = false;

    return {"status": false, "message": "Terjadi kesalahan"};
  }
}
