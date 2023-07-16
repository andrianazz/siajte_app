import 'package:chips_choice/chips_choice.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:siajte_app/app/theme/colors.dart';
import 'package:siajte_app/app/theme/style.dart';

import '../controllers/penilaian_peng_skripsi_controller.dart';

class PenilaianPengSkripsiView extends GetView<PenilaianPengSkripsiController> {
  const PenilaianPengSkripsiView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Penilaian Penguji Skripsi',
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
                      () =>
                          // Pembimbing KP
                          ChipsChoice<int>.single(
                        value: controller.selectedChips.value,
                        onChanged: (val) {
                          if (val == 0) {
                            controller.indexFormNilaiPengSkripsi.value = 0;
                          }
                          controller.selectedChips.value = val;
                        },
                        choiceItems: C2Choice.listFrom<int, String>(
                          source: controller.listPenilaianPengSkripsi,
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

          // Pembimbing KP
          Obx(() => controller.viewListPenilaianPengProposal()),
        ],
      ),
    );
  }
}

class SaranPerbaikanskripsiView extends StatelessWidget {
  const SaranPerbaikanskripsiView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    PenilaianPengSkripsiController controller =
        Get.put(PenilaianPengSkripsiController());

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
                'Perbaikan 1',
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
                controller: controller.revisiNaskah1C,
                maxLines: 2,
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
                    borderSide: BorderSide(
                      width: 2,
                      color: Colors.grey.shade200,
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
                'Perbaikan 2',
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
                controller: controller.revisiNaskah2C,
                maxLines: 2,
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
                    borderSide: BorderSide(
                      width: 2,
                      color: Colors.grey.shade200,
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
                'Perbaikan 3',
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
                controller: controller.revisiNaskah3C,
                maxLines: 2,
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
                    borderSide: BorderSide(
                      width: 2,
                      style: BorderStyle.solid,
                      color: Colors.grey.shade200,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 15.h,
            ),
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: 24.w,
              ),
              child: Text(
                'Perbaikan 4',
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
                controller: controller.revisiNaskah4C,
                maxLines: 2,
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
                    borderSide: BorderSide(
                      width: 2,
                      style: BorderStyle.solid,
                      color: Colors.grey.shade200,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 15.h),
        Container(
          margin: EdgeInsets.symmetric(
            horizontal: 24.w,
          ),
          child: Text(
            'Perbaikan 5',
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
            controller: controller.revisiNaskah5C,
            maxLines: 2,
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
                borderSide: BorderSide(
                  width: 2,
                  style: BorderStyle.solid,
                  color: Colors.grey.shade200,
                ),
              ),
            ),
          ),
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
            onPressed: () async {
              await controller.updateRevisiSkripsiAPI(
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

class RevisiJudulView extends StatelessWidget {
  const RevisiJudulView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    PenilaianPengSkripsiController controller =
        Get.put(PenilaianPengSkripsiController());

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
        SizedBox(height: 20.h),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 24.w),
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Judul Lama',
                  style: poppins.copyWith(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w700,
                    color: fieldChangePassword,
                  ),
                ),
                SizedBox(height: 10.h),
                Container(
                  child: TextFormField(
                    controller: controller.oldJudulC,
                    readOnly: true,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 22.w,
                        vertical: 17.h,
                      ),
                      hintText: 'Judul Lama',
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
                SizedBox(height: 20.h),
                Text(
                  'Judul Baru',
                  style: poppins.copyWith(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w700,
                    color: fieldChangePassword,
                  ),
                ),
                SizedBox(height: 10.h),
                Container(
                  child: TextFormField(
                    controller: controller.newJudulC,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 22.w,
                        vertical: 17.h,
                      ),
                      hintText: 'Judul Baru',
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
            onPressed: () async {
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
