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
                          if (val == 0) {
                            controller.indexFormNilaiKP.value = 0;
                          }
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

          // kERJA PRAKTEK
          Obx(() => controller.viewListPenilaianKP()),
        ],
      ),
    );
  }
}

class CatatanKPView extends StatelessWidget {
  const CatatanKPView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    PenilaianSeminarController controller = Get.find();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Container(
            width: 315.w,
            height: 3,
            color: Colors.grey.shade200,
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
              child: Text(
                'Catatan 1',
                style: poppins.copyWith(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w700,
                  color: fieldChangePassword,
                ),
              ),
            ),
            SizedBox(height: 8.h),
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: 24.w,
              ),
              child: TextFormField(
                maxLines: 3,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 22.w,
                    vertical: 17.h,
                  ),
                  labelStyle: poppins.copyWith(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                  ),
                  fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.r),
                    borderSide: const BorderSide(
                      width: 2,
                      style: BorderStyle.solid,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 15.h),
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: 24.w,
              ),
              child: Text(
                'Catatan 2',
                style: poppins.copyWith(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w700,
                  color: fieldChangePassword,
                ),
              ),
            ),
            SizedBox(height: 8.h),
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: 24.w,
              ),
              child: TextFormField(
                maxLines: 3,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 22.w,
                    vertical: 17.h,
                  ),
                  labelStyle: poppins.copyWith(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                    color: fieldChangePassword,
                  ),
                  fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.r),
                    borderSide: const BorderSide(
                      width: 2,
                      style: BorderStyle.solid,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 15.h),
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: 24.w,
              ),
              child: Text(
                'Catatan 3',
                style: poppins.copyWith(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w700,
                  color: fieldChangePassword,
                ),
              ),
            ),
            SizedBox(height: 8.h),
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: 24.w,
              ),
              child: TextFormField(
                maxLines: 3,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 22.w,
                    vertical: 17.h,
                  ),
                  labelStyle: poppins.copyWith(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                    color: fieldChangePassword,
                  ),
                  fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.r),
                    borderSide: const BorderSide(
                      width: 2,
                      style: BorderStyle.solid,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 50.h),
        Container(
          width: double.infinity,
          margin: EdgeInsets.symmetric(horizontal: 24.w),
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

class PenilaianPembimbingView extends StatelessWidget {
  const PenilaianPembimbingView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    PenilaianSeminarController controller = Get.find();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Container(
            width: 315.w,
            height: 3,
            color: Colors.grey.shade200,
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(
            horizontal: 24.w,
            vertical: 24.h,
          ),
          child: Text(
            'Penilaian Pembimbing Lapangan',
            style: poppins.copyWith(
              fontSize: 16.sp,
              fontWeight: FontWeight.w700,
              color: fieldChangePassword,
            ),
          ),
        ),
        Form(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(
                  horizontal: 24.w,
                ),
                child: TextFormField(
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 22.w,
                      vertical: 17.h,
                    ),
                    hintText: 'Input angka *90*',
                    labelStyle: poppins.copyWith(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                      color: fieldChangePassword,
                    ),
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.r),
                      borderSide: const BorderSide(
                        width: 2,
                        style: BorderStyle.solid,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 350.h),
        Container(
          width: double.infinity,
          margin: EdgeInsets.symmetric(horizontal: 24.w),
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

class FormNilaiKPView extends StatelessWidget {
  const FormNilaiKPView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    PenilaianSeminarController controller = Get.find();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
                  activeStep: controller.indexFormNilaiKP.value,
                  dotCount: controller.listFormNilaiKP.length,
                  direction: Axis.horizontal,
                  shape: Shape.pipe,
                  indicator: Indicator.shift,
                  spacing: 20,
                  onDotTapped: (tappedDotIndex) {
                    controller.indexFormNilaiKP.value = tappedDotIndex;
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
                controller.indexFormNilaiKP.value = index;
                controller.pageController.jumpToPage(index);
              },
              children: controller.scoreMap
                  .map((key, value) {
                    var no = controller.scoreMap.keys.toList().indexOf(key) + 1;

                    return MapEntry(
                      key,
                      CardPenilaian(
                        no: "$no",
                        title: key,
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

class CardPenilaian extends StatelessWidget {
  final String no;
  final String title;
  final double score;

  const CardPenilaian({
    super.key,
    required this.no,
    required this.title,
    required this.score,
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
          const RadioPenilaian(title: "Sangat Baik", score: 2),
          const RadioPenilaian(title: "Baik", score: 4),
          const RadioPenilaian(title: "Biasa", score: 6),
          const RadioPenilaian(title: "Kurang Baik", score: 8),
          const RadioPenilaian(title: "Sangat Kurang Baik", score: 10),
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
                  controller.pageController.nextPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.bounceInOut,
                  );
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
          ),
        ],
      ),
    );
  }
}

class RadioPenilaian extends StatelessWidget {
  final String title;
  final double score;
  const RadioPenilaian({
    super.key,
    required this.title,
    required this.score,
  });

  @override
  Widget build(BuildContext context) {
    PenilaianSeminarController controller = Get.find();
    return Obx(
      () => GestureDetector(
        onTap: () {
          controller.scoreMap.update(
              controller.scoreMap.keys
                  .toList()[controller.indexFormNilaiKP.value],
              (value) => score);
        },
        child: Container(
          height: 60,
          margin: EdgeInsets.only(bottom: 12.h),
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: controller.scoreMap.values
                          .toList()[controller.indexFormNilaiKP.value] ==
                      score
                  ? primaryColor
                  : Colors.grey.shade300,
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
                Obx(
                  () => Radio(
                    value: score,
                    groupValue: controller.scoreMap.values
                        .toList()[controller.indexFormNilaiKP.value],
                    activeColor: primaryColor,
                    onChanged: (value) {
                      controller.scoreMap.update(
                        controller.scoreMap.keys
                            .toList()[controller.indexFormNilaiKP.value],
                        (value) => score,
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
