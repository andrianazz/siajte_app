import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:siajte_app/app/modules/home/views/home_view.dart';
import 'package:siajte_app/app/modules/penilaian_pemb_kp/controllers/penilaian_pemb_kp_controller.dart';
import 'package:siajte_app/app/modules/penilaian_peng_kp/controllers/penilaian_peng_kp_controller.dart';
import 'package:siajte_app/app/theme/colors.dart';
import 'package:siajte_app/app/theme/style.dart';

class CardBAKP extends StatelessWidget {
  const CardBAKP({super.key});

  @override
  Widget build(BuildContext context) {
    PenilaianPembKpController pembimbingC =
        Get.put(PenilaianPembKpController());

    PenilaianPengKpController pengujiC = Get.put(PenilaianPengKpController());

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
              Row(
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
                      SizedBox(
                        height: 15.h,
                      ),
                      const DetailTextBA(title: "Presentasi"),
                      SizedBox(height: 10.h),
                      const DetailTextBA(title: "Materi"),
                      SizedBox(height: 10.h),
                      const DetailTextBA(title: "Tanya Jawab"),
                      SizedBox(height: 10.h),
                      const DetailTextBA(title: "Total Nilai"),
                      SizedBox(height: 10.h),
                      const DetailTextBA(title: "Nilai Huruf"),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        "B",
                        style: poppins.copyWith(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      const DetailTextBA(title: "10%"),
                      SizedBox(height: 10.h),
                      const DetailTextBA(title: "10%"),
                      SizedBox(height: 10.h),
                      const DetailTextBA(title: "30%"),
                      SizedBox(height: 10.h),
                      const DetailTextBA(title: "30%"),
                      SizedBox(height: 10.h),
                      const DetailTextBA(title: " "),
                    ],
                  ),
                  FutureBuilder(
                    future: pengujiC.penguji,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      }

                      if (snapshot.hasError) {
                        print(snapshot.error);
                        return Center(
                          child: ElevatedButton(
                              onPressed: () => Get.forceAppUpdate(),
                              child: const Column(
                                children: [
                                  Text("refresh"),
                                  Icon(Icons.refresh),
                                ],
                              )),
                        );
                      }

                      if (!snapshot.hasData) {
                        return Column(
                          children: [
                            Text(
                              "Nilai",
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
                            SizedBox(height: 10.h),
                            const NilaiTextBA(title: "-"),
                            SizedBox(height: 10.h),
                            const NilaiTextBA(title: "-"),
                          ],
                        );
                      }

                      if (snapshot.data?.totalNilaiAngka.toString() == "null") {
                        return Column(
                          children: [
                            Text(
                              "Nilai",
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
                            SizedBox(height: 10.h),
                            const NilaiTextBA(title: "-"),
                            SizedBox(height: 10.h),
                            const NilaiTextBA(title: "-"),
                          ],
                        );
                      }

                      return Column(
                        children: [
                          Text(
                            "Nilai",
                            style: poppins.copyWith(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          NilaiTextBA(
                              title: snapshot.data!.presentasi.toString()),
                          SizedBox(height: 10.h),
                          NilaiTextBA(title: snapshot.data!.materi.toString()),
                          SizedBox(height: 10.h),
                          NilaiTextBA(
                              title: snapshot.data!.tanyaJawab.toString()),
                          SizedBox(height: 10.h),
                          NilaiTextBA(
                              title: snapshot.data!.totalNilaiAngka.toString()),
                          SizedBox(height: 10.h),
                          NilaiTextBA(
                              title: snapshot.data!.totalNilaiHuruf.toString()),
                        ],
                      );
                    },
                  )
                ],
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
              Row(
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
                      SizedBox(
                        height: 15.h,
                      ),
                      const DetailTextBA(title: "Presentasi"),
                      SizedBox(height: 10.h),
                      const DetailTextBA(title: "Materi"),
                      SizedBox(height: 10.h),
                      const DetailTextBA(title: "Tanya Jawab"),
                      SizedBox(height: 10.h),
                      const DetailTextBA(title: "Total Nilai"),
                      SizedBox(height: 10.h),
                      const DetailTextBA(title: "Nilai Huruf"),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        "B",
                        style: poppins.copyWith(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      const DetailTextBA(title: "10%"),
                      SizedBox(height: 10.h),
                      const DetailTextBA(title: "10%"),
                      SizedBox(height: 10.h),
                      const DetailTextBA(title: "30%"),
                      SizedBox(height: 10.h),
                      const DetailTextBA(title: "30%"),
                      SizedBox(height: 10.h),
                      const DetailTextBA(title: " "),
                    ],
                  ),
                  FutureBuilder(
                    future: pembimbingC.pembimbing,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      }

                      if (snapshot.hasError) {
                        print(snapshot.error);
                        return Center(
                          child: ElevatedButton(
                              onPressed: () => Get.forceAppUpdate(),
                              child: const Column(
                                children: [
                                  Text("refresh"),
                                  Icon(Icons.refresh),
                                ],
                              )),
                        );
                      }

                      if (!snapshot.hasData) {
                        return Column(
                          children: [
                            Text(
                              "Nilai",
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
                            SizedBox(height: 10.h),
                            const NilaiTextBA(title: "-"),
                            SizedBox(height: 10.h),
                            const NilaiTextBA(title: "-"),
                          ],
                        );
                      }

                      if (snapshot.data?.totalNilaiAngka.toString() == "null") {
                        return Column(
                          children: [
                            Text(
                              "Nilai",
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
                            SizedBox(height: 10.h),
                            const NilaiTextBA(title: "-"),
                            SizedBox(height: 10.h),
                            const NilaiTextBA(title: "-"),
                          ],
                        );
                      }

                      return Column(
                        children: [
                          Text(
                            "Nilai",
                            style: poppins.copyWith(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          NilaiTextBA(
                              title: snapshot.data!.presentasi.toString()),
                          SizedBox(height: 10.h),
                          NilaiTextBA(title: snapshot.data!.materi.toString()),
                          SizedBox(height: 10.h),
                          NilaiTextBA(
                              title: snapshot.data!.tanyaJawab.toString()),
                          SizedBox(height: 10.h),
                          NilaiTextBA(
                              title: snapshot.data!.totalNilaiAngka.toString()),
                          SizedBox(height: 10.h),
                          NilaiTextBA(
                              title: snapshot.data!.totalNilaiHuruf.toString()),
                        ],
                      );
                    },
                  )
                ],
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
                      SizedBox(
                        height: 15.h,
                      ),
                      const DetailTextBA(title: "Nilai Seminar 30%"),
                      SizedBox(height: 10.h),
                      const DetailTextBA(title: "Nilai Pembimbing KP 30%"),
                      SizedBox(height: 10.h),
                      const DetailTextBA(
                          title: "Nilai Pembimbing Lapangan 40%"),
                    ],
                  ),
                  FutureBuilder(
                    future: pembimbingC.getBeritaAcara(),
                    builder: (context, snapshot) {
                      return Column(
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
                          NilaiTextBA(
                              title:
                                  pembimbingC.baNilaiSeminar.value.toString()),
                          SizedBox(height: 10.h),
                          NilaiTextBA(
                              title: pembimbingC.baNilaiPembimbing.value
                                  .toString()),
                          SizedBox(height: 10.h),
                          NilaiTextBA(
                              title:
                                  pembimbingC.baNilaiLapangan.value.toString()),
                        ],
                      );
                    },
                  ),
                ],
              ),
              SizedBox(height: 12.h),
              Divider(
                color: Colors.grey.shade200,
                thickness: 1,
              ),
              SizedBox(height: 12.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "TOTAL AKHIR",
                    style: poppins.copyWith(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    pembimbingC.baTotalAkhir.value.toString(),
                    style: poppins.copyWith(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w600,
                      color: redColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
          width: double.infinity,
          height: 44.h,
          child: ElevatedButton(
            onPressed: () {
              Get.dialog(
                AlertDialog(
                  title: Text(
                    "Selesaikan Seminar",
                    style: poppins.copyWith(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  content: Text(
                    "Apakah anda yakin ingin menyelesaikan seminar ini?",
                    style: poppins.copyWith(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Get.back();
                      },
                      child: Text(
                        "Batal",
                        style: poppins.copyWith(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        pembimbingC
                            .selesaikanSeminar(pembimbingC.penjadwalanKp.id);
                        Get.back();
                        Get.back();
                        Get.back();
                        // Future.delayed(const Duration(milliseconds: 500), () {
                        //   Get.forceAppUpdate();
                        // });
                        Future.delayed(const Duration(milliseconds: 500), () {
                          Get.offAll(() => const HomeView());
                        });
                      },
                      child: Text(
                        "Selesaikan",
                        style: poppins.copyWith(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          color: primaryColor,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
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
