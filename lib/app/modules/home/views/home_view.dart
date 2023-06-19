import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:siajte_app/app/routes/app_pages.dart';
import 'package:siajte_app/app/theme/colors.dart';
import 'package:siajte_app/app/theme/style.dart';
import 'package:siajte_app/app/widgets/appbar_widget.dart';
import 'package:siajte_app/app/widgets/card_menu_widget.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: controller.scaffoldKey,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(56.h),
        child: const AppbarWidget(),
      ),
      body: controller.mapUser['role'] == 'web' ? ViewLama() : ViewBaru(),
    );
  }

  Widget ViewBaru() {
    return ListView(
      children: [
        Container(
          width: double.infinity,
          height: 60.h,
          color: primaryColor.withGreen(100),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                Obx(
                  () => Container(
                    height: double.infinity,
                    padding: EdgeInsets.symmetric(horizontal: 8.w),
                    color: controller.selectedMenu.value == 0
                        ? primaryColor
                        : primaryColor.withGreen(100),
                    child: Column(
                      children: [
                        TextButton(
                          onPressed: () {
                            controller.changeIndex(0);
                          },
                          child: Text(
                            "Jadwal  Seminar",
                            style: poppins.copyWith(
                                fontSize: 14.sp, color: Colors.white),
                          ),
                        ),
                        Container(
                          width: 100.w,
                          height: 2.h,
                          color: controller.selectedMenu.value == 0
                              ? Colors.white
                              : primaryColor.withGreen(100),
                        )
                      ],
                    ),
                  ),
                ),
                Obx(
                  () => Container(
                    height: double.infinity,
                    padding: EdgeInsets.symmetric(horizontal: 8.w),
                    color: controller.selectedMenu.value == 1
                        ? primaryColor
                        : primaryColor.withGreen(100),
                    child: Column(
                      children: [
                        TextButton(
                          onPressed: () {
                            controller.changeIndex(1);
                          },
                          child: Text(
                            "Riwayat Seminar",
                            style: poppins.copyWith(
                                fontSize: 14.sp, color: Colors.white),
                          ),
                        ),
                        Container(
                          width: 100.w,
                          height: 2.h,
                          color: controller.selectedMenu.value == 1
                              ? Colors.white
                              : primaryColor.withGreen(100),
                        )
                      ],
                    ),
                  ),
                ),
                FutureBuilder<Object>(
                  future: controller.getUser(),
                  builder: (context, snapshot) {
                    return controller.mapUser['role'] == "web"
                        ? Obx(
                            () => Container(
                              height: double.infinity,
                              padding: EdgeInsets.symmetric(horizontal: 8.w),
                              color: controller.selectedMenu.value == 2
                                  ? primaryColor
                                  : primaryColor.withGreen(100),
                              child: Column(
                                children: [
                                  TextButton(
                                    onPressed: () {
                                      controller.changeIndex(2);
                                    },
                                    child: Text(
                                      "Daftar Mahasiswa",
                                      style: poppins.copyWith(
                                          fontSize: 14.sp, color: Colors.white),
                                    ),
                                  ),
                                  Container(
                                    width: 100.w,
                                    height: 2.h,
                                    color: controller.selectedMenu.value == 2
                                        ? Colors.white
                                        : primaryColor.withGreen(100),
                                  )
                                ],
                              ),
                            ),
                          )
                        : const SizedBox();
                  },
                )
              ],
            ),
          ),
        ),
        SizedBox(height: 1000.h, child: Obx(() => controller.changeView()))
      ],
    );
  }

  Widget ViewLama() {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 24.w,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 30.h),
          Text(
            "Pilih Menu",
            style: roboto.copyWith(
              fontSize: 18.sp,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: 25.h),
          CardMenuWidget(
            judul: "Jadwal Seminar",
            imageUrl: "assets/images/jadwalseminar_bg.png",
            onTap: () {
              Get.toNamed(Routes.JADWAL_SEMINAR);
            },
          ),
          SizedBox(height: 24.h),
          CardMenuWidget(
            judul: "Riwayat Seminar",
            imageUrl: "assets/images/riwayatseminar_bg.png",
            onTap: () {
              Get.toNamed(Routes.RIWAYAT_SEMINAR);
            },
          ),
          FutureBuilder<Object>(
            future: controller.getUser(),
            builder: (context, snapshot) {
              return controller.mapUser['role'] == "web"
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 24.h),
                        CardMenuWidget(
                          judul: "Daftar Mahasiswa",
                          imageUrl: "assets/images/mahasiswa_bg.png",
                          onTap: () {
                            Get.toNamed(Routes.MAHASISWA);
                          },
                        ),
                      ],
                    )
                  : const SizedBox();
            },
          )
        ],
      ),
    );
  }
}
