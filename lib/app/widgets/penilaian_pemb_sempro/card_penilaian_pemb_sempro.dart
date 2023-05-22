import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:siajte_app/app/modules/penilaian_pemb_proposal/controllers/penilaian_pemb_proposal_controller.dart';
import 'package:siajte_app/app/theme/colors.dart';
import 'package:siajte_app/app/theme/style.dart';
import 'package:siajte_app/app/widgets/penilaian_pemb_sempro/radio_pemb_sempro.dart';

class CardPenilaianPembSempro extends StatelessWidget {
  final String no;
  final String title;
  final double score;
  const CardPenilaianPembSempro({
    super.key,
    required this.no,
    required this.title,
    required this.score,
  });

  @override
  Widget build(BuildContext context) {
    PenilaianPembProposalController controller =
        Get.put(PenilaianPembProposalController());

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
          const RadioPembSempro(title: "Sangat Baik", score: 9),
          const RadioPembSempro(title: "Baik", score: 7.2),
          const RadioPembSempro(title: "Biasa", score: 5.4),
          const RadioPembSempro(title: "Kurang Baik", score: 3.6),
          const RadioPembSempro(title: "Sangat Kurang Baik", score: 1.8),
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
                if (controller.indexFormNilaiPembSempro.value <
                    controller.listFormNilaiPembSempro.length - 1) {
                  controller.indexFormNilaiPembSempro.value++;
                  controller.pageController.nextPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.bounceInOut,
                  );
                } else if (controller.indexFormNilaiPembSempro.value ==
                    controller.listFormNilaiPembSempro.length - 1) {
                  controller.updateFormNilaiPembSemproAPI(
                      controller.existPenilaianSemproPemb.id.toString());
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
