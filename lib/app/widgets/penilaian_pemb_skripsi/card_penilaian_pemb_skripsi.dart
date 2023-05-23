import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:siajte_app/app/modules/penialian_pemb_skipsi/controllers/penialian_pemb_skipsi_controller.dart';
import 'package:siajte_app/app/theme/colors.dart';
import 'package:siajte_app/app/theme/style.dart';
import 'package:siajte_app/app/widgets/penilaian_pemb_skripsi/radio_pemb_skripsi.dart';

class CardPenilaianPembSkripsi extends StatelessWidget {
  final String no;
  final String title;
  final double score;
  final List<double> value;
  const CardPenilaianPembSkripsi({
    super.key,
    required this.no,
    required this.title,
    required this.score,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    PenialianPembSkipsiController controller =
        Get.put(PenialianPembSkipsiController());

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
          RadioPembSkripsi(title: "Sangat Baik", score: value[4]),
          RadioPembSkripsi(title: "Baik", score: value[3]),
          RadioPembSkripsi(title: "Biasa", score: value[2]),
          RadioPembSkripsi(title: "Kurang Baik", score: value[1]),
          RadioPembSkripsi(title: "Sangat Kurang Baik", score: value[0]),
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
                if (controller.indexFormNilaiPembSkripsi.value <
                    controller.listFormNilaiPembSkripsi.length - 1) {
                  controller.indexFormNilaiPembSkripsi.value++;
                  controller.pageController.nextPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.bounceInOut,
                  );
                } else if (controller.indexFormNilaiPembSkripsi.value ==
                    controller.listFormNilaiPembSkripsi.length - 1) {
                  await controller.updateFormNilaiPembSkripsiAPI(
                      controller.existPenilaianSkripsiPemb.id.toString());
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
