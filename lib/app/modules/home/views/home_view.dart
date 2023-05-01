import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:siajte_app/app/routes/app_pages.dart';
import 'package:siajte_app/app/widgets/appbar_widget.dart';
import 'package:siajte_app/app/widgets/card_menu_widget.dart';

import '../../../theme/style.dart';
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
      body: ListView(
        children: [
          Container(
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
                SizedBox(height: 24.h),
                CardMenuWidget(
                  judul: "Daftar Mahasiswa",
                  imageUrl: "assets/images/mahasiswa_bg.png",
                  onTap: () {
                    Get.toNamed(Routes.MAHASISWA);
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
