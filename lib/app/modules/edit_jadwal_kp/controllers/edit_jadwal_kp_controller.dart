import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:siajte_app/app/data/models/dosen_model.dart';
import 'package:siajte_app/app/data/models/mahasiswa_model.dart';
import 'package:siajte_app/app/data/models/penjadwalan_kp_model.dart';
import 'package:siajte_app/app/routes/app_pages.dart';
import 'package:siajte_app/app/theme/variable.dart';

class EditJadwalKpController extends GetxController {
  PenjadwalanKp penjadwalanKp = Get.arguments;

  Dio dio = Dio();
  late SharedPreferences prefs;

  late Mahasiswa mahasiswa;

  late Dosen pembimbing;
  late Dosen penguji;

  late int prodiId = penjadwalanKp.prodiId!;
  late TextEditingController judulKP =
      TextEditingController(text: penjadwalanKp.judulKp);
  late Rx<DateTime> tanggal = DateTime.parse(penjadwalanKp.tanggal!).obs;
  late Rx<TimeOfDay> waktu = TimeOfDay(
          hour: int.parse(penjadwalanKp.waktu!.substring(0, 2)),
          minute: int.parse(penjadwalanKp.waktu!.substring(3, 5)))
      .obs;
  late TextEditingController lokasi =
      TextEditingController(text: penjadwalanKp.lokasi);

  RxBool isLoading = false.obs;

  Future<List<Mahasiswa>> getAllMahasiswa() async {
    List<Mahasiswa> allMahasiswa = [];
    try {
      var response = await dio.get('$baseUrlAPI/mahasiswa');
      if (response.statusCode == 200) {
        for (var item in response.data['data']) {
          allMahasiswa.add(Mahasiswa.fromJson(item));
        }

        mahasiswa = allMahasiswa
            .where((element) => element.nim == penjadwalanKp.mahasiswaNim)
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

  Future<List<Dosen>> getAllDosen() async {
    List<Dosen> allDosen = [];
    try {
      var response = await dio.get('$baseUrlAPI/dosen');
      if (response.statusCode == 200) {
        for (var item in response.data['data']) {
          allDosen.add(Dosen.fromJson(item));
        }

        //sort mahasiswa nama
        allDosen.sort((a, b) => a.nama!.compareTo(b.nama!));

        pembimbing = allDosen
            .where((element) => element.nip == penjadwalanKp.pembimbingNip)
            .first;

        penguji = allDosen
            .where((element) => element.nip == penjadwalanKp.pengujiNip)
            .first;

        return allDosen;
      }
    } catch (e) {
      print(e);
    }
    return allDosen;
  }

  Future<Map<String, dynamic>> editJadwalKPAPI() async {
    isLoading.value = true;
    prefs = await SharedPreferences.getInstance();

    try {
      var response = await dio.put(
        "$baseUrlAPI/penjadwalan-kp/${penjadwalanKp.id}",
        data: {
          "mahasiswa_nim": mahasiswa.nim,
          "pembimbing_nip": pembimbing.nip,
          "penguji_nip": penguji.nip,
          "prodi_id": prodiId,
          "jenis_seminar": "KP",
          "judul_kp": judulKP.text,
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
