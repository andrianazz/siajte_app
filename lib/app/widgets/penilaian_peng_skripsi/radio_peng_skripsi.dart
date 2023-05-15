import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:siajte_app/app/modules/penilaian_peng_skripsi/controllers/penilaian_peng_skripsi_controller.dart';
import 'package:siajte_app/app/theme/colors.dart';
import 'package:siajte_app/app/theme/style.dart';

class RadioPengSkripsi extends StatelessWidget {
  final String title;
  final double score;
  const RadioPengSkripsi({
    super.key,
    required this.score,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    PenilaianPengSkripsiController controller =
        Get.put(PenilaianPengSkripsiController());

    return Obx(
      () => GestureDetector(
        onTap: () {
          controller.scoreMapPengSkripsi.update(
              controller.scoreMapPengSkripsi.keys
                  .toList()[controller.indexFormNilaiPengSkripsi.value],
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
              color: controller.scoreMapPengSkripsi.values.toList()[
                          controller.indexFormNilaiPengSkripsi.value] ==
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
                Text(
                  title,
                  style: inter.copyWith(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Obx(
                  () => Radio(
                    value: score,
                    groupValue: controller.scoreMapPengSkripsi.values
                        .toList()[controller.indexFormNilaiPengSkripsi.value],
                    activeColor: primaryColor,
                    onChanged: (value) {
                      controller.scoreMapPengSkripsi.update(
                        controller.scoreMapPengSkripsi.keys.toList()[
                            controller.indexFormNilaiPengSkripsi.value],
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
