import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:siajte_app/app/routes/app_pages.dart';
import 'package:siajte_app/app/theme/variable.dart';

class HomeController extends GetxController {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  late SharedPreferences prefs;
  Map<String, dynamic> mapUser = {};

  @override
  void onInit() async {
    super.onInit();

    mapUser = await getUser();

    if (await checkSharedPreference() == "") {
      Get.offAllNamed(Routes.LOGIN);
      await deletePreference();
    } else {
      debugPrint(prefs.getString('user')!);
    }
  }

  Future<Map<String, dynamic>> getUser() async {
    prefs = await SharedPreferences.getInstance();
    String? user = prefs.getString('user');

    if (user != null) {
      mapUser = jsonDecode(user);
      update();
      return mapUser;
    } else {
      return {};
    }
  }

  void openDrawer() {
    scaffoldKey.currentState?.openDrawer();
  }

  handleClick(int item) async {
    switch (item) {
      case 0:
        Get.toNamed(Routes.CHANGE_PASSWORD);
        break;
      case 1:
        await logout();
        break;
    }
  }

  Future<void> logout() async {
    Dio dio = Dio();
    var response = await dio.post(
      "$baseUrlAPI/logout",
    );

    if (response.statusCode == 200) {
      var data = response.data;
      if (data != null) {
        deletePreference();
        Get.snackbar("Logout Berhasil", "${data['status']}");
        Get.offAllNamed(Routes.LOGIN);
      } else {
        Get.snackbar("Logout Gagal", "Terjadi kesalahan");
      }
    } else if (response.statusCode == 401) {
      Get.snackbar("Logout Gagal", "Status 401");
    } else {
      Get.snackbar("Logout Gagal", "Status 500");
    }
  }

  Future<String> checkSharedPreference() async {
    prefs = await SharedPreferences.getInstance();
    String? user = prefs.getString('user');

    if (user != null) {
      mapUser = jsonDecode(user);
      return user;
    } else {
      return "";
    }
  }

  Future<void> deletePreference() async {
    prefs = await SharedPreferences.getInstance();
    prefs.remove('user');
  }
}
