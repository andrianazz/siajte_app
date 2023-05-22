import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:siajte_app/app/data/models/mahasiswa_model.dart';
import 'package:siajte_app/app/routes/app_pages.dart';

import '../../../theme/variable.dart';

class EditMahasiswaController extends GetxController {
  Dio dio = Dio();
  RxBool isLoading = false.obs;

  late int idMahasiswa;
  TextEditingController namaC = TextEditingController();
  TextEditingController emailC = TextEditingController();
  TextEditingController nimC = TextEditingController();
  TextEditingController angkatanC = TextEditingController();

  late int prodiId;
  late int konsentrasiId;

  void setMahasiswatoTextField(Mahasiswa mahasiswa) {
    idMahasiswa = mahasiswa.id!;
    namaC.text = mahasiswa.nama.toString();
    emailC.text = mahasiswa.email.toString();
    nimC.text = mahasiswa.nim.toString();
    angkatanC.text = mahasiswa.angkatan.toString();

    prodiId = mahasiswa.prodiId!;
    konsentrasiId = mahasiswa.konsentrasiId!;
  }

  Future<Map<String, dynamic>> updateMahaswiswaAPI() async {
    isLoading.value = true;
    print(idMahasiswa);

    try {
      var response = await dio.put(
        "$baseUrlAPI/mahasiswa/$idMahasiswa",
        data: {
          "nim": nimC.text,
          "nama": namaC.text,
          "email": emailC.text,
          "angkatan": angkatanC.text,
          "prodi_id": prodiId,
          "konsentrasi_id": konsentrasiId,
        },
        options: Options(
          receiveDataWhenStatusError: true,
          sendTimeout: const Duration(seconds: 5), // 60 seconds
          receiveTimeout: const Duration(seconds: 2),
        ),
      );

      var data = response.data;

      if (data != null) {
        Get.snackbar("Update Mahasiswa Berhasil", "${data['message']}");
        isLoading.value = false;
        Get.offAllNamed(Routes.MAHASISWA);

        return data;
      } else if (response.statusCode == 401) {
        isLoading.value = false;
        Get.snackbar("Update Mahasiswa Gagal", "Status 401");
        return {"status": false, "message": "Terjadi kesalahan"};
      } else {
        isLoading.value = false;
        Get.snackbar("Update Mahasiswa Gagal", "Status 500");
        return {"status": false, "message": "Terjadi kesalahan"};
      }
    } on DioError catch (e) {
      if (e.type == DioErrorType.connectionTimeout) {
        isLoading.value = false;
        Get.snackbar("Update Mahasiswa Gagal", "Terjadi kesalahan koneksi");
        return {"status": false, "message": "Terjadi kesalahan"};
      }
      if (e.type == DioErrorType.receiveTimeout) {
        isLoading.value = false;
        Get.snackbar("Update Mahasiswa Gagal", "Terjadi kesalahan koneksi");
        return {"status": false, "message": "Terjadi kesalahan"};
      }
      if (e.type == DioErrorType.sendTimeout) {
        isLoading.value = false;
        Get.snackbar("Update Mahasiswa Gagal", "Terjadi kesalahan koneksi");
        return {"status": false, "message": "Terjadi kesalahan"};
      }
    }

    return {"status": false, "message": "Terjadi kesalahan"};
  }
}
