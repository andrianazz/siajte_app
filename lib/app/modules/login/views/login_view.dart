import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../../../theme/colors.dart';
import '../../../theme/style.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 40.h),
                Image.asset("assets/images/logo.png", height: 100.h),
                SizedBox(height: 24.h),
                Text(
                  "Selamat Datang",
                  style: poppins.copyWith(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 40.h),
                SizedBox(
                  width: 300.w,
                  child: Form(
                    key: controller.formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextFormField(
                          controller: controller.userC,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Field NIP / NIM tidak boleh kosong';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            labelText: 'NIP / NIM',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                        SizedBox(height: 30.h),
                        Obx(
                          () => TextFormField(
                            controller: controller.passC,
                            obscureText: controller.obsecureText.value,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Field PASSWORD tidak boleh kosong';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              labelText: 'Password',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  controller.obsecureText.value
                                      ? Icons.lock_outline_rounded
                                      : Icons.lock_open_rounded,
                                ),
                                onPressed: () {
                                  controller.changeObsecureText();
                                },
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 40.h),
                        Obx(
                          () => SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: primaryColor,
                                disabledBackgroundColor: primaryColor,
                                padding: EdgeInsets.symmetric(vertical: 12.h),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              onPressed: controller.isLoading.isFalse
                                  ? () async {
                                      if (controller.formKey.currentState!
                                          .validate()) {
                                        // Do something when the form is submitted
                                        await controller.loginAPI();
                                      }
                                    }
                                  : null,
                              child: controller.isLoading.isFalse
                                  ? Text(
                                      'Login',
                                      style: roboto.copyWith(
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w600),
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
                ),
                SizedBox(height: 209.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Belum punya akun? ",
                      style: poppins.copyWith(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      "Hubungi Staff Jurusan",
                      style: poppins.copyWith(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w600,
                        color: primaryColor,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
