import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:siajte_app/app/theme/colors.dart';
import 'package:siajte_app/app/theme/style.dart';

import '../controllers/change_password_controller.dart';

class ChangePasswordView extends GetView<ChangePasswordController> {
  const ChangePasswordView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Ubah Password',
          style: poppins.copyWith(
              fontSize: 20.sp,
              color: Colors.black,
              fontWeight: FontWeight.w600),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.black,
          ),
          onPressed: () => Get.back(),
        ),
      ),
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 40.h,
                ),
                Form(
                  key: controller.formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Password Lama",
                        style: poppins.copyWith(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w600,
                          color: textChangePassword,
                        ),
                      ),
                      SizedBox(height: 8.h),
                      Obx(
                        () => TextFormField(
                          obscureText: controller.obsecureText1.value,
                          controller: controller.passOldC,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Pasword Lama tidak boleh kosong';
                            }
                            return null;
                          },
                          style: poppins.copyWith(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            color: fieldChangePassword,
                          ),
                          decoration: InputDecoration(
                            hintText: 'Password Lama',
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 12.w, vertical: 10.h),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            suffixIcon: IconButton(
                              icon: Icon(
                                controller.obsecureText1.value
                                    ? Icons.visibility_off_rounded
                                    : Icons.visibility_rounded,
                              ),
                              onPressed: () {
                                controller.changeObsecureText1();
                              },
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 36.h),
                      Text(
                        "Password Baru",
                        style: poppins.copyWith(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w600,
                          color: textChangePassword,
                        ),
                      ),
                      SizedBox(height: 8.h),
                      Obx(
                        () => TextFormField(
                          obscureText: controller.obsecureText2.value,
                          controller: controller.passNewC,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Password Baru tidak boleh kosong';
                            }
                            return null;
                          },
                          style: poppins.copyWith(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            color: fieldChangePassword,
                          ),
                          decoration: InputDecoration(
                            hintText: 'Password Baru',
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 12.w, vertical: 10.h),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            suffixIcon: IconButton(
                              icon: Icon(
                                controller.obsecureText2.value
                                    ? Icons.visibility_off_rounded
                                    : Icons.visibility_rounded,
                              ),
                              onPressed: () {
                                controller.changeObsecureText2();
                              },
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 36.h),
                      Text(
                        "Konfirmasi Password",
                        style: poppins.copyWith(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w600,
                          color: textChangePassword,
                        ),
                      ),
                      SizedBox(height: 8.h),
                      Obx(
                        () => TextFormField(
                          obscureText: controller.obsecureText3.value,
                          controller: controller.passNewC2,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Konfirmasi Password tidak boleh kosong';
                            }
                            return null;
                          },
                          style: poppins.copyWith(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            color: fieldChangePassword,
                          ),
                          decoration: InputDecoration(
                            hintText: 'Konfirmasi Password',
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 12.w, vertical: 10.h),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            suffixIcon: IconButton(
                              icon: Icon(
                                controller.obsecureText3.value
                                    ? Icons.visibility_off_rounded
                                    : Icons.visibility_rounded,
                              ),
                              onPressed: () {
                                controller.changeObsecureText3();
                              },
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 36.h),
                      Obx(
                        () => SizedBox(
                          width: double.infinity,
                          height: 44.h,
                          child: ElevatedButton(
                            onPressed: controller.isLoading.isFalse
                                ? () async {
                                    if (controller.formKey.currentState!
                                        .validate()) {
                                      // Do something when the form is submitted
                                      controller.toSuccess();
                                    }
                                  }
                                : null,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: primaryColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                            child: controller.isLoading.isFalse
                                ? Text(
                                    'Ubah Password',
                                    style: poppins.copyWith(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white,
                                    ),
                                  )
                                : CircularProgressIndicator(
                                    strokeWidth: 4.w,
                                    color: Colors.white,
                                  ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
