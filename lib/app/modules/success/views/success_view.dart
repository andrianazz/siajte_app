import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:siajte_app/app/theme/colors.dart';
import 'package:siajte_app/app/theme/style.dart';

import '../controllers/success_controller.dart';

class SuccessView extends GetView<SuccessController> {
  const SuccessView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            SizedBox(
              height: 83.h,
            ),
            Image.asset(
              'assets/images/success_notification.png',
              width: 208.w,
              height: 240.h,
            ),
            SizedBox(
              height: 65.h,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Success!",
                  style: poppins.copyWith(
                    fontSize: 32.sp,
                    fontWeight: FontWeight.w700,
                    color: textSuccess,
                  ),
                ),
                SizedBox(height: 25.h),
                Text(
                  "Password kamu berhasil Diganti",
                  style: roboto.copyWith(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: 65.h),
                Container(
                  width: double.infinity,
                  height: 44.h,
                  margin: EdgeInsets.symmetric(horizontal: 40.w),
                  child: ElevatedButton(
                    onPressed: () async {
                      await controller.logout();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    child: Text(
                      'Kembali ke Login',
                      style: poppins.copyWith(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
