import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:siajte_app/app/data/models/mahasiswa_model.dart';
import 'package:siajte_app/app/routes/app_pages.dart';
import 'package:siajte_app/app/theme/variable.dart';

class DetailMahasiswaController extends GetxController {
  RxBool isLoading = false.obs;

  Dio dio = Dio();

  Future<List<Mahasiswa>> getAllMahasiswa() async {
    List<Mahasiswa> allMahasiswa = [];

    var response = await dio.get("$baseUrlAPI/mahasiswa");
    for (var item in response.data['data']) {
      allMahasiswa.add(Mahasiswa.fromJson(item));
    }

    return allMahasiswa;
  }

  Future<String> getProdiWithId(int prodiId) async {
    var response = await dio.get("$baseUrlAPI/prodi/$prodiId");

    String prodi = response.data['data']['nama_prodi'].toString();

    return prodi;
  }

  Future<String> getKonsentrasiWithId(int id) async {
    var response = await dio.get("$baseUrlAPI/konsentrasi/$id");

    String konsentrasi = response.data['data']['nama_konsentrasi'].toString();

    return konsentrasi;
  }

  Future<void> deleteMahasiswaAPI(int id) async {
    isLoading.value = true;

    var response = await dio.delete(
      "$baseUrlAPI/mahasiswa/$id",
      options: Options(
        receiveDataWhenStatusError: true,
        sendTimeout: const Duration(seconds: 5), // 60 seconds
        receiveTimeout: const Duration(seconds: 2),
      ),
    );

    var data = response.data;

    if (data != null) {
      Get.snackbar("Delete Mahasiswa Berhasil", "${data['message']}");
      isLoading.value = false;
      Get.offAllNamed(Routes.MAHASISWA);
    } else if (response.statusCode == 401) {
      isLoading.value = false;
      Get.snackbar("Delete Mahasiswa Gagal", "Status 401");
    } else {
      isLoading.value = false;
      Get.snackbar("Delete Mahasiswa Gagal", "Terjadi kesalahan");
    }
  }

  dialogDelete(int id) {
    Get.defaultDialog(
      title: "Delete Mahasiswa",
      middleText: "Apakah anda yakin ingin menghapus mahasiswa ini?",
      textConfirm: "Ya",
      textCancel: "Tidak",
      confirmTextColor: Colors.white,
      onConfirm: () {
        deleteMahasiswaAPI(id);
      },
      onCancel: () {
        Get.back();
      },
    );
  }
}
