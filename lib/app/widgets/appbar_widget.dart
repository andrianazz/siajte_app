import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:siajte_app/app/routes/app_pages.dart';
import 'package:siajte_app/app/theme/colors.dart';

import '../modules/home/controllers/home_controller.dart';
import '../theme/style.dart';

class AppbarWidget extends StatelessWidget {
  const AppbarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // HomeController controller = Get.find<HomeController>();
    HomeController controller = Get.put(HomeController());

    return AppBar(
      backgroundColor: Colors.white,
      automaticallyImplyLeading: false,
      leading: Get.routing.current == Routes.HOME
          ? const SizedBox()
          : IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(
                Icons.arrow_back,
                color: primaryColor,
              ),
            ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () => Get.offAllNamed(Routes.HOME),
            // child: Image.asset(
            //   'assets/images/logo.png',
            //   width: 24.w,
            //   height: 24.h,
            // ),
            // View Lama
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
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
                        'SITEI',
                        // 'SITEI - ${(controller.mapUser['role']).toString().capitalize}',
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
          ),
          // FutureBuilder(
          //   future: controller.getUser(),
          //   builder: (context, snapshot) {
          //     if (snapshot.hasData) {
          //       return SizedBox(
          //         width: 100.w,
          //         child: Text(
          //           '${(controller.mapUser['data']['nama']).toString().capitalize}',
          //           style: poppins.copyWith(
          //               color: Colors.black,
          //               fontSize: 12.sp,
          //               fontWeight: FontWeight.w600),
          //           textAlign: TextAlign.end,
          //           overflow: TextOverflow.ellipsis,
          //         ),
          //       );
          //     } else if (snapshot.hasError) {
          //       return Text(
          //         'Error',
          //         style: poppins.copyWith(
          //           fontSize: 12.sp,
          //           fontWeight: FontWeight.w600,
          //           color: Colors.black,
          //         ),
          //       );
          //     }
          //     return Text(
          //       'Loading...',
          //       style: poppins.copyWith(
          //         fontSize: 12.sp,
          //         fontWeight: FontWeight.w600,
          //         color: Colors.black,
          //       ),
          //     );
          //   },
          // )
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
                  FutureBuilder(
                    future: controller.getUser(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return SizedBox(
                          width: 150.w,
                          child: Text(
                            '${(controller.mapUser['data']['nama']).toString().capitalize}',
                            style: poppins.copyWith(
                                color: Colors.black,
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w600),
                            textAlign: TextAlign.start,
                            overflow: TextOverflow.ellipsis,
                          ),
                        );
                      } else if (snapshot.hasError) {
                        return Text(
                          'Error',
                          style: poppins.copyWith(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        );
                      }
                      return Text(
                        'Loading...',
                        style: poppins.copyWith(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      );
                    },
                  )
                ],
              ),
            ),
            PopupMenuItem<int>(
              value: 1,
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
              value: 2,
              child: Row(
                children: [
                  Text(
                    'Logout',
                    style: poppins.copyWith(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w600,
                      color: textDanger,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
