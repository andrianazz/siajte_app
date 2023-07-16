import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:siajte_app/app/modules/penilaian_peng_skripsi/controllers/penilaian_peng_skripsi_controller.dart';
import 'package:siajte_app/app/theme/colors.dart';
import 'package:siajte_app/app/theme/style.dart';

class FormNilaiPengSkripsi extends StatelessWidget {
  const FormNilaiPengSkripsi({super.key});

  @override
  Widget build(BuildContext context) {
    PenilaianPengSkripsiController controller =
        Get.put(PenilaianPengSkripsiController());

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: 12.w,
            vertical: 6.h,
          ),
          margin: EdgeInsets.symmetric(
            horizontal: 24.w,
          ),
          decoration: BoxDecoration(
            color: primaryColor,
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: FutureBuilder(
              future: controller.getTotalandHuruf(),
              builder: (context, snapshot) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Total Nilai',
                          style: poppins.copyWith(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 8.h),
                        Obx(
                          () => Container(
                            width: 40.w,
                            height: 40.h,
                            margin: EdgeInsets.symmetric(vertical: 6.w),
                            color: Colors.white,
                            child: Center(
                              child: Text(
                                controller.totalNilai.value.ceil().toString(),
                                style: poppins.copyWith(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w700,
                                  color: primaryColor,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Nilai Huruf',
                          style: poppins.copyWith(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 8.h),
                        Obx(
                          () => Container(
                            width: 40.w,
                            height: 40.h,
                            margin: EdgeInsets.symmetric(vertical: 6.w),
                            color: Colors.white,
                            child: Center(
                              child: Text(
                                controller.nilaiHuruf.value,
                                style: poppins.copyWith(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w700,
                                  color: primaryColor,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                );
              }),
        ),
        // SizedBox(
        //   height: 50.h,
        //   width: double.infinity,
        //   child: ListView(
        //     scrollDirection: Axis.horizontal,
        //     children: [
        //       SizedBox(
        //         width: 24.w,
        //       ),
        //       Obx(
        //         () => DotStepper(
        //           activeStep: controller.indexFormNilaiPengSkripsi.value,
        //           dotCount: controller.listFormNilaiPengSkripsi.length,
        //           direction: Axis.horizontal,
        //           shape: Shape.pipe,
        //           indicator: Indicator.shift,
        //           spacing: 20,
        //           onDotTapped: (tappedDotIndex) {
        //             controller.indexFormNilaiPengSkripsi.value = tappedDotIndex;
        //             controller.pageController.animateToPage(
        //               tappedDotIndex,
        //               duration: const Duration(milliseconds: 300),
        //               curve: Curves.bounceInOut,
        //             );
        //           },
        //           dotRadius: 50.w,
        //           lineConnectorDecoration: LineConnectorDecoration(
        //             color: Colors.grey.shade900,
        //             strokeWidth: 40.w,
        //           ),
        //           indicatorDecoration: const IndicatorDecoration(
        //             color: Colors.black,
        //             strokeColor: Colors.black,
        //           ),
        //         ),
        //       ),
        //       SizedBox(
        //         width: 24.w,
        //       ),
        //     ],
        //   ),
        // ),
        // Obx(
        //   () => SizedBox(
        //     width: double.infinity,
        //     height: 600.h,
        //     child: PageView(
        //       controller: controller.pageController,
        //       onPageChanged: (index) {
        //         controller.indexFormNilaiPengSkripsi.value = index;
        //         controller.pageController.jumpToPage(index);
        //       },
        //       children: controller.scoreMapPengSkripsi
        //           .map((key, value) {
        //             var no = controller.scoreMapPengSkripsi.keys
        //                     .toList()
        //                     .indexOf(key) +
        //                 1;

        //             return MapEntry(
        //               key,
        //               CardPenilaianPengSkripsi(
        //                 no: "$no",
        //                 title: key
        //                     .split("_")
        //                     .map((word) =>
        //                         word[0].toUpperCase() + word.substring(1))
        //                     .join(" "),
        //                 score: value,
        //                 value: controller.valueRadioAll[no - 1],
        //               ),
        //             );
        //           })
        //           .values
        //           .toList(),
        //     ),
        //   ),
        // ),
        SizedBox(height: 24.h),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: controller.scoreMapPengSkripsi
              .map((key, values) {
                var no =
                    controller.scoreMapPengSkripsi.keys.toList().indexOf(key) +
                        1;

                return MapEntry(
                  key,
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 24.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "$no. ${key.split("_").map((word) => word[0].toUpperCase() + word.substring(1)).join(" ")}",
                          style: poppins.copyWith(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(height: 10.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Obx(
                              () => Container(
                                height: 80.h,
                                width: 60.w,
                                margin: EdgeInsets.only(bottom: 20.h),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(12.r),
                                  border: Border.all(
                                    color: controller
                                                .scoreMapPengSkripsi[key] ==
                                            controller.valueRadioAll[no - 1][0]
                                        ? textDanger
                                        : Colors.grey.shade300,
                                    width: 3,
                                  ),
                                ),
                                child: Column(
                                  children: [
                                    const Text("SKB"),
                                    Radio(
                                      value: controller.valueRadioAll[no - 1]
                                          [0],
                                      activeColor: textDanger,
                                      groupValue:
                                          controller.scoreMapPengSkripsi[key],
                                      onChanged: (value) {
                                        controller.scoreMapPengSkripsi[key] =
                                            value;
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Obx(
                              () => Container(
                                height: 80.h,
                                width: 60.w,
                                margin: EdgeInsets.only(bottom: 20.h),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(12.r),
                                  border: Border.all(
                                    color: controller
                                                .scoreMapPengSkripsi[key] ==
                                            controller.valueRadioAll[no - 1][1]
                                        ? textSkripsi
                                        : Colors.grey.shade300,
                                    width: 3,
                                  ),
                                ),
                                child: Column(
                                  children: [
                                    const Text("KB"),
                                    Radio(
                                      value: controller.valueRadioAll[no - 1]
                                          [1],
                                      activeColor: textSkripsi,
                                      groupValue:
                                          controller.scoreMapPengSkripsi[key],
                                      onChanged: (value) {
                                        controller.scoreMapPengSkripsi[key] =
                                            value;
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Obx(
                              () => Container(
                                height: 80.h,
                                width: 60.w,
                                margin: EdgeInsets.only(bottom: 20.h),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(12.r),
                                  border: Border.all(
                                    color: controller
                                                .scoreMapPengSkripsi[key] ==
                                            controller.valueRadioAll[no - 1][2]
                                        ? secondaryColor
                                        : Colors.grey.shade300,
                                    width: 3,
                                  ),
                                ),
                                child: Column(
                                  children: [
                                    const Text("N"),
                                    Radio(
                                      value: controller.valueRadioAll[no - 1]
                                          [2],
                                      activeColor: secondaryColor,
                                      groupValue:
                                          controller.scoreMapPengSkripsi[key],
                                      onChanged: (value) {
                                        controller.scoreMapPengSkripsi[key] =
                                            value;
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Obx(
                              () => Container(
                                height: 80.h,
                                width: 60.w,
                                margin: EdgeInsets.only(bottom: 20.h),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(12.r),
                                  border: Border.all(
                                    color: controller
                                                .scoreMapPengSkripsi[key] ==
                                            controller.valueRadioAll[no - 1][3]
                                        ? textKP
                                        : Colors.grey.shade300,
                                    width: 3,
                                  ),
                                ),
                                child: Column(
                                  children: [
                                    const Text("B"),
                                    Radio(
                                      value: controller.valueRadioAll[no - 1]
                                          [3],
                                      activeColor: textKP,
                                      groupValue:
                                          controller.scoreMapPengSkripsi[key],
                                      onChanged: (value) {
                                        controller.scoreMapPengSkripsi[key] =
                                            value;
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Obx(
                              () => Container(
                                height: 80.h,
                                width: 60.w,
                                margin: EdgeInsets.only(bottom: 20.h),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(12.r),
                                  border: Border.all(
                                    color: controller
                                                .scoreMapPengSkripsi[key] ==
                                            controller.valueRadioAll[no - 1][4]
                                        ? primaryColor
                                        : Colors.grey.shade300,
                                    width: 3,
                                  ),
                                ),
                                child: Column(
                                  children: [
                                    const Text("SB"),
                                    Radio(
                                      value: controller.valueRadioAll[no - 1]
                                          [4],
                                      activeColor: primaryColor,
                                      groupValue:
                                          controller.scoreMapPengSkripsi[key],
                                      onChanged: (value) {
                                        controller.scoreMapPengSkripsi[key] =
                                            value;
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                );
              })
              .values
              .toList(),
        ),
        Container(
          width: double.infinity,
          margin: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: primaryColor,
              disabledBackgroundColor: primaryColor,
              padding: EdgeInsets.symmetric(vertical: 12.h),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            onPressed: () async {
              await controller.updateFormNilaiPengSkripsiAPI(
                  controller.existPenilaianSkripsiPeng.id.toString());

              controller.selectedChips.value++;
            },
            child: Text(
              'Selanjutnya',
              style:
                  roboto.copyWith(fontSize: 16.sp, fontWeight: FontWeight.w600),
            ),
          ),
        ),
      ],
    );
  }
}
