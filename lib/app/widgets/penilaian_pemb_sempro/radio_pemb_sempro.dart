import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:siajte_app/app/modules/penilaian_pemb_proposal/controllers/penilaian_pemb_proposal_controller.dart';
import 'package:siajte_app/app/theme/colors.dart';
import 'package:siajte_app/app/theme/style.dart';

class RadioPembSempro extends StatelessWidget {
  final String title;
  final double score;
  const RadioPembSempro({
    super.key,
    required this.title,
    required this.score,
  });

  @override
  Widget build(BuildContext context) {
    PenilaianPembProposalController controller =
        Get.put(PenilaianPembProposalController());

    return Obx(
      () => GestureDetector(
        onTap: () {
          controller.scoreMapPembSempro.update(
              controller.scoreMapPembSempro.keys
                  .toList()[controller.indexFormNilaiPembSempro.value],
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
              color: controller.scoreMapPembSempro.values.toList()[
                          controller.indexFormNilaiPembSempro.value] ==
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
                    groupValue: controller.scoreMapPembSempro.values
                        .toList()[controller.indexFormNilaiPembSempro.value],
                    activeColor: primaryColor,
                    onChanged: (value) {
                      controller.scoreMapPembSempro.update(
                        controller.scoreMapPembSempro.keys.toList()[
                            controller.indexFormNilaiPembSempro.value],
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
