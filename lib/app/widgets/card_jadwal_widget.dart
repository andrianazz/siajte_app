import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:siajte_app/app/data/models/abstact_penjadwalan.dart';
import 'package:siajte_app/app/modules/jadwal_seminar/controllers/jadwal_seminar_controller.dart';

import '../theme/colors.dart';
import '../theme/style.dart';

class CardJadwalWidget extends StatelessWidget {
  final Penjadwalan? penjadwalan;
  final Function onTap;

  const CardJadwalWidget({
    super.key,
    this.penjadwalan,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    JadwalSeminarController jadwalSeminarC = Get.put(JadwalSeminarController());

    return Container(
      margin: EdgeInsets.only(bottom: 20.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.7),
            spreadRadius: 1,
            blurRadius: 10,
            offset: const Offset(1, 5),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(15),
          onTap: () {
            onTap();
          },
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
            decoration: BoxDecoration(
              // color: Colors.white,
              borderRadius: BorderRadius.circular(15),
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
                        // penjadwalanKp != null
                        //     ? penjadwalanKp!.mahasiswaNim!
                        //     : penjadwalanSempro != null
                        //         ? penjadwalanSempro!.mahasiswaNim!
                        //         : penjadwalanSkripsi!.mahasiswaNim!,
                        penjadwalan!.mahasiswaNim!,
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
                          return const Center(
                              child: CircularProgressIndicator());
                        }
                      },
                    ),
                    Text(
                      // penjadwalanKp != null
                      //     ? "${penjadwalanKp!.tanggal}"
                      //     : penjadwalanSempro != null
                      //         ? '${penjadwalanSempro!.tanggal}'
                      //         : '${penjadwalanSkripsi!.tanggal}',
                      penjadwalan!.tanggal!,
                      style: poppins.copyWith(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 12.h),
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
                            SizedBox(height: 8.h),
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
                              // penjadwalanKp != null
                              //     ? "KP"
                              //     : penjadwalanSempro != null
                              //         ? 'Proposal'
                              //         : 'Skripsi',
                              penjadwalan!.jenisSeminar!,
                              style: poppins.copyWith(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w600,
                                color: penjadwalan!.jenisSeminar == "KP"
                                    ? textKP
                                    : penjadwalan!.jenisSeminar != "Proposal"
                                        ? textProposal
                                        : textSkripsi,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                            SizedBox(height: 8.h),
                            Text(
                              // penjadwalanKp != null
                              //     ? "${penjadwalanKp!.mahasiswaNim}"
                              //     : penjadwalanSempro != null
                              //         ? '${penjadwalanSempro!.mahasiswaNim}'
                              //         : '${penjadwalanSkripsi!.mahasiswaNim}',
                              penjadwalan!.mahasiswaNim!,
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
                          // penjadwalanKp != null
                          //     ? "${penjadwalanKp!.waktu}"
                          //     : penjadwalanSempro != null
                          //         ? '${penjadwalanSempro!.waktu}'
                          //         : '${penjadwalanSkripsi!.waktu}',
                          penjadwalan!.waktu!,
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
        ),
      ),
    );
  }
}
