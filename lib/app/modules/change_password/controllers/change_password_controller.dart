import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:siajte_app/app/modules/home/controllers/home_controller.dart';
import 'package:siajte_app/app/routes/app_pages.dart';

import '../../../theme/variable.dart';

class ChangePasswordController extends GetxController {
  final HomeController homeC = Get.find();

  TextEditingController passOldC = TextEditingController();
  TextEditingController passNewC = TextEditingController();
  TextEditingController passNewC2 = TextEditingController();

  RxBool obsecureText1 = true.obs;
  RxBool obsecureText2 = true.obs;
  RxBool obsecureText3 = true.obs;
  RxBool isLoading = false.obs;
  Dio dio = Dio();

  final formKey = GlobalKey<FormState>();

  void changeObsecureText1() {
    obsecureText1.value = !obsecureText1.value;
  }

  void changeObsecureText2() {
    obsecureText2.value = !obsecureText2.value;
  }

  void changeObsecureText3() {
    obsecureText3.value = !obsecureText3.value;
  }

  void toSuccess() {
    Get.offAllNamed(Routes.SUCCESS);
  }

  Future<Map<String, dynamic>> changePassword() async {
    isLoading.value = true;

    String role = homeC.mapUser['role'];

    if (role == 'mahasiswa') {
      var loginMahasiswa = await dio.post(
        "$baseUrlAPI/login",
        data: {
          "username": homeC.mapUser['data']['nim'],
          "password": passOldC.text,
        },
      );

      if (loginMahasiswa.statusCode != 200) {
        isLoading.value = false;
        Get.snackbar("Gagal", "Password lama salah");
        return {
          "status": false,
          "message": "Password mahasiswa Terjadi kesalahan"
        };
      }
    } else if (role == 'dosen') {
      var loginDosen = await dio.post(
        "$baseUrlAPI/login",
        data: {
          "username": homeC.mapUser['data']['nip'],
          "password": passOldC.text,
        },
      );
      if (loginDosen.statusCode != 200) {
        isLoading.value = false;
        Get.snackbar("Gagal", "Password lama salah");
        return {"status": false, "message": "Password dosen Terjadi kesalahan"};
      }
    } else if (role == 'web') {
      var loginWeb = await dio.post(
        "$baseUrlAPI/login",
        data: {
          "username": homeC.mapUser['data']['username'],
          "password": passOldC.text,
        },
      );
      if (loginWeb.statusCode != 200) {
        isLoading.value = false;
        Get.snackbar("Gagal", "Password lama salah");
        return {"status": false, "message": "Password web Terjadi kesalahan"};
      }
    }

    if (passNewC.text != passNewC2.text) {
      isLoading.value = false;
      Get.snackbar("Gagal", "Password baru tidak sama");
      return {
        "status": false,
        "message": "Pasword harus sama Terjadi kesalahan"
      };
    }

    var response = await dio.post(
      "$baseUrlAPI/profile$role/editpass",
      data: {
        "passNew": passNewC.text,
      },
    );

    if (response.statusCode == 200) {
      var data = response.data;

      if (data != null) {
        String user = jsonEncode({'data': data['data'], 'role': data['role']});

        Get.snackbar("Ubah Password Berhasil",
            "${data['status']} ${data['data']['nama']}");
        isLoading.value = false;
        Get.offAllNamed(Routes.SUCCESS);

        return data;
      } else {
        isLoading.value = false;
        Get.snackbar("Ubah Password Gagal", "Data kosong");
        return {"status": false, "message": "Data Kosong Terjadi kesalahan"};
      }
    } else if (response.statusCode == 401) {
      isLoading.value = false;
      Get.snackbar("Ubah Password Gagal", "Status 401");
      return {"status": false, "message": "401 Terjadi kesalahan"};
    } else {
      isLoading.value = false;
      Get.snackbar("Ubah Password Gagal", "Status 500");
      return {"status": false, "message": "500 Terjadi kesalahan"};
    }
  }
}
