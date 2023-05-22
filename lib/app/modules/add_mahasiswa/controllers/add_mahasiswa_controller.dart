import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:siajte_app/app/routes/app_pages.dart';
import 'package:siajte_app/app/theme/variable.dart';

class AddMahasiswaController extends GetxController {
  Dio dio = Dio();

  final formKey = GlobalKey<FormState>();
  TextEditingController nimC = TextEditingController();
  TextEditingController namaC = TextEditingController();
  TextEditingController emailC = TextEditingController();
  TextEditingController angkatanC = TextEditingController();
  TextEditingController passC = TextEditingController();
  late int prodiId;
  late int konsentrasiId;

  RxBool isLoading = false.obs;

  Future<Map<String, dynamic>> addMahaswiswaAPI() async {
    isLoading.value = true;

    try {
      var response = await dio.post(
        "$baseUrlAPI/mahasiswa",
        data: {
          "nim": nimC.text,
          "nama": namaC.text,
          "email": emailC.text,
          "angkatan": angkatanC.text,
          "password": passC.text,
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
        Get.snackbar("Add Mahasiswa Berhasil", "${data['message']}");
        isLoading.value = false;
        Get.offAllNamed(Routes.MAHASISWA);

        return data;
      } else if (response.statusCode == 401) {
        isLoading.value = false;
        Get.snackbar("Add Mahasiswa Gagal", "Status 401");
        return {"status": false, "message": "Terjadi kesalahan"};
      } else {
        isLoading.value = false;
        Get.snackbar("Add Mahasiswa Gagal", "Status 500");
        return {"status": false, "message": "Terjadi kesalahan"};
      }
    } on DioError catch (e) {
      if (e.type == DioErrorType.connectionTimeout) {
        isLoading.value = false;
        Get.snackbar("Add Mahasiswa Gagal", "Terjadi kesalahan koneksi");
        return {"status": false, "message": "Terjadi kesalahan"};
      }
      if (e.type == DioErrorType.receiveTimeout) {
        isLoading.value = false;
        Get.snackbar("Add Mahasiswa Gagal", "Terjadi kesalahan koneksi");
        return {"status": false, "message": "Terjadi kesalahan"};
      }
      if (e.type == DioErrorType.sendTimeout) {
        isLoading.value = false;
        Get.snackbar("Add Mahasiswa Gagal", "Terjadi kesalahan koneksi");
        return {"status": false, "message": "Terjadi kesalahan"};
      }
    }

    return {"status": false, "message": "Terjadi kesalahan"};
  }
}
