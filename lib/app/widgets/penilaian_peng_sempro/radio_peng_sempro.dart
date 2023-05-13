import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:siajte_app/app/modules/penilaian_peng_proposal/controllers/penilaian_peng_proposal_controller.dart';
import 'package:siajte_app/app/theme/colors.dart';
import 'package:siajte_app/app/theme/style.dart';

class RadioPengSempro extends StatelessWidget {
  final String title;
  final double score;
  const RadioPengSempro({
    super.key,
    required this.title,
    required this.score,
  });

  @override
  Widget build(BuildContext context) {
    PenilaianPengProposalController controller =
        Get.put(PenilaianPengProposalController());

    return Obx(
      () => GestureDetector(
        onTap: () {
          controller.scoreMapPengSempro.update(
              controller.scoreMapPengSempro.keys
                  .toList()[controller.indexFormNilaiPengSempro.value],
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
              color: controller.scoreMapPengSempro.values.toList()[
                          controller.indexFormNilaiPengSempro.value] ==
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
                    groupValue: controller.scoreMapPengSempro.values
                        .toList()[controller.indexFormNilaiPengSempro.value],
                    activeColor: primaryColor,
                    onChanged: (value) {
                      controller.scoreMapPengSempro.update(
                        controller.scoreMapPengSempro.keys.toList()[
                            controller.indexFormNilaiPengSempro.value],
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
