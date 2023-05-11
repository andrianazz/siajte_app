import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:siajte_app/app/modules/penilaian_pemb_kp/controllers/penilaian_pemb_kp_controller.dart';

import '../../theme/colors.dart';
import '../../theme/style.dart';

class RadioPenilaian extends StatelessWidget {
  final String title;
  final double score;
  const RadioPenilaian({
    super.key,
    required this.title,
    required this.score,
  });

  @override
  Widget build(BuildContext context) {
    PenilaianPembKpController controller = Get.put(PenilaianPembKpController());

    return Obx(
      () => GestureDetector(
        onTap: () {
          controller.scoreMapPemb.update(
              controller.scoreMapPemb.keys
                  .toList()[controller.indexFormNilaiPembKP.value],
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
              color: controller.scoreMapPemb.values
                          .toList()[controller.indexFormNilaiPembKP.value] ==
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
                    groupValue: controller.scoreMapPemb.values
                        .toList()[controller.indexFormNilaiPembKP.value],
                    activeColor: primaryColor,
                    onChanged: (value) {
                      controller.scoreMapPemb.update(
                        controller.scoreMapPemb.keys
                            .toList()[controller.indexFormNilaiPembKP.value],
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
