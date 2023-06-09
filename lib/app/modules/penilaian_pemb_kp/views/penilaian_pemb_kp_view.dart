import 'package:chips_choice/chips_choice.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:siajte_app/app/theme/colors.dart';
import 'package:siajte_app/app/theme/style.dart';

import '../controllers/penilaian_pemb_kp_controller.dart';

class PenilaianPembKpView extends GetView<PenilaianPembKpController> {
  const PenilaianPembKpView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Penilaian Pembimbing KP',
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
                            controller.indexFormNilaiPembKP.value = 0;
                          }
                          controller.selectedChips.value = val;
                        },
                        choiceItems: C2Choice.listFrom<int, String>(
                          source: controller.listPenilaianPembKP,
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
          Obx(() => controller.viewListPenilaianPembKP()),
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
    PenilaianPembKpController controller = Get.put(PenilaianPembKpController());
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
                controller: controller.catatan1C,
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
                controller: controller.catatan2C,
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
                controller: controller.catatan3C,
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
              await controller.updateCatatanKPAPI(
                  controller.existPenilaianKpPemb.id.toString());
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
    PenilaianPembKpController controller = Get.put(PenilaianPembKpController());
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
                  controller: controller.nilaiLapanganC,
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
            onPressed: () async {
              await controller.updateNilaiLapPembKPAPI(
                  controller.existPenilaianKpPemb.id.toString());
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
