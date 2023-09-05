import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:siajte_app/app/data/models/abstact_penjadwalan.dart';
import 'package:siajte_app/app/modules/riwayat_seminar/controllers/riwayat_seminar_controller.dart';
import 'package:siajte_app/app/routes/app_pages.dart';

import '../theme/colors.dart';
import '../theme/style.dart';

class CardRiwayatWidget extends StatefulWidget {
  final Penjadwalan? penjadwalan;
  final Function onTap;

  const CardRiwayatWidget({
    super.key,
    this.penjadwalan,
    required this.onTap,
  });

  @override
  State<CardRiwayatWidget> createState() => _CardRiwayatWidgetState();
}

class _CardRiwayatWidgetState extends State<CardRiwayatWidget> {
  RiwayatSeminarController riwayatSeminarC = Get.find();
  late Future<String> _namaMahasiswa;

  @override
  void initState() async {
    super.initState();
    _namaMahasiswa = riwayatSeminarC.getMahasiswaWithNim(
      // penjadwalanKp != null
      //     ? penjadwalanKp!.mahasiswaNim!
      //     : penjadwalanSempro != null
      //         ? penjadwalanSempro!.mahasiswaNim!
      //         : penjadwalanSkripsi!.mahasiswaNim!,
      widget.penjadwalan!.mahasiswaNim!,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
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
                    FutureBuilder(
                      future: riwayatSeminarC.getMahasiswaWithNim(
                        // penjadwalanKp != null
                        //     ? penjadwalanKp!.mahasiswaNim!
                        //     : penjadwalanSempro != null
                        //         ? penjadwalanSempro!.mahasiswaNim!
                        //         : penjadwalanSkripsi!.mahasiswaNim!,
                        widget.penjadwalan!.mahasiswaNim!,
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
