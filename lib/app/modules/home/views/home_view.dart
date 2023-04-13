import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:siajte_app/app/widgets/card_menu_widget.dart';

import '../../../theme/style.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: controller.scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          children: [
            Image.asset(
              'assets/images/logo.png',
              width: 24.w,
              height: 24.h,
            ),
            SizedBox(width: 16.w),
            FutureBuilder(
              future: controller.getUser(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Text(
                    'SITEI - ${(controller.mapUser['role']).toString().capitalize}',
                    style: poppins.copyWith(
                        color: Colors.black,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w600),
                  );
                } else if (snapshot.hasError) {
                  return Text(
                    'Error',
                    style: poppins.copyWith(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  );
                }
                return Text(
                  'Loading...',
                  style: poppins.copyWith(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                );
              },
            ),
          ],
        ),
        actions: <Widget>[
          PopupMenuButton<int>(
            icon: const Icon(Icons.more_vert, color: Colors.black),
            onSelected: (item) => controller.handleClick(item),
            itemBuilder: (context) => [
              PopupMenuItem<int>(
                value: 0,
                child: Row(
                  children: [
                    Text(
                      'Ubah Password',
                      style: poppins.copyWith(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              PopupMenuItem<int>(
                value: 1,
                child: Row(
                  children: [
                    Text(
                      'Logout',
                      style: poppins.copyWith(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
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
                  onTap: () {},
                ),
                SizedBox(
                  height: 24.h,
                ),
                CardMenuWidget(
                  judul: "Riwayat Seminar",
                  imageUrl: "assets/images/riwayatseminar_bg.png",
                  onTap: () {},
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
