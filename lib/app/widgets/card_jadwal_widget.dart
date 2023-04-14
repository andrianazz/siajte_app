import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:siajte_app/app/data/models/penjadwalan_kp_model.dart';
import 'package:siajte_app/app/data/models/penjadwalan_sempro_model.dart';
import 'package:siajte_app/app/data/models/penjadwalan_skripsi_model.dart';
import 'package:siajte_app/app/modules/jadwal_seminar/controllers/jadwal_seminar_controller.dart';

import '../theme/colors.dart';
import '../theme/style.dart';

class CardJadwalWidget extends StatelessWidget {
  final PenjadwalanKp? penjadwalanKp;
  final PenjadwalanSempro? penjadwalanSempro;
  final PenjadwalanSkripsi? penjadwalanSkripsi;
  final Function onTap;

  const CardJadwalWidget({
    super.key,
    this.penjadwalanKp,
    this.penjadwalanSempro,
    this.penjadwalanSkripsi,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    JadwalSeminarController jadwalSeminarC = Get.find();
    return InkWell(
      onTap: () {
        onTap();
      },
      child: Container(
        width: double.infinity,
        height: 115.h,
        margin: EdgeInsets.only(bottom: 20.h),
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FutureBuilder<String>(
                  future: jadwalSeminarC.getMahasiswaWithNim(
                    penjadwalanKp != null
                        ? penjadwalanKp!.mahasiswaNim!
                        : penjadwalanSempro != null
                            ? penjadwalanSempro!.mahasiswaNim!
                            : penjadwalanSkripsi!.mahasiswaNim!,
                  ),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Text(
                        snapshot.data!,
                        style: poppins.copyWith(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                            color: textJadwalSeminar),
                      );
                    } else if (snapshot.hasError) {
                      return const Text("error");
                    } else {
                      return const Center(child: CircularProgressIndicator());
                    }
                  },
                ),
                Text(
                  penjadwalanKp != null
                      ? "${penjadwalanKp!.tanggal}"
                      : penjadwalanSempro != null
                          ? '${penjadwalanSempro!.tanggal}'
                          : '${penjadwalanSkripsi!.tanggal}',
                  style: poppins.copyWith(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Seminar",
                          style: poppins.copyWith(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          "NIM",
                          style: poppins.copyWith(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                    SizedBox(width: 22.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          penjadwalanKp != null
                              ? "KP"
                              : penjadwalanSempro != null
                                  ? 'Proposal'
                                  : 'Skripsi',
                          style: poppins.copyWith(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w600,
                            color: penjadwalanKp != null
                                ? textKP
                                : penjadwalanSempro != null
                                    ? textProposal
                                    : textSkripsi,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          penjadwalanKp != null
                              ? "${penjadwalanKp!.mahasiswaNim}"
                              : penjadwalanSempro != null
                                  ? '${penjadwalanSempro!.mahasiswaNim}'
                                  : '${penjadwalanSkripsi!.mahasiswaNim}',
                          style: poppins.copyWith(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w600,
                            color: textJelas,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Jam",
                      style: poppins.copyWith(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                        color: secondaryJadwalSeminar,
                      ),
                    ),
                    SizedBox(width: 30.w),
                    Text(
                      penjadwalanKp != null
                          ? "${penjadwalanKp!.waktu}"
                          : penjadwalanSempro != null
                              ? '${penjadwalanSempro!.waktu}'
                              : '${penjadwalanSkripsi!.waktu}',
                      style: poppins.copyWith(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w600,
                        color: textJelas,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
