import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:siajte_app/app/modules/home/views/home_view.dart';
import 'package:siajte_app/app/modules/penilaian_pemb_proposal/controllers/penilaian_pemb_proposal_controller.dart';
import 'package:siajte_app/app/modules/penilaian_peng_proposal/controllers/penilaian_peng_proposal_controller.dart';
import 'package:siajte_app/app/theme/colors.dart';
import 'package:siajte_app/app/theme/style.dart';

class CardBASempro extends StatelessWidget {
  const CardBASempro({super.key});

  @override
  Widget build(BuildContext context) {
    PenilaianPembProposalController pembProposalController =
        Get.put(PenilaianPembProposalController());
    PenilaianPengProposalController pengProposalController =
        Get.put(PenilaianPengProposalController());

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
                        const DetailTextBA(title: "5"),
                        SizedBox(height: 10.h),
                        const DetailTextBA(title: "8"),
                        SizedBox(height: 10.h),
                        const DetailTextBA(title: "5"),
                        SizedBox(height: 10.h),
                        const DetailTextBA(title: "7"),
                        SizedBox(height: 10.h),
                        const DetailTextBA(title: "6"),
                        SizedBox(height: 10.h),
                        const DetailTextBA(title: "6"),
                        SizedBox(height: 10.h),
                        const DetailTextBA(title: "7"),
                        SizedBox(height: 10.h),
                        const DetailTextBA(title: "5"),
                        SizedBox(height: 10.h),
                        const DetailTextBA(title: "6"),
                        SizedBox(height: 10.h),
                        const DetailTextBA(title: "55"),
                        SizedBox(height: 10.h),
                        const DetailTextBA(title: ""),
                        SizedBox(height: 10.h),
                        const DetailTextBA(title: ""),
                      ],
                    ),
                    SizedBox(width: 10.w),
                    FutureBuilder(
                        future: pengProposalController.getPenilaianKPPeng(
                            pengProposalController
                                .penjadwalanSempro.pengujisatuNip
                                .toString()),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }

                          if (snapshot.hasError) {
                            return ElevatedButton(
                              onPressed: () {
                                Get.forceAppUpdate();
                              },
                              child: Column(
                                children: [
                                  const Text("Refresh"),
                                  SizedBox(height: 10.h),
                                  const Icon(Icons.refresh),
                                ],
                              ),
                            );
                          }

                          return Column(
                            children: [
                              Text(
                                "Penguji 1",
                                style: poppins.copyWith(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(
                                height: 15.h,
                              ),
                              NilaiTextBA(
                                  title: pengProposalController
                                          .existPenilaianSemproPeng
                                          .presentasi ??
                                      "-"),
                              SizedBox(height: 10.h),
                              NilaiTextBA(
                                  title: pengProposalController
                                          .existPenilaianSemproPeng
                                          .tingkatPenguasaanMateri ??
                                      "-"),
                              SizedBox(height: 10.h),
                              NilaiTextBA(
                                  title: pengProposalController
                                          .existPenilaianSemproPeng.keaslian ??
                                      "-"),
                              SizedBox(height: 10.h),
                              NilaiTextBA(
                                  title: pengProposalController
                                          .existPenilaianSemproPeng
                                          .ketepatanMetodologi ??
                                      "-"),
                              SizedBox(height: 10.h),
                              NilaiTextBA(
                                  title: pengProposalController
                                          .existPenilaianSemproPeng
                                          .penguasaanDasarTeori ??
                                      "-"),
                              SizedBox(height: 10.h),
                              NilaiTextBA(
                                  title: pengProposalController
                                          .existPenilaianSemproPeng
                                          .kecermatanPerumusanMasalah ??
                                      "-"),
                              SizedBox(height: 10.h),
                              NilaiTextBA(
                                  title: pengProposalController
                                          .existPenilaianSemproPeng
                                          .tinjauanPustaka ??
                                      "-"),
                              SizedBox(height: 10.h),
                              NilaiTextBA(
                                  title: pengProposalController
                                          .existPenilaianSemproPeng.tataTulis ??
                                      "-"),
                              SizedBox(height: 10.h),
                              NilaiTextBA(
                                  title: pengProposalController
                                          .existPenilaianSemproPeng
                                          .sumbanganPemikiran ??
                                      "-"),
                              SizedBox(height: 10.h),
                              NilaiTextBA(
                                  title: pengProposalController.totalNilai
                                          .toString() ??
                                      "-"),
                              SizedBox(height: 10.h),
                              NilaiTextBA(
                                  title: pengProposalController.nilaiHuruf
                                          .toString() ??
                                      "-"),
                              SizedBox(height: 10.h),
                              NilaiTextBA(
                                  title: (pengProposalController.totalNilai / 9)
                                          .ceil()
                                          .toString() ??
                                      "-"),
                            ],
                          );
                        }),
                    SizedBox(width: 10.w),
                    FutureBuilder(
                        future: pengProposalController.getPenilaianKPPeng(
                            pengProposalController
                                .penjadwalanSempro.pengujiduaNip
                                .toString()),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }

                          if (snapshot.hasError) {
                            return ElevatedButton(
                              onPressed: () {
                                Get.forceAppUpdate();
                              },
                              child: Column(
                                children: [
                                  const Text("Refresh"),
                                  SizedBox(height: 10.h),
                                  const Icon(Icons.refresh),
                                ],
                              ),
                            );
                          }

                          return Column(
                            children: [
                              Text(
                                "Penguji 2",
                                style: poppins.copyWith(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(
                                height: 15.h,
                              ),
                              NilaiTextBA(
                                  title: pengProposalController
                                          .existPenilaianSemproPeng
                                          .presentasi ??
                                      "-"),
                              SizedBox(height: 10.h),
                              NilaiTextBA(
                                  title: pengProposalController
                                          .existPenilaianSemproPeng
                                          .tingkatPenguasaanMateri ??
                                      "-"),
                              SizedBox(height: 10.h),
                              NilaiTextBA(
                                  title: pengProposalController
                                          .existPenilaianSemproPeng.keaslian ??
                                      "-"),
                              SizedBox(height: 10.h),
                              NilaiTextBA(
                                  title: pengProposalController
                                          .existPenilaianSemproPeng
                                          .ketepatanMetodologi ??
                                      "-"),
                              SizedBox(height: 10.h),
                              NilaiTextBA(
                                  title: pengProposalController
                                          .existPenilaianSemproPeng
                                          .penguasaanDasarTeori ??
                                      "-"),
                              SizedBox(height: 10.h),
                              NilaiTextBA(
                                  title: pengProposalController
                                          .existPenilaianSemproPeng
                                          .kecermatanPerumusanMasalah ??
                                      "-"),
                              SizedBox(height: 10.h),
                              NilaiTextBA(
                                  title: pengProposalController
                                          .existPenilaianSemproPeng
                                          .tinjauanPustaka ??
                                      "-"),
                              SizedBox(height: 10.h),
                              NilaiTextBA(
                                  title: pengProposalController
                                          .existPenilaianSemproPeng.tataTulis ??
                                      "-"),
                              SizedBox(height: 10.h),
                              NilaiTextBA(
                                  title: pengProposalController
                                          .existPenilaianSemproPeng
                                          .sumbanganPemikiran ??
                                      "-"),
                              SizedBox(height: 10.h),
                              NilaiTextBA(
                                  title: pengProposalController.totalNilai
                                          .toString() ??
                                      "-"),
                              SizedBox(height: 10.h),
                              NilaiTextBA(
                                  title: pengProposalController.nilaiHuruf
                                          .toString() ??
                                      "-"),
                              SizedBox(height: 10.h),
                              NilaiTextBA(
                                  title: (pengProposalController.totalNilai / 9)
                                          .ceil()
                                          .toString() ??
                                      "-"),
                            ],
                          );
                        }),
                    SizedBox(width: 10.w),
                    FutureBuilder(
                        future: pengProposalController.getPenilaianKPPeng(
                            pengProposalController
                                .penjadwalanSempro.pengujitigaNip
                                .toString()),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }

                          if (snapshot.hasError) {
                            return ElevatedButton(
                              onPressed: () {
                                Get.forceAppUpdate();
                              },
                              child: Column(
                                children: [
                                  const Text("Refresh"),
                                  SizedBox(height: 10.h),
                                  const Icon(Icons.refresh),
                                ],
                              ),
                            );
                          }

                          return Column(
                            children: [
                              Text(
                                "Penguji 3",
                                style: poppins.copyWith(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(
                                height: 15.h,
                              ),
                              NilaiTextBA(
                                  title: pengProposalController
                                          .existPenilaianSemproPeng
                                          .presentasi ??
                                      "-"),
                              SizedBox(height: 10.h),
                              NilaiTextBA(
                                  title: pengProposalController
                                          .existPenilaianSemproPeng
                                          .tingkatPenguasaanMateri ??
                                      "-"),
                              SizedBox(height: 10.h),
                              NilaiTextBA(
                                  title: pengProposalController
                                          .existPenilaianSemproPeng.keaslian ??
                                      "-"),
                              SizedBox(height: 10.h),
                              NilaiTextBA(
                                  title: pengProposalController
                                          .existPenilaianSemproPeng
                                          .ketepatanMetodologi ??
                                      "-"),
                              SizedBox(height: 10.h),
                              NilaiTextBA(
                                  title: pengProposalController
                                          .existPenilaianSemproPeng
                                          .penguasaanDasarTeori ??
                                      "-"),
                              SizedBox(height: 10.h),
                              NilaiTextBA(
                                  title: pengProposalController
                                          .existPenilaianSemproPeng
                                          .kecermatanPerumusanMasalah ??
                                      "-"),
                              SizedBox(height: 10.h),
                              NilaiTextBA(
                                  title: pengProposalController
                                          .existPenilaianSemproPeng
                                          .tinjauanPustaka ??
                                      "-"),
                              SizedBox(height: 10.h),
                              NilaiTextBA(
                                  title: pengProposalController
                                          .existPenilaianSemproPeng.tataTulis ??
                                      "-"),
                              SizedBox(height: 10.h),
                              NilaiTextBA(
                                  title: pengProposalController
                                          .existPenilaianSemproPeng
                                          .sumbanganPemikiran ??
                                      "-"),
                              SizedBox(height: 10.h),
                              NilaiTextBA(
                                  title: pengProposalController.totalNilai
                                          .toString() ??
                                      "-"),
                              SizedBox(height: 10.h),
                              NilaiTextBA(
                                  title: pengProposalController.nilaiHuruf
                                          .toString() ??
                                      "-"),
                              SizedBox(height: 10.h),
                              NilaiTextBA(
                                  title: (pengProposalController.totalNilai / 9)
                                          .ceil()
                                          .toString() ??
                                      "-"),
                            ],
                          );
                        }),
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
                        const DetailTextBA(title: "Sikap Kepribadian"),
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
                        const DetailTextBA(title: "9"),
                        SizedBox(height: 10.h),
                        const DetailTextBA(title: "9"),
                        SizedBox(height: 10.h),
                        const DetailTextBA(title: "9"),
                        SizedBox(height: 10.h),
                        const DetailTextBA(title: "9"),
                        SizedBox(height: 10.h),
                        const DetailTextBA(title: "9"),
                        SizedBox(height: 10.h),
                        const DetailTextBA(title: "45"),
                        SizedBox(height: 10.h),
                        const DetailTextBA(title: ""),
                        SizedBox(height: 10.h),
                        const DetailTextBA(title: ""),
                      ],
                    ),
                    SizedBox(width: 10.w),
                    FutureBuilder(
                        future: pembProposalController.getPenilaianSempro(
                            pembProposalController
                                .penjadwalanSempro.pembimbingsatuNip
                                .toString()),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }

                          if (snapshot.hasError) {
                            return ElevatedButton(
                              onPressed: () {
                                Get.forceAppUpdate();
                              },
                              child: Column(
                                children: [
                                  const Text("Refresh"),
                                  SizedBox(height: 10.h),
                                  const Icon(Icons.refresh),
                                ],
                              ),
                            );
                          }

                          return Column(
                            children: [
                              Text(
                                "Pembimbing 1",
                                style: poppins.copyWith(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(height: 15.h),
                              NilaiTextBA(
                                  title: pembProposalController
                                          .existPenilaianSemproPemb
                                          .penguasaanDasarTeori ??
                                      "-"),
                              SizedBox(height: 10.h),
                              NilaiTextBA(
                                  title: pembProposalController
                                          .existPenilaianSemproPemb
                                          .tingkatPenguasaanMateri ??
                                      "-"),
                              SizedBox(height: 10.h),
                              NilaiTextBA(
                                  title: pembProposalController
                                          .existPenilaianSemproPemb
                                          .tinjauanPustaka ??
                                      "-"),
                              SizedBox(height: 10.h),
                              NilaiTextBA(
                                  title: pembProposalController
                                          .existPenilaianSemproPemb.tataTulis ??
                                      "-"),
                              SizedBox(height: 10.h),
                              NilaiTextBA(
                                  title: pembProposalController
                                          .existPenilaianSemproPemb
                                          .sikapDanKepribadian ??
                                      "-"),
                              SizedBox(height: 10.h),
                              NilaiTextBA(
                                  title: pembProposalController.totalNilai
                                          .ceil()
                                          .toString() ??
                                      "-"),
                              SizedBox(height: 10.h),
                              NilaiTextBA(
                                  title: pembProposalController.nilaiHuruf
                                          .toString() ??
                                      "-"),
                              SizedBox(height: 10.h),
                              NilaiTextBA(
                                  title: (pembProposalController.totalNilai / 6)
                                          .ceil()
                                          .toString() ??
                                      "-"),
                            ],
                          );
                        }),
                    SizedBox(width: 10.w),
                    pembProposalController.penjadwalanSempro.pembimbingduaNip
                                .toString() !=
                            "null"
                        ? FutureBuilder(
                            future: pembProposalController.getPenilaianSempro(
                                pembProposalController
                                    .penjadwalanSempro.pembimbingduaNip
                                    .toString()),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              }

                              if (snapshot.hasError) {
                                return ElevatedButton(
                                  onPressed: () {
                                    Get.forceAppUpdate();
                                  },
                                  child: Column(
                                    children: [
                                      const Text("Refresh"),
                                      SizedBox(height: 10.h),
                                      const Icon(Icons.refresh),
                                    ],
                                  ),
                                );
                              }

                              return Column(
                                children: [
                                  Text(
                                    "Pembimbing 2",
                                    style: poppins.copyWith(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  SizedBox(height: 15.h),
                                  NilaiTextBA(
                                      title: pembProposalController
                                              .existPenilaianSemproPemb
                                              .penguasaanDasarTeori ??
                                          "-"),
                                  SizedBox(height: 10.h),
                                  NilaiTextBA(
                                      title: pembProposalController
                                              .existPenilaianSemproPemb
                                              .tingkatPenguasaanMateri ??
                                          "-"),
                                  SizedBox(height: 10.h),
                                  NilaiTextBA(
                                      title: pembProposalController
                                              .existPenilaianSemproPemb
                                              .tinjauanPustaka ??
                                          "-"),
                                  SizedBox(height: 10.h),
                                  NilaiTextBA(
                                      title: pembProposalController
                                              .existPenilaianSemproPemb
                                              .tataTulis ??
                                          "-"),
                                  SizedBox(height: 10.h),
                                  NilaiTextBA(
                                      title: pembProposalController
                                              .existPenilaianSemproPemb
                                              .sikapDanKepribadian ??
                                          "-"),
                                  SizedBox(height: 10.h),
                                  NilaiTextBA(
                                      title: pembProposalController.totalNilai
                                              .ceil()
                                              .toString() ??
                                          "-"),
                                  SizedBox(height: 10.h),
                                  NilaiTextBA(
                                      title: pembProposalController.nilaiHuruf
                                              .toString() ??
                                          "-"),
                                  SizedBox(height: 10.h),
                                  NilaiTextBA(
                                      title:
                                          (pembProposalController.totalNilai /
                                                      6)
                                                  .ceil()
                                                  .toString() ??
                                              "-"),
                                ],
                              );
                            },
                          )
                        : const SizedBox(),
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
                  FutureBuilder(
                      future: pengProposalController.getBeritaAcara(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }

                        if (snapshot.hasError) {
                          return ElevatedButton(
                            onPressed: () {
                              Get.forceAppUpdate();
                            },
                            child: Column(
                              children: [
                                const Text("Refresh"),
                                SizedBox(height: 10.h),
                                const Icon(Icons.refresh),
                              ],
                            ),
                          );
                        }

                        return Obx(
                          () => Column(
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
                                  title: pengProposalController.baNilaiAkhir
                                          .toString() ??
                                      "-"),
                              SizedBox(height: 10.h),
                              NilaiTextBA(
                                  title: pengProposalController.baNilaiHuruf
                                          .toString() ??
                                      "-"),
                              SizedBox(height: 10.h),
                              NilaiTextBA(
                                  title: pengProposalController.baKeterangan
                                          .toString() ??
                                      "-"),
                            ],
                          ),
                        );
                      }),
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
            onPressed: () {
              //TODO: Checking Lagi

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
                        pengProposalController.selesaikanSeminar(
                            pengProposalController.penjadwalanSempro.id);
                        Get.back();
                        Get.back();
                        Get.back();
                        Get.forceAppUpdate();

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
