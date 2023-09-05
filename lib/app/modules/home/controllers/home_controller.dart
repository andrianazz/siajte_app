import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:siajte_app/app/modules/home/views/home_view.dart';
import 'package:siajte_app/app/modules/jadwal_seminar/controllers/jadwal_seminar_controller.dart';
import 'package:siajte_app/app/modules/mahasiswa/controllers/mahasiswa_controller.dart';
import 'package:siajte_app/app/modules/riwayat_seminar/controllers/riwayat_seminar_controller.dart';
import 'package:siajte_app/app/routes/app_pages.dart';
import 'package:siajte_app/app/theme/style.dart';
import 'package:siajte_app/app/theme/variable.dart';
import 'package:siajte_app/app/widgets/card_jadwal_widget.dart';

class HomeController extends GetxController {
  // GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  late SharedPreferences prefs;
  Map<String, dynamic> mapUser = {};

  RxInt selectedMenu = 0.obs;

  PageController pageC = PageController(initialPage: 0);

  late Future<Map<String, dynamic>> getuser;

  @override
  void onInit() async {
    super.onInit();
    getuser = getUser();
    mapUser = await getUser();

    if (await checkSharedPreference() == "") {
      Get.offAllNamed(Routes.LOGIN);
      await deletePreference();
    } else {
      debugPrint(prefs.getString('user')!);
      Get.forceAppUpdate();
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

  // void openDrawer() {
  //   scaffoldKey.currentState?.openDrawer();
  // }

  handleClick(int item) async {
    switch (item) {
      case 1:
        Get.toNamed(Routes.CHANGE_PASSWORD);
        break;
      case 2:
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

  void changeIndex(int index) {
    selectedMenu.value = index;
    update();
  }

  Widget changeView() {
    JadwalSeminarController jadwalSeminarC = Get.put(JadwalSeminarController());
    RiwayatSeminarController riwayatSeminarC =
        Get.put(RiwayatSeminarController());
    MahasiswaController mahasiswaC = Get.put(MahasiswaController());

    switch (selectedMenu.value) {
      case 0:
        return Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: 24.w,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 24.h),
                  Form(
                    // key: controller.formKey,
                    child: TextFormField(
                      // controller: controller.userC,
                      onFieldSubmitted: (value) {
                        jadwalSeminarC.filterJadwalSeminarWithName(value);
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Search tidak boleh kosong';
                        }
                        return null;
                      },
                      style: poppins.copyWith(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                      ),

                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 16.w, vertical: 10.h),
                        hintText: 'Search',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        suffixIcon: const Icon(Icons.search_rounded),
                      ),
                    ),
                  ),
                  SizedBox(height: 24.h),

                  // Tampilan Choice
                  // Container(
                  //   child: Obx(
                  //     () => ChipsChoice<String>.multiple(
                  //       value: jadwalSeminarC.selectedChoice.toList(),
                  //       onChanged: (val) {
                  //         jadwalSeminarC.selectedChoice.value = val;
                  //         jadwalSeminarC.filterJadwalSeminarWithChoice(val);
                  //       },
                  //       choiceItems: C2Choice.listFrom<String, String>(
                  //         source: jadwalSeminarC.listJenisSeminar,
                  //         value: (i, v) => v,
                  //         label: (i, v) => v,
                  //       ),
                  //       choiceStyle: C2ChipStyle.filled(
                  //         selectedStyle: C2ChipStyle(
                  //           foregroundColor: Colors.white,
                  //           backgroundColor: primaryColor,
                  //         ),
                  //         color: Colors.grey[200],
                  //         padding: EdgeInsets.symmetric(
                  //           horizontal: 12.w,
                  //         ),
                  //         height: 44.h,
                  //         foregroundStyle: poppins.copyWith(
                  //           fontSize: 16.sp,
                  //           fontWeight: FontWeight.w500,
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  // SizedBox(height: 24.h),
                  // Tampilan Web
                  SizedBox(
                    width: double.infinity,
                    height: 500.h,
                    child: Obx(
                      () => jadwalSeminarC.isLoading.isFalse
                          ? ListView.builder(
                              itemCount:
                                  jadwalSeminarC.filterJadwal.value.length,
                              itemBuilder: (context, index) {
                                return CardJadwalWidget(
                                  onTap: () {
                                    Get.toNamed(
                                      Routes.DETAIL_JADWAL_SEMINAR,
                                      arguments: jadwalSeminarC
                                          .filterJadwal.value[index],
                                    );
                                  },
                                  penjadwalan:
                                      jadwalSeminarC.filterJadwal.value[index],
                                );
                              },
                            )
                          : SizedBox(
                              width: 20.w,
                              height: 20.h,
                              child: Center(
                                child: ElevatedButton(
                                  onPressed: () {
                                    Get.forceAppUpdate();
                                    Get.offAll(() => const HomeView());
                                  },
                                  style: ElevatedButton.styleFrom(
                                    fixedSize: Size(200.w, 100.h),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const CircularProgressIndicator(
                                        color: Colors.white,
                                      ),
                                      SizedBox(height: 10.h),
                                      const Text("Click for refresh"),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );

      case 1:
        return Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: 24.w,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 24.h),
                  Form(
                    // key: controller.formKey,
                    child: TextFormField(
                      // controller: controller.userC,
                      onFieldSubmitted: (value) {
                        riwayatSeminarC.filterJadwalSeminarWithName(value);
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Search tidak boleh kosong';
                        }
                        return null;
                      },
                      style: poppins.copyWith(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                      ),

                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 16.w, vertical: 10.h),
                        hintText: 'Search',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        suffixIcon: const Icon(Icons.search_rounded),
                      ),
                    ),
                  ),
                  SizedBox(height: 24.h),

                  // Tampilan Choice
                  // Container(
                  //   child: Obx(
                  //     () => ChipsChoice<String>.multiple(
                  //       value: riwayatSeminarC.selectedChoice.toList(),
                  //       onChanged: (val) {
                  //         riwayatSeminarC.selectedChoice.value = val;
                  //         riwayatSeminarC.filterJadwalSeminarWithChoice(val);
                  //       },
                  //       choiceItems: C2Choice.listFrom<String, String>(
                  //         source: riwayatSeminarC.listJenisSeminar,
                  //         value: (i, v) => v,
                  //         label: (i, v) => v,
                  //       ),
                  //       choiceStyle: C2ChipStyle.filled(
                  //         selectedStyle: C2ChipStyle(
                  //           foregroundColor: Colors.white,
                  //           backgroundColor: primaryColor,
                  //         ),
                  //         color: Colors.grey[200],
                  //         padding: EdgeInsets.symmetric(
                  //           horizontal: 12.w,
                  //         ),
                  //         height: 44.h,
                  //         foregroundStyle: poppins.copyWith(
                  //           fontSize: 16.sp,
                  //           fontWeight: FontWeight.w500,
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  // SizedBox(height: 24.h),
                  // Tampilan Web
                  SizedBox(
                    width: double.infinity,
                    height: 500.h,
                    child: Obx(
                      () => riwayatSeminarC.isLoading.isFalse
                          ? ListView.builder(
                              itemCount:
                                  riwayatSeminarC.filterJadwal.value.length,
                              itemBuilder: (context, index) {
                                return CardJadwalWidget(
                                  onTap: () {
                                    Get.toNamed(
                                      Routes.DETAIL_RIWAYAT_SEMINAR,
                                      arguments: riwayatSeminarC
                                          .filterJadwal.value[index],
                                    );
                                  },
                                  penjadwalan:
                                      riwayatSeminarC.filterJadwal.value[index],
                                );
                              },
                            )
                          : SizedBox(
                              width: 20.w,
                              height: 20.h,
                              child: const Center(
                                  child: CircularProgressIndicator()),
                            ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );

      case 2:
        return Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: 24.w,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 24.h),
                  Form(
                    // key: controller.formKey,
                    child: TextFormField(
                      // controller: controller.userC,
                      onFieldSubmitted: (value) {
                        riwayatSeminarC.filterJadwalSeminarWithName(value);
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Search tidak boleh kosong';
                        }
                        return null;
                      },
                      style: poppins.copyWith(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                      ),

                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 16.w, vertical: 10.h),
                        hintText: 'Search',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        suffixIcon: const Icon(Icons.search_rounded),
                      ),
                    ),
                  ),
                  SizedBox(height: 24.h),
                  SizedBox(
                    width: double.infinity,
                    height: 500.h,
                    child: Obx(
                      () => riwayatSeminarC.isLoading.isFalse
                          ? ListView.builder(
                              itemCount:
                                  riwayatSeminarC.filterSkripsi2.value.length,
                              itemBuilder: (context, index) {
                                return CardJadwalWidget(
                                  onTap: () {
                                    Get.toNamed(
                                      Routes.DETAIL_RIWAYAT_SEMINAR,
                                      arguments: riwayatSeminarC
                                          .filterSkripsi2.value[index],
                                    );
                                  },
                                  penjadwalan: riwayatSeminarC
                                      .filterSkripsi2.value[index],
                                );
                              },
                            )
                          : SizedBox(
                              width: 20.w,
                              height: 20.h,
                              child: const Center(
                                  child: CircularProgressIndicator()),
                            ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );

      case 3:
        return Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: 24.w,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 24.h),
                  Form(
                    // key: controller.formKey,
                    child: TextFormField(
                      // controller: controller.userC,
                      onFieldSubmitted: (value) {
                        riwayatSeminarC.filterJadwalSeminarWithName(value);
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Search tidak boleh kosong';
                        }
                        return null;
                      },
                      style: poppins.copyWith(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                      ),

                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 16.w, vertical: 10.h),
                        hintText: 'Search',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        suffixIcon: const Icon(Icons.search_rounded),
                      ),
                    ),
                  ),
                  SizedBox(height: 24.h),
                  SizedBox(
                    width: double.infinity,
                    height: 500.h,
                    child: Obx(
                      () => riwayatSeminarC.isLoading.isFalse
                          ? ListView.builder(
                              itemCount:
                                  riwayatSeminarC.filterSkripsi3.value.length,
                              itemBuilder: (context, index) {
                                return CardJadwalWidget(
                                  onTap: () {
                                    Get.toNamed(
                                      Routes.DETAIL_RIWAYAT_SEMINAR,
                                      arguments: riwayatSeminarC
                                          .filterSkripsi3.value[index],
                                    );
                                  },
                                  penjadwalan: riwayatSeminarC
                                      .filterSkripsi3.value[index],
                                );
                              },
                            )
                          : SizedBox(
                              width: 20.w,
                              height: 20.h,
                              child: const Center(
                                  child: CircularProgressIndicator()),
                            ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );

      default:
        return const SizedBox();
    }
  }
}
