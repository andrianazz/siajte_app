import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theme/colors.dart';
import '../theme/style.dart';

class CardJadwalWidget extends StatelessWidget {
  final String nama;
  final String tanggal;
  final String jenis;
  final String nim;
  final String jam;

  const CardJadwalWidget({
    super.key,
    required this.nama,
    required this.tanggal,
    required this.jenis,
    required this.nim,
    required this.jam,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 108.h,
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
              Text(
                nama,
                style: poppins.copyWith(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    color: textJadwalSeminar),
              ),
              Text(
                tanggal,
                style: poppins.copyWith(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                        jenis,
                        style: poppins.copyWith(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w600,
                          color: jenis == "KP"
                              ? textKP
                              : jenis == "Proposal"
                                  ? textProposal
                                  : textSkripsi,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        nim,
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
                    jam,
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
    );
  }
}
