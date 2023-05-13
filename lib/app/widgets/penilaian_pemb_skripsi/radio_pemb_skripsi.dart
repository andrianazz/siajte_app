import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:siajte_app/app/modules/penialian_pemb_skipsi/controllers/penialian_pemb_skipsi_controller.dart';
import 'package:siajte_app/app/theme/colors.dart';
import 'package:siajte_app/app/theme/style.dart';

class RadioPembSkripsi extends StatelessWidget {
  final String title;
  final double score;
  const RadioPembSkripsi({
    super.key,
    required this.score,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    PenialianPembSkipsiController controller =
        Get.put(PenialianPembSkipsiController());

    return Obx(
      () => GestureDetector(
        onTap: () {
          controller.scoreMapPembSkripsi.update(
              controller.scoreMapPembSkripsi.keys
                  .toList()[controller.indexFormNilaiPembSkripsi.value],
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
              color: controller.scoreMapPembSkripsi.values.toList()[
                          controller.indexFormNilaiPembSkripsi.value] ==
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
                    groupValue: controller.scoreMapPembSkripsi.values
                        .toList()[controller.indexFormNilaiPembSkripsi.value],
                    activeColor: primaryColor,
                    onChanged: (value) {
                      controller.scoreMapPembSkripsi.update(
                        controller.scoreMapPembSkripsi.keys.toList()[
                            controller.indexFormNilaiPembSkripsi.value],
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
