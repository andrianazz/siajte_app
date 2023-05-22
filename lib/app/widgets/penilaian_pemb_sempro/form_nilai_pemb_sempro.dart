import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:im_stepper/stepper.dart';
import 'package:siajte_app/app/modules/penilaian_pemb_proposal/controllers/penilaian_pemb_proposal_controller.dart';
import 'package:siajte_app/app/theme/colors.dart';
import 'package:siajte_app/app/theme/style.dart';
import 'package:siajte_app/app/widgets/penilaian_pemb_sempro/card_penilaian_pemb_sempro.dart';

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
        SizedBox(
          height: 50.h,
          width: double.infinity,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              SizedBox(
                width: 24.w,
              ),
              Obx(
                () => DotStepper(
                  activeStep: controller.indexFormNilaiPembSempro.value,
                  dotCount: controller.listFormNilaiPembSempro.length,
                  direction: Axis.horizontal,
                  shape: Shape.pipe,
                  indicator: Indicator.shift,
                  spacing: 20,
                  onDotTapped: (tappedDotIndex) {
                    controller.indexFormNilaiPembSempro.value = tappedDotIndex;
                    controller.pageController.animateToPage(
                      tappedDotIndex,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.bounceInOut,
                    );
                  },
                  dotRadius: 50.w,
                  lineConnectorDecoration: LineConnectorDecoration(
                    color: Colors.grey.shade900,
                    strokeWidth: 40.w,
                  ),
                  indicatorDecoration: const IndicatorDecoration(
                    color: Colors.black,
                    strokeColor: Colors.black,
                  ),
                ),
              ),
              SizedBox(
                width: 24.w,
              ),
            ],
          ),
        ),
        Obx(
          () => SizedBox(
            width: double.infinity,
            height: 550.h,
            child: PageView(
              controller: controller.pageController,
              onPageChanged: (index) {
                controller.indexFormNilaiPembSempro.value = index;
                controller.pageController.jumpToPage(index);
              },
              children: controller.scoreMapPembSempro
                  .map((key, value) {
                    var no = controller.scoreMapPembSempro.keys
                            .toList()
                            .indexOf(key) +
                        1;

                    return MapEntry(
                      key,
                      CardPenilaianPembSempro(
                        no: "$no",
                        title: key
                            .split("_")
                            .map((word) =>
                                word[0].toUpperCase() + word.substring(1))
                            .join(" "),
                        score: value,
                      ),
                    );
                  })
                  .values
                  .toList(),
            ),
          ),
        ),
      ],
    );
  }
}
