import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:siajte_app/app/modules/penilaian_peng_kp/controllers/penilaian_peng_kp_controller.dart';
import 'package:siajte_app/app/theme/colors.dart';
import 'package:siajte_app/app/theme/style.dart';

class RadioPenilaianPenguji extends StatelessWidget {
  final String title;
  final double score;

  const RadioPenilaianPenguji({
    super.key,
    required this.title,
    required this.score,
  });

  @override
  Widget build(BuildContext context) {
    PenilaianPengKpController controller = Get.put(PenilaianPengKpController());

    return Obx(
      () => GestureDetector(
        onTap: () {
          controller.scoreMapPeng.update(
              controller.scoreMapPeng.keys
                  .toList()[controller.indexFormNilaiPengKP.value],
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
              color: controller.scoreMapPeng.values
                          .toList()[controller.indexFormNilaiPengKP.value] ==
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
                    groupValue: controller.scoreMapPeng.values
                        .toList()[controller.indexFormNilaiPengKP.value],
                    activeColor: primaryColor,
                    onChanged: (value) {
                      controller.scoreMapPeng.update(
                        controller.scoreMapPeng.keys
                            .toList()[controller.indexFormNilaiPengKP.value],
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
