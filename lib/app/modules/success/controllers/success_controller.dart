import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../routes/app_pages.dart';
import '../../../theme/variable.dart';

class SuccessController extends GetxController {
  late SharedPreferences prefs;

  Future<void> logout() async {
    Dio dio = Dio();
    var response = await dio.post(
      "$baseUrlEmulator/logout",
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

  Future<void> deletePreference() async {
    prefs = await SharedPreferences.getInstance();
    prefs.remove('user');
  }
}
