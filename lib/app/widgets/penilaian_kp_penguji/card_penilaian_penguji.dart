import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:siajte_app/app/modules/penilaian_peng_kp/controllers/penilaian_peng_kp_controller.dart';
import 'package:siajte_app/app/theme/colors.dart';
import 'package:siajte_app/app/theme/style.dart';
import 'package:siajte_app/app/widgets/penilaian_kp_penguji/radio_penilaian_penguji.dart';

class CardPenilaianPenguji extends StatelessWidget {
  final String no;
  final String title;
  final double score;
  const CardPenilaianPenguji({
    super.key,
    required this.no,
    required this.title,
    required this.score,
  });

  @override
  Widget build(BuildContext context) {
    PenilaianPengKpController controller = Get.put(PenilaianPengKpController());

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
          const RadioPenilaianPenguji(title: "Sangat Baik", score: 2),
          const RadioPenilaianPenguji(title: "Baik", score: 4),
          const RadioPenilaianPenguji(title: "Biasa", score: 6),
          const RadioPenilaianPenguji(title: "Kurang Baik", score: 8),
          const RadioPenilaianPenguji(title: "Sangat Kurang Baik", score: 10),
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
                if (controller.indexFormNilaiPengKP.value <
                    controller.listFormNilaiPengKP.length - 1) {
                  controller.indexFormNilaiPengKP.value++;
                  controller.pageController.nextPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.bounceInOut,
                  );
                } else if (controller.indexFormNilaiPengKP.value ==
                    controller.listFormNilaiPengKP.length - 1) {
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
