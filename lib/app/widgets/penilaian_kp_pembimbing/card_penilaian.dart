import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:siajte_app/app/modules/penilaian_pemb_kp/controllers/penilaian_pemb_kp_controller.dart';
import 'package:siajte_app/app/theme/colors.dart';
import 'package:siajte_app/app/widgets/penilaian_kp_pembimbing/radio_penilaian.dart';

import '../../theme/style.dart';

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
    PenilaianPembKpController controller = Get.put(PenilaianPembKpController());

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
                if (controller.indexFormNilaiPembKP.value <
                    controller.listFormNilaiPembKP.length - 1) {
                  controller.indexFormNilaiPembKP.value++;
                  controller.pageController.nextPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.bounceInOut,
                  );
                } else if (controller.indexFormNilaiPembKP.value ==
                    controller.listFormNilaiPembKP.length - 1) {
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
