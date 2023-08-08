import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:siajte_app/app/modules/penilaian_pemb_proposal/controllers/penilaian_pemb_proposal_controller.dart';
import 'package:siajte_app/app/theme/colors.dart';
import 'package:siajte_app/app/theme/style.dart';

class FormNilaiPembSempro extends StatelessWidget {
  const FormNilaiPembSempro({super.key});

  @override
  Widget build(BuildContext context) {
    PenilaianPembProposalController controller =
        Get.put(PenilaianPembProposalController());

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
        //           activeStep: controller.indexFormNilaiPembSempro.value,
        //           dotCount: controller.listFormNilaiPembSempro.length,
        //           direction: Axis.horizontal,
        //           shape: Shape.pipe,
        //           indicator: Indicator.shift,
        //           spacing: 20,
        //           onDotTapped: (tappedDotIndex) {
        //             controller.indexFormNilaiPembSempro.value = tappedDotIndex;
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
        //     height: 550.h,
        //     child: PageView(
        //       controller: controller.pageController,
        //       onPageChanged: (index) {
        //         controller.indexFormNilaiPembSempro.value = index;
        //         controller.pageController.jumpToPage(index);
        //       },
        //       children: controller.scoreMapPembSempro
        //           .map((key, value) {
        //             var no = controller.scoreMapPembSempro.keys
        //                     .toList()
        //                     .indexOf(key) +
        //                 1;

        //             return MapEntry(
        //               key,
        //               CardPenilaianPembSempro(
        //                 no: "$no",
        //                 title: key
        //                     .split("_")
        //                     .map((word) =>
        //                         word[0].toUpperCase() + word.substring(1))
        //                     .join(" "),
        //                 score: value,
        //               ),
        //             );
        //           })
        //           .values
        //           .toList(),
        //     ),
        //   ),
        // ),
        SizedBox(height: 8.h),
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: const Wrap(
            alignment: WrapAlignment.center,
            runSpacing: 2,
            spacing: 2,
            children: [
              Text(
                "SKB = Sangat Kurang Baik, ",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                "KB = Kurang Baik,",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                "N = Netral, ",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                "B = Baik, ",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                "SB = Sangat Baik,",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        SizedBox(height: 24.h),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: controller.scoreMapPembSempro
              .map((key, values) {
                var no =
                    controller.scoreMapPembSempro.keys.toList().indexOf(key) +
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
                                    color: controller.scoreMapPembSempro[key] ==
                                            1.8
                                        ? textDanger
                                        : Colors.grey.shade300,
                                    width: 3,
                                  ),
                                ),
                                child: Column(
                                  children: [
                                    const Text("SKB"),
                                    Radio(
                                      value: 1.8,
                                      activeColor: textDanger,
                                      groupValue:
                                          controller.scoreMapPembSempro[key],
                                      onChanged: (value) {
                                        controller.scoreMapPembSempro[key] =
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
                                    color: controller.scoreMapPembSempro[key] ==
                                            3.6
                                        ? textSkripsi
                                        : Colors.grey.shade300,
                                    width: 3,
                                  ),
                                ),
                                child: Column(
                                  children: [
                                    const Text("KB"),
                                    Radio(
                                      value: 3.6,
                                      activeColor: textSkripsi,
                                      groupValue:
                                          controller.scoreMapPembSempro[key],
                                      onChanged: (value) {
                                        controller.scoreMapPembSempro[key] =
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
                                    color: controller.scoreMapPembSempro[key] ==
                                            5.4
                                        ? secondaryColor
                                        : Colors.grey.shade300,
                                    width: 3,
                                  ),
                                ),
                                child: Column(
                                  children: [
                                    const Text("N"),
                                    Radio(
                                      value: 5.4,
                                      activeColor: secondaryColor,
                                      groupValue:
                                          controller.scoreMapPembSempro[key],
                                      onChanged: (value) {
                                        controller.scoreMapPembSempro[key] =
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
                                    color: controller.scoreMapPembSempro[key] ==
                                            7.2
                                        ? textKP
                                        : Colors.grey.shade300,
                                    width: 3,
                                  ),
                                ),
                                child: Column(
                                  children: [
                                    const Text("B"),
                                    Radio(
                                      value: 7.2,
                                      activeColor: textKP,
                                      groupValue:
                                          controller.scoreMapPembSempro[key],
                                      onChanged: (value) {
                                        controller.scoreMapPembSempro[key] =
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
                                    color: controller.scoreMapPembSempro[key] ==
                                            9.0
                                        ? primaryColor
                                        : Colors.grey.shade300,
                                    width: 3,
                                  ),
                                ),
                                child: Column(
                                  children: [
                                    const Text("SB"),
                                    Radio(
                                      value: 9.0,
                                      activeColor: primaryColor,
                                      groupValue:
                                          controller.scoreMapPembSempro[key],
                                      onChanged: (value) {
                                        controller.scoreMapPembSempro[key] =
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
              await controller.updateFormNilaiPembSemproAPI(
                  controller.existPenilaianSemproPemb.id.toString());

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
