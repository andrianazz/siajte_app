import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:siajte_app/app/theme/colors.dart';
import 'package:siajte_app/app/theme/style.dart';

class CardBASkripsi extends StatelessWidget {
  const CardBASkripsi({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 24.w),
          padding: EdgeInsets.symmetric(
            horizontal: 16.w,
            vertical: 16.h,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.w),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Penilaian Penguji",
                style: poppins.copyWith(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 20.h),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Penilaian Penguji",
                          style: poppins.copyWith(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: 15.h),
                        const DetailTextBA(title: "Presentasi"),
                        SizedBox(height: 10.h),
                        const DetailTextBA(title: "Tingkat Penguasaan Materi"),
                        SizedBox(height: 10.h),
                        const DetailTextBA(title: "Keaslian"),
                        SizedBox(height: 10.h),
                        const DetailTextBA(title: "Ketepatan Metodologi"),
                        SizedBox(height: 10.h),
                        const DetailTextBA(title: "Penguasan Dasar Teori"),
                        SizedBox(height: 10.h),
                        const DetailTextBA(
                            title: "Kecermatan Perumusan Masalah"),
                        SizedBox(height: 10.h),
                        const DetailTextBA(title: "Tinjauan Pustaka"),
                        SizedBox(height: 10.h),
                        const DetailTextBA(title: "Tata Tulis"),
                        SizedBox(height: 10.h),
                        const DetailTextBA(title: "Tools"),
                        SizedBox(height: 10.h),
                        const DetailTextBA(title: "Penyajian Data"),
                        SizedBox(height: 10.h),
                        const DetailTextBA(title: "Hasil"),
                        SizedBox(height: 10.h),
                        const DetailTextBA(title: "Pembahasan"),
                        SizedBox(height: 10.h),
                        const DetailTextBA(title: "Kesimpulan"),
                        SizedBox(height: 10.h),
                        const DetailTextBA(title: "Keluaran"),
                        SizedBox(height: 10.h),
                        const DetailTextBA(title: "Sumbangan Pemikiran"),
                        SizedBox(height: 10.h),
                        const DetailTextBA(title: "Total Nilai"),
                        SizedBox(height: 10.h),
                        const DetailTextBA(title: "Nilai Huruf Penguji"),
                        SizedBox(height: 10.h),
                        const DetailTextBA(title: "Rata-rata Nilai Penguji"),
                      ],
                    ),
                    SizedBox(width: 10.w),
                    Column(
                      children: [
                        Text(
                          "B",
                          style: poppins.copyWith(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: 15.h),
                        const DetailTextBA(title: "2"),
                        SizedBox(height: 10.h),
                        const DetailTextBA(title: "3"),
                        SizedBox(height: 10.h),
                        const DetailTextBA(title: "2"),
                        SizedBox(height: 10.h),
                        const DetailTextBA(title: "4"),
                        SizedBox(height: 10.h),
                        const DetailTextBA(title: "4"),
                        SizedBox(height: 10.h),
                        const DetailTextBA(title: "3"),
                        SizedBox(height: 10.h),
                        const DetailTextBA(title: "3"),
                        SizedBox(height: 10.h),
                        const DetailTextBA(title: "2"),
                        SizedBox(height: 10.h),
                        const DetailTextBA(title: "2"),
                        SizedBox(height: 10.h),
                        const DetailTextBA(title: "3"),
                        SizedBox(height: 10.h),
                        const DetailTextBA(title: "4"),
                        SizedBox(height: 10.h),
                        const DetailTextBA(title: "4"),
                        SizedBox(height: 10.h),
                        const DetailTextBA(title: "3"),
                        SizedBox(height: 10.h),
                        const DetailTextBA(title: "3"),
                        SizedBox(height: 10.h),
                        const DetailTextBA(title: "3"),
                        SizedBox(height: 10.h),
                        const DetailTextBA(title: "45"),
                        SizedBox(height: 10.h),
                        const DetailTextBA(title: ""),
                        SizedBox(height: 10.h),
                        const DetailTextBA(title: ""),
                      ],
                    ),
                    SizedBox(width: 10.w),
                    Column(
                      children: [
                        Text(
                          "Penguji 1",
                          style: poppins.copyWith(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: 15.h),
                        const NilaiTextBA(title: "-"),
                        SizedBox(height: 10.h),
                        const NilaiTextBA(title: "-"),
                        SizedBox(height: 10.h),
                        const NilaiTextBA(title: "-"),
                        SizedBox(height: 10.h),
                        const NilaiTextBA(title: "-"),
                        SizedBox(height: 10.h),
                        const NilaiTextBA(title: "-"),
                        SizedBox(height: 10.h),
                        const NilaiTextBA(title: "-"),
                        SizedBox(height: 10.h),
                        const NilaiTextBA(title: "-"),
                        SizedBox(height: 10.h),
                        const NilaiTextBA(title: "-"),
                        SizedBox(height: 10.h),
                        const NilaiTextBA(title: "-"),
                        SizedBox(height: 10.h),
                        const NilaiTextBA(title: "-"),
                        SizedBox(height: 10.h),
                        const NilaiTextBA(title: "-"),
                        SizedBox(height: 10.h),
                        const NilaiTextBA(title: "-"),
                        SizedBox(height: 10.h),
                        const NilaiTextBA(title: "-"),
                        SizedBox(height: 10.h),
                        const NilaiTextBA(title: "-"),
                        SizedBox(height: 10.h),
                        const NilaiTextBA(title: "-"),
                        SizedBox(height: 10.h),
                        const NilaiTextBA(title: "-"),
                        SizedBox(height: 10.h),
                        const NilaiTextBA(title: "-"),
                        SizedBox(height: 10.h),
                        const NilaiTextBA(title: "-"),
                      ],
                    ),
                    SizedBox(width: 10.w),
                    Column(
                      children: [
                        Text(
                          "Penguji 2",
                          style: poppins.copyWith(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: 15.h),
                        const NilaiTextBA(title: "-"),
                        SizedBox(height: 10.h),
                        const NilaiTextBA(title: "-"),
                        SizedBox(height: 10.h),
                        const NilaiTextBA(title: "-"),
                        SizedBox(height: 10.h),
                        const NilaiTextBA(title: "-"),
                        SizedBox(height: 10.h),
                        const NilaiTextBA(title: "-"),
                        SizedBox(height: 10.h),
                        const NilaiTextBA(title: "-"),
                        SizedBox(height: 10.h),
                        const NilaiTextBA(title: "-"),
                        SizedBox(height: 10.h),
                        const NilaiTextBA(title: "-"),
                        SizedBox(height: 10.h),
                        const NilaiTextBA(title: "-"),
                        SizedBox(height: 10.h),
                        const NilaiTextBA(title: "-"),
                        SizedBox(height: 10.h),
                        const NilaiTextBA(title: "-"),
                        SizedBox(height: 10.h),
                        const NilaiTextBA(title: "-"),
                        SizedBox(height: 10.h),
                        const NilaiTextBA(title: "-"),
                        SizedBox(height: 10.h),
                        const NilaiTextBA(title: "-"),
                        SizedBox(height: 10.h),
                        const NilaiTextBA(title: "-"),
                        SizedBox(height: 10.h),
                        const NilaiTextBA(title: "-"),
                        SizedBox(height: 10.h),
                        const NilaiTextBA(title: "-"),
                        SizedBox(height: 10.h),
                        const NilaiTextBA(title: "-"),
                      ],
                    ),
                    SizedBox(width: 10.w),
                    Column(
                      children: [
                        Text(
                          "Penguji 3",
                          style: poppins.copyWith(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: 15.h),
                        const NilaiTextBA(title: "-"),
                        SizedBox(height: 10.h),
                        const NilaiTextBA(title: "-"),
                        SizedBox(height: 10.h),
                        const NilaiTextBA(title: "-"),
                        SizedBox(height: 10.h),
                        const NilaiTextBA(title: "-"),
                        SizedBox(height: 10.h),
                        const NilaiTextBA(title: "-"),
                        SizedBox(height: 10.h),
                        const NilaiTextBA(title: "-"),
                        SizedBox(height: 10.h),
                        const NilaiTextBA(title: "-"),
                        SizedBox(height: 10.h),
                        const NilaiTextBA(title: "-"),
                        SizedBox(height: 10.h),
                        const NilaiTextBA(title: "-"),
                        SizedBox(height: 10.h),
                        const NilaiTextBA(title: "-"),
                        SizedBox(height: 10.h),
                        const NilaiTextBA(title: "-"),
                        SizedBox(height: 10.h),
                        const NilaiTextBA(title: "-"),
                        SizedBox(height: 10.h),
                        const NilaiTextBA(title: "-"),
                        SizedBox(height: 10.h),
                        const NilaiTextBA(title: "-"),
                        SizedBox(height: 10.h),
                        const NilaiTextBA(title: "-"),
                        SizedBox(height: 10.h),
                        const NilaiTextBA(title: "-"),
                        SizedBox(height: 10.h),
                        const NilaiTextBA(title: "-"),
                        SizedBox(height: 10.h),
                        const NilaiTextBA(title: "-"),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(height: 12.h),
              Divider(
                color: Colors.grey.shade200,
                thickness: 1,
              ),
              SizedBox(height: 12.h),
              Text(
                "Penilaian Pembimbing",
                style: poppins.copyWith(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 20.h),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Penilaian Pembimbing",
                          style: poppins.copyWith(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: 15.h),
                        const DetailTextBA(title: "Penguasaan Dasar Teori"),
                        SizedBox(height: 10.h),
                        const DetailTextBA(title: "Tingkat Penguasaan Materi"),
                        SizedBox(height: 10.h),
                        const DetailTextBA(title: "Tinjauan Pustaka"),
                        SizedBox(height: 10.h),
                        const DetailTextBA(title: "Tata Tulis"),
                        SizedBox(height: 10.h),
                        const DetailTextBA(title: "Hasil dan Pembahasan"),
                        SizedBox(height: 10.h),
                        const DetailTextBA(title: "Sikap dan Kepribadian"),
                        SizedBox(height: 10.h),
                        const DetailTextBA(title: "Total Nilai Pembimbing"),
                        SizedBox(height: 10.h),
                        const DetailTextBA(title: "Nilai Huruf Pembimbing"),
                        SizedBox(height: 10.h),
                        const DetailTextBA(title: "Rata-rata Nilai Pembimbing"),
                      ],
                    ),
                    SizedBox(width: 10.w),
                    Column(
                      children: [
                        Text(
                          "B",
                          style: poppins.copyWith(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: 15.h),
                        const DetailTextBA(title: "10"),
                        SizedBox(height: 10.h),
                        const DetailTextBA(title: "10"),
                        SizedBox(height: 10.h),
                        const DetailTextBA(title: "9"),
                        SizedBox(height: 10.h),
                        const DetailTextBA(title: "8"),
                        SizedBox(height: 10.h),
                        const DetailTextBA(title: "10"),
                        SizedBox(height: 10.h),
                        const DetailTextBA(title: "8"),
                        SizedBox(height: 10.h),
                        const DetailTextBA(title: "55"),
                        SizedBox(height: 10.h),
                        const DetailTextBA(title: ""),
                        SizedBox(height: 10.h),
                        const DetailTextBA(title: ""),
                      ],
                    ),
                    SizedBox(width: 10.w),
                    Column(
                      children: [
                        Text(
                          "Pembimbing 1",
                          style: poppins.copyWith(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: 15.h),
                        const NilaiTextBA(title: "-"),
                        SizedBox(height: 10.h),
                        const NilaiTextBA(title: "-"),
                        SizedBox(height: 10.h),
                        const NilaiTextBA(title: "-"),
                        SizedBox(height: 10.h),
                        const NilaiTextBA(title: "-"),
                        SizedBox(height: 10.h),
                        const NilaiTextBA(title: "-"),
                        SizedBox(height: 10.h),
                        const NilaiTextBA(title: "-"),
                        SizedBox(height: 10.h),
                        const NilaiTextBA(title: "-"),
                        SizedBox(height: 10.h),
                        const NilaiTextBA(title: "-"),
                        SizedBox(height: 10.h),
                        const NilaiTextBA(title: "-"),
                      ],
                    ),
                    SizedBox(width: 10.w),
                    Column(
                      children: [
                        Text(
                          "Pembimbing 2",
                          style: poppins.copyWith(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: 15.h),
                        const NilaiTextBA(title: "-"),
                        SizedBox(height: 10.h),
                        const NilaiTextBA(title: "-"),
                        SizedBox(height: 10.h),
                        const NilaiTextBA(title: "-"),
                        SizedBox(height: 10.h),
                        const NilaiTextBA(title: "-"),
                        SizedBox(height: 10.h),
                        const NilaiTextBA(title: "-"),
                        SizedBox(height: 10.h),
                        const NilaiTextBA(title: "-"),
                        SizedBox(height: 10.h),
                        const NilaiTextBA(title: "-"),
                        SizedBox(height: 10.h),
                        const NilaiTextBA(title: "-"),
                        SizedBox(height: 10.h),
                        const NilaiTextBA(title: "-"),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(height: 12.h),
              Divider(
                color: Colors.grey.shade200,
                thickness: 1,
              ),
              SizedBox(height: 12.h),
              Text(
                "Penilaian Akhir",
                style: poppins.copyWith(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 20.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Nilai",
                        style: poppins.copyWith(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 15.h),
                      const DetailTextBA(title: "Nilai Akhir"),
                      SizedBox(height: 10.h),
                      const DetailTextBA(title: "Nilai Huruf"),
                      SizedBox(height: 10.h),
                      const DetailTextBA(title: "Keterangan"),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        "Total Nilai",
                        style: poppins.copyWith(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      const NilaiTextBA(title: "-"),
                      SizedBox(height: 10.h),
                      const NilaiTextBA(title: "-"),
                      SizedBox(height: 10.h),
                      const NilaiTextBA(title: "-"),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 12.h),
              Divider(
                color: Colors.grey.shade200,
                thickness: 1,
              ),
              SizedBox(height: 12.h),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     Text(
              //       "TOTAL AKHIR",
              //       style: poppins.copyWith(
              //         fontSize: 16.sp,
              //         fontWeight: FontWeight.w600,
              //       ),
              //     ),
              //     Text(
              //       "90",
              //       style: poppins.copyWith(
              //         fontSize: 24.sp,
              //         fontWeight: FontWeight.w600,
              //         color: redColor,
              //       ),
              //     ),
              //   ],
              // ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
          width: double.infinity,
          height: 44.h,
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.r),
              ),
            ),
            child: Text(
              "Selesaikan Seminar",
              style: poppins.copyWith(
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class NilaiTextBA extends StatelessWidget {
  final String? title;
  const NilaiTextBA({
    super.key,
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title!,
      style: poppins.copyWith(
        fontSize: 12.sp,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}

class DetailTextBA extends StatelessWidget {
  final String? title;
  const DetailTextBA({
    super.key,
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title!,
      style: poppins.copyWith(
        fontSize: 12.sp,
        fontWeight: FontWeight.w600,
        color: textChangePassword,
      ),
    );
  }
}
