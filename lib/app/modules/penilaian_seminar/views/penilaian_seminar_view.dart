import 'package:chips_choice/chips_choice.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:im_stepper/stepper.dart';
import 'package:siajte_app/app/theme/colors.dart';
import 'package:siajte_app/app/theme/style.dart';

import '../controllers/penilaian_seminar_controller.dart';

class PenilaianSeminarView extends GetView<PenilaianSeminarController> {
  const PenilaianSeminarView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Penilaian Seminar',
          style: poppins.copyWith(
            fontSize: 20.sp,
            fontWeight: FontWeight.w600,
            color: fieldChangePassword,
          ),
        ),
        automaticallyImplyLeading: true,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(
            Icons.arrow_back_ios_new_outlined,
            color: fieldChangePassword,
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: ListView(
        children: [
          SizedBox(
            height: 100.h,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                Row(
                  children: [
                    Obx(
                      () => ChipsChoice<int>.single(
                        value: controller.selectedChips.value,
                        onChanged: (val) {
                          controller.selectedChips.value = val;
                        },
                        choiceItems: C2Choice.listFrom<int, String>(
                          source: controller.listPenilaianKP,
                          value: (i, v) => i,
                          label: (i, v) => v,
                        ),
                        choiceStyle: C2ChipStyle.filled(
                          selectedStyle: C2ChipStyle(
                            foregroundColor: Colors.white,
                            backgroundColor: primaryColor,
                          ),
                          color: Colors.grey[200],
                          padding: EdgeInsets.symmetric(
                            horizontal: 12.w,
                          ),
                          height: 44.h,
                          foregroundStyle: poppins.copyWith(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
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
                DotStepper(
                  activeStep: controller.indexFormNilaiKP.value,
                  dotCount: controller.listFormNilaiKP.length,
                  direction: Axis.horizontal,
                  shape: Shape.pipe,
                  indicator: Indicator.shift,
                  spacing: 20,
                  onDotTapped: (tappedDotIndex) =>
                      controller.indexFormNilaiKP.value = tappedDotIndex,
                  dotRadius: 50.w,
                  lineConnectorDecoration: LineConnectorDecoration(
                    color: Colors.grey.shade900,
                    strokeWidth: 40.w,
                  ),
                  indicatorDecoration: IndicatorDecoration(
                    color: primaryColor,
                    strokeColor: primaryColor,
                  ),
                ),
                SizedBox(
                  width: 24.w,
                ),
              ],
            ),
          ),
          Obx(() => controller.viewFormKP()),
        ],
      ),
    );
  }
}

class CardPenilaian extends StatelessWidget {
  final String no;
  final String title;

  const CardPenilaian({
    super.key,
    required this.no,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    PenilaianSeminarController controller = Get.find();

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 25.h),
          Text(
            "$no. $title",
            style: poppins.copyWith(
              fontSize: 20.sp,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: 20.h),
          const RadioPenilaian(title: "Sangat Baik"),
          const RadioPenilaian(title: "Baik"),
          const RadioPenilaian(title: "Biasa"),
          const RadioPenilaian(title: "Kurang Baik"),
          const RadioPenilaian(title: "Sangat Kurang Baik"),
          SizedBox(height: 10.h),
          SizedBox(
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
              onPressed: () {
                if (controller.indexFormNilaiKP.value <
                    controller.listFormNilaiKP.length - 1) {
                  controller.indexFormNilaiKP.value++;
                } else if (controller.indexFormNilaiKP.value ==
                    controller.listFormNilaiKP.length - 1) {
                  controller.selectedChips.value++;
                }
              },
              child: Text(
                'Selanjutnya',
                style: roboto.copyWith(
                    fontSize: 16.sp, fontWeight: FontWeight.w600),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class RadioPenilaian extends StatelessWidget {
  final String title;
  const RadioPenilaian({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    PenilaianSeminarController controller = Get.find();
    return Container(
      height: 60,
      margin: EdgeInsets.only(bottom: 12.h),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Colors.grey.shade300,
          width: 3,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 12.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title,
                style: inter.copyWith(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w700,
                )),
            Radio(
              value: 1,
              groupValue: controller.score.value,
              onChanged: (value) {
                controller.score.value = value as int;
              },
            )
          ],
        ),
      ),
    );
  }
}
