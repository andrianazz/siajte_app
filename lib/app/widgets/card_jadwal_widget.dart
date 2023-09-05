import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:siajte_app/app/data/models/abstact_penjadwalan.dart';
import 'package:siajte_app/app/modules/jadwal_seminar/controllers/jadwal_seminar_controller.dart';
import 'package:siajte_app/app/routes/app_pages.dart';

import '../theme/colors.dart';
import '../theme/style.dart';

class CardJadwalWidget extends StatefulWidget {
  final Penjadwalan? penjadwalan;
  final Function onTap;

  const CardJadwalWidget({
    super.key,
    this.penjadwalan,
    required this.onTap,
  });

  @override
  State<CardJadwalWidget> createState() => _CardJadwalWidgetState();
}

class _CardJadwalWidgetState extends State<CardJadwalWidget> {
  JadwalSeminarController jadwalSeminarC = Get.put(JadwalSeminarController());
  late Future<String?> namaMahasiswa;

  @override
  initState() {
    super.initState();
    namaMahasiswa =
        jadwalSeminarC.getMahasiswaWithNim(widget.penjadwalan!.mahasiswaNim!);
  }

  @override
  Widget build(BuildContext context) {
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
            widget.onTap();
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
                    FutureBuilder<String?>(
                      future: jadwalSeminarC.getMahasiswaWithNim(
                          widget.penjadwalan!.mahasiswaNim!),
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
                          return ElevatedButton(
                            onPressed: () => Get.offAllNamed(Routes.HOME),
                            child: const Text("refresh"),
                          );
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
                      widget.penjadwalan!.tanggal!,
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
                              widget.penjadwalan!.jenisSeminar!,
                              style: poppins.copyWith(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w600,
                                color: widget.penjadwalan!.jenisSeminar == "KP"
                                    ? textKP
                                    : widget.penjadwalan!.jenisSeminar !=
                                            "Proposal"
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
                              widget.penjadwalan!.mahasiswaNim!,
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
                          widget.penjadwalan!.waktu!,
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
