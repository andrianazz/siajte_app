import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:siajte_app/app/modules/penilaian_peng_skripsi/controllers/penilaian_peng_skripsi_controller.dart';
import 'package:siajte_app/app/theme/colors.dart';
import 'package:siajte_app/app/theme/style.dart';
import 'package:siajte_app/app/widgets/penilaian_peng_skripsi/radio_peng_skripsi.dart';

class CardPenilaianPengSkripsi extends StatelessWidget {
  final String no;
  final String title;
  final double score;
  final List<double> value;

  const CardPenilaianPengSkripsi({
    super.key,
    required this.no,
    required this.title,
    required this.score,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    PenilaianPengSkripsiController controller =
        Get.put(PenilaianPengSkripsiController());

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
          //Change score in RadioPengSempro based on index scoreAll

          RadioPengSkripsi(title: "Sangat Baik", score: value[4]),
          RadioPengSkripsi(title: "Baik", score: value[3]),
          RadioPengSkripsi(title: "Biasa", score: value[2]),
          RadioPengSkripsi(title: "Kurang Baik", score: value[1]),
          RadioPengSkripsi(title: "Sangat Kurang Baik", score: value[0]),
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
              onPressed: () async {
                if (controller.indexFormNilaiPengSkripsi.value <
                    controller.listFormNilaiPengSkripsi.length - 1) {
                  controller.indexFormNilaiPengSkripsi.value++;
                  controller.pageController.nextPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.bounceInOut,
                  );
                } else if (controller.indexFormNilaiPengSkripsi.value ==
                    controller.listFormNilaiPengSkripsi.length - 1) {
                  await controller.updateFormNilaiPengSkripsiAPI(
                      controller.existPenilaianSkripsiPeng.id.toString());
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
