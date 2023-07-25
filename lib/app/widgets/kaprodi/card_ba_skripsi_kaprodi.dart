import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:siajte_app/app/modules/penialian_pemb_skipsi/controllers/penialian_pemb_skipsi_controller.dart';
import 'package:siajte_app/app/modules/penilaian_peng_skripsi/controllers/penilaian_peng_skripsi_controller.dart';
import 'package:siajte_app/app/routes/app_pages.dart';
import 'package:siajte_app/app/theme/colors.dart';
import 'package:siajte_app/app/theme/style.dart';

class CardBASkripsiKaprodi extends StatelessWidget {
  const CardBASkripsiKaprodi({super.key});

  @override
  Widget build(BuildContext context) {
    PenialianPembSkipsiController penilaianPembController =
        Get.put(PenialianPembSkipsiController());
    PenilaianPengSkripsiController penilaianPengController =
        Get.put(PenilaianPengSkripsiController());

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
                    FutureBuilder(
                      future: penilaianPengController.getPenilaianSkripsiPeng(
                          penilaianPengController.jadwalSkripsi.pengujisatuNip
                              .toString()),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }

                        if (snapshot.hasError) {
                          return Center(
                            child: Text(snapshot.error.toString()),
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
                            SizedBox(height: 15.h),
                            NilaiTextBA(
                                title: penilaianPengController
                                            .existPenilaianSkripsiPeng
                                            .presentasi !=
                                        null
                                    ? penilaianPengController
                                        .existPenilaianSkripsiPeng.presentasi
                                        .toString()
                                    : "-"),
                            SizedBox(height: 10.h),
                            NilaiTextBA(
                                title: penilaianPengController
                                        .existPenilaianSkripsiPeng
                                        .tingkatPenguasaanMateri
                                        .toString() ??
                                    "-"),
                            SizedBox(height: 10.h),
                            NilaiTextBA(
                                title: penilaianPengController
                                        .existPenilaianSkripsiPeng.keaslian
                                        .toString() ??
                                    "-"),
                            SizedBox(height: 10.h),
                            NilaiTextBA(
                                title: penilaianPengController
                                        .existPenilaianSkripsiPeng
                                        .ketepatanMetodologi
                                        .toString() ??
                                    "-"),
                            SizedBox(height: 10.h),
                            NilaiTextBA(
                                title: penilaianPengController
                                        .existPenilaianSkripsiPeng
                                        .penguasaanDasarTeori
                                        .toString() ??
                                    "-"),
                            SizedBox(height: 10.h),
                            NilaiTextBA(
                                title: penilaianPengController
                                        .existPenilaianSkripsiPeng
                                        .kecermatanPerumusanMasalah
                                        .toString() ??
                                    "-"),
                            SizedBox(height: 10.h),
                            NilaiTextBA(
                                title: penilaianPengController
                                        .existPenilaianSkripsiPeng
                                        .tinjauanPustaka
                                        .toString() ??
                                    "-"),
                            SizedBox(height: 10.h),
                            NilaiTextBA(
                                title: penilaianPengController
                                        .existPenilaianSkripsiPeng.tataTulis
                                        .toString() ??
                                    "-"),
                            SizedBox(height: 10.h),
                            NilaiTextBA(
                                title: penilaianPengController
                                        .existPenilaianSkripsiPeng.tools
                                        .toString() ??
                                    "-"),
                            SizedBox(height: 10.h),
                            NilaiTextBA(
                                title: penilaianPengController
                                        .existPenilaianSkripsiPeng.penyajianData
                                        .toString() ??
                                    "-"),
                            SizedBox(height: 10.h),
                            NilaiTextBA(
                                title: penilaianPengController
                                        .existPenilaianSkripsiPeng.hasil
                                        .toString() ??
                                    "-"),
                            SizedBox(height: 10.h),
                            NilaiTextBA(
                                title: penilaianPengController
                                        .existPenilaianSkripsiPeng.pembahasan
                                        .toString() ??
                                    "-"),
                            SizedBox(height: 10.h),
                            NilaiTextBA(
                                title: penilaianPengController
                                        .existPenilaianSkripsiPeng.kesimpulan
                                        .toString() ??
                                    "-"),
                            SizedBox(height: 10.h),
                            NilaiTextBA(
                                title: penilaianPengController
                                        .existPenilaianSkripsiPeng.luaran
                                        .toString() ??
                                    "-"),
                            SizedBox(height: 10.h),
                            NilaiTextBA(
                                title: penilaianPengController
                                        .existPenilaianSkripsiPeng
                                        .sumbanganPemikiran
                                        .toString() ??
                                    "-"),
                            SizedBox(height: 10.h),
                            NilaiTextBA(
                                title: penilaianPengController.totalNilai.value
                                        .ceil()
                                        .toString() ??
                                    "-"),
                            SizedBox(height: 10.h),
                            NilaiTextBA(
                                title:
                                    penilaianPengController.nilaiHuruf.value ??
                                        "-"),
                            SizedBox(height: 10.h),
                            NilaiTextBA(
                                title:
                                    (penilaianPengController.totalNilai.value /
                                                15)
                                            .ceil()
                                            .toString() ??
                                        "-"),
                          ],
                        );
                      },
                    ),
                    SizedBox(width: 10.w),
                    FutureBuilder(
                        future: penilaianPengController.getPenilaianSkripsiPeng(
                            penilaianPengController.jadwalSkripsi.pengujiduaNip
                                .toString()),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }

                          if (snapshot.hasError) {
                            return Center(
                              child: Text(snapshot.error.toString()),
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
                              SizedBox(height: 15.h),
                              NilaiTextBA(
                                  title: penilaianPengController
                                              .existPenilaianSkripsiPeng
                                              .presentasi !=
                                          null
                                      ? penilaianPengController
                                          .existPenilaianSkripsiPeng.presentasi
                                          .toString()
                                      : "-"),
                              SizedBox(height: 10.h),
                              NilaiTextBA(
                                  title: penilaianPengController
                                              .existPenilaianSkripsiPeng
                                              .tingkatPenguasaanMateri !=
                                          null
                                      ? penilaianPengController
                                          .existPenilaianSkripsiPeng
                                          .tingkatPenguasaanMateri
                                          .toString()
                                      : "-"),
                              SizedBox(height: 10.h),
                              NilaiTextBA(
                                  title: penilaianPengController
                                              .existPenilaianSkripsiPeng
                                              .keaslian !=
                                          null
                                      ? penilaianPengController
                                          .existPenilaianSkripsiPeng.keaslian
                                          .toString()
                                      : "-"),
                              SizedBox(height: 10.h),
                              NilaiTextBA(
                                  title: penilaianPengController
                                              .existPenilaianSkripsiPeng
                                              .ketepatanMetodologi !=
                                          null
                                      ? penilaianPengController
                                          .existPenilaianSkripsiPeng
                                          .ketepatanMetodologi
                                          .toString()
                                      : "-"),
                              SizedBox(height: 10.h),
                              NilaiTextBA(
                                  title: penilaianPengController
                                              .existPenilaianSkripsiPeng
                                              .penguasaanDasarTeori !=
                                          null
                                      ? penilaianPengController
                                          .existPenilaianSkripsiPeng
                                          .penguasaanDasarTeori
                                          .toString()
                                      : "-"),
                              SizedBox(height: 10.h),
                              NilaiTextBA(
                                  title: penilaianPengController
                                              .existPenilaianSkripsiPeng
                                              .kecermatanPerumusanMasalah !=
                                          null
                                      ? penilaianPengController
                                          .existPenilaianSkripsiPeng
                                          .kecermatanPerumusanMasalah
                                          .toString()
                                      : "-"),
                              SizedBox(height: 10.h),
                              NilaiTextBA(
                                  title: penilaianPengController
                                              .existPenilaianSkripsiPeng
                                              .tinjauanPustaka !=
                                          null
                                      ? penilaianPengController
                                          .existPenilaianSkripsiPeng
                                          .tinjauanPustaka
                                          .toString()
                                      : "-"),
                              SizedBox(height: 10.h),
                              NilaiTextBA(
                                  title: penilaianPengController
                                              .existPenilaianSkripsiPeng
                                              .tataTulis !=
                                          null
                                      ? penilaianPengController
                                          .existPenilaianSkripsiPeng.tataTulis
                                          .toString()
                                      : "-"),
                              SizedBox(height: 10.h),
                              NilaiTextBA(
                                  title: penilaianPengController
                                              .existPenilaianSkripsiPeng
                                              .tools !=
                                          null
                                      ? penilaianPengController
                                          .existPenilaianSkripsiPeng.tools
                                          .toString()
                                      : "-"),
                              SizedBox(height: 10.h),
                              NilaiTextBA(
                                  title: penilaianPengController
                                              .existPenilaianSkripsiPeng
                                              .penyajianData !=
                                          null
                                      ? penilaianPengController
                                          .existPenilaianSkripsiPeng
                                          .penyajianData
                                          .toString()
                                      : "-"),
                              SizedBox(height: 10.h),
                              NilaiTextBA(
                                  title: penilaianPengController
                                              .existPenilaianSkripsiPeng
                                              .hasil !=
                                          null
                                      ? penilaianPengController
                                          .existPenilaianSkripsiPeng.hasil
                                          .toString()
                                      : "-"),
                              SizedBox(height: 10.h),
                              NilaiTextBA(
                                  title: penilaianPengController
                                              .existPenilaianSkripsiPeng
                                              .pembahasan !=
                                          null
                                      ? penilaianPengController
                                          .existPenilaianSkripsiPeng.pembahasan
                                          .toString()
                                      : "-"),
                              SizedBox(height: 10.h),
                              NilaiTextBA(
                                  title: penilaianPengController
                                              .existPenilaianSkripsiPeng
                                              .kesimpulan !=
                                          null
                                      ? penilaianPengController
                                          .existPenilaianSkripsiPeng.kesimpulan
                                          .toString()
                                      : "-"),
                              SizedBox(height: 10.h),
                              NilaiTextBA(
                                  title: penilaianPengController
                                              .existPenilaianSkripsiPeng
                                              .luaran !=
                                          null
                                      ? penilaianPengController
                                          .existPenilaianSkripsiPeng.luaran
                                          .toString()
                                      : "-"),
                              SizedBox(height: 10.h),
                              NilaiTextBA(
                                  title: penilaianPengController
                                              .existPenilaianSkripsiPeng
                                              .sumbanganPemikiran !=
                                          null
                                      ? penilaianPengController
                                          .existPenilaianSkripsiPeng
                                          .sumbanganPemikiran
                                          .toString()
                                      : "-"),
                              SizedBox(height: 10.h),
                              NilaiTextBA(
                                  title: penilaianPengController
                                          .totalNilai.value
                                          .ceil()
                                          .toString() ??
                                      "-"),
                              SizedBox(height: 10.h),
                              NilaiTextBA(
                                  title: penilaianPengController
                                          .nilaiHuruf.value ??
                                      "-"),
                              SizedBox(height: 10.h),
                              NilaiTextBA(
                                  title: (penilaianPengController
                                                  .totalNilai.value /
                                              15)
                                          .ceil()
                                          .toString() ??
                                      "-"),
                            ],
                          );
                        }),
                    SizedBox(width: 10.w),
                    penilaianPengController.jadwalSkripsi.pengujitigaNip == null
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
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
                        : FutureBuilder(
                            future: penilaianPengController
                                .getPenilaianSkripsiPeng(penilaianPengController
                                    .jadwalSkripsi.pengujitigaNip
                                    .toString()),
                            builder: (context, snapshot) {
                              return Column(
                                children: [
                                  Text(
                                    "Penguji 3",
                                    style: poppins.copyWith(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  SizedBox(height: 15.h),
                                  NilaiTextBA(
                                      title: penilaianPengController
                                                  .existPenilaianSkripsiPeng
                                                  .presentasi !=
                                              null
                                          ? penilaianPengController
                                              .existPenilaianSkripsiPeng
                                              .presentasi
                                              .toString()
                                          : "-"),
                                  SizedBox(height: 10.h),
                                  NilaiTextBA(
                                      title: penilaianPengController
                                                  .existPenilaianSkripsiPeng
                                                  .tingkatPenguasaanMateri !=
                                              null
                                          ? penilaianPengController
                                              .existPenilaianSkripsiPeng
                                              .tingkatPenguasaanMateri
                                              .toString()
                                          : "-"),
                                  SizedBox(height: 10.h),
                                  NilaiTextBA(
                                      title: penilaianPengController
                                                  .existPenilaianSkripsiPeng
                                                  .keaslian !=
                                              null
                                          ? penilaianPengController
                                              .existPenilaianSkripsiPeng
                                              .keaslian
                                              .toString()
                                          : "-"),
                                  SizedBox(height: 10.h),
                                  NilaiTextBA(
                                      title: penilaianPengController
                                                  .existPenilaianSkripsiPeng
                                                  .ketepatanMetodologi !=
                                              null
                                          ? penilaianPengController
                                              .existPenilaianSkripsiPeng
                                              .ketepatanMetodologi
                                              .toString()
                                          : "-"),
                                  SizedBox(height: 10.h),
                                  NilaiTextBA(
                                      title: penilaianPengController
                                                  .existPenilaianSkripsiPeng
                                                  .penguasaanDasarTeori !=
                                              null
                                          ? penilaianPengController
                                              .existPenilaianSkripsiPeng
                                              .penguasaanDasarTeori
                                              .toString()
                                          : "-"),
                                  SizedBox(height: 10.h),
                                  NilaiTextBA(
                                      title: penilaianPengController
                                                  .existPenilaianSkripsiPeng
                                                  .kecermatanPerumusanMasalah !=
                                              null
                                          ? penilaianPengController
                                              .existPenilaianSkripsiPeng
                                              .kecermatanPerumusanMasalah
                                              .toString()
                                          : "-"),
                                  SizedBox(height: 10.h),
                                  NilaiTextBA(
                                      title: penilaianPengController
                                                  .existPenilaianSkripsiPeng
                                                  .tinjauanPustaka !=
                                              null
                                          ? penilaianPengController
                                              .existPenilaianSkripsiPeng
                                              .tinjauanPustaka
                                              .toString()
                                          : "-"),
                                  SizedBox(height: 10.h),
                                  NilaiTextBA(
                                      title: penilaianPengController
                                                  .existPenilaianSkripsiPeng
                                                  .tataTulis !=
                                              null
                                          ? penilaianPengController
                                              .existPenilaianSkripsiPeng
                                              .tataTulis
                                              .toString()
                                          : "-"),
                                  SizedBox(height: 10.h),
                                  NilaiTextBA(
                                      title: penilaianPengController
                                                  .existPenilaianSkripsiPeng
                                                  .tools !=
                                              null
                                          ? penilaianPengController
                                              .existPenilaianSkripsiPeng.tools
                                              .toString()
                                          : "-"),
                                  SizedBox(height: 10.h),
                                  NilaiTextBA(
                                      title: penilaianPengController
                                                  .existPenilaianSkripsiPeng
                                                  .penyajianData !=
                                              null
                                          ? penilaianPengController
                                              .existPenilaianSkripsiPeng
                                              .penyajianData
                                              .toString()
                                          : "-"),
                                  SizedBox(height: 10.h),
                                  NilaiTextBA(
                                      title: penilaianPengController
                                                  .existPenilaianSkripsiPeng
                                                  .hasil !=
                                              null
                                          ? penilaianPengController
                                              .existPenilaianSkripsiPeng.hasil
                                              .toString()
                                          : "-"),
                                  SizedBox(height: 10.h),
                                  NilaiTextBA(
                                      title: penilaianPengController
                                                  .existPenilaianSkripsiPeng
                                                  .pembahasan !=
                                              null
                                          ? penilaianPengController
                                              .existPenilaianSkripsiPeng
                                              .pembahasan
                                              .toString()
                                          : "-"),
                                  SizedBox(height: 10.h),
                                  NilaiTextBA(
                                      title: penilaianPengController
                                                  .existPenilaianSkripsiPeng
                                                  .kesimpulan !=
                                              null
                                          ? penilaianPengController
                                              .existPenilaianSkripsiPeng
                                              .kesimpulan
                                              .toString()
                                          : "-"),
                                  SizedBox(height: 10.h),
                                  NilaiTextBA(
                                      title: penilaianPengController
                                                  .existPenilaianSkripsiPeng
                                                  .luaran !=
                                              null
                                          ? penilaianPengController
                                              .existPenilaianSkripsiPeng.luaran
                                              .toString()
                                          : "-"),
                                  SizedBox(height: 10.h),
                                  NilaiTextBA(
                                      title: penilaianPengController
                                                  .existPenilaianSkripsiPeng
                                                  .sumbanganPemikiran !=
                                              null
                                          ? penilaianPengController
                                              .existPenilaianSkripsiPeng
                                              .sumbanganPemikiran
                                              .toString()
                                          : "-"),
                                  SizedBox(height: 10.h),
                                  NilaiTextBA(
                                      title: penilaianPengController
                                              .totalNilai.value
                                              .ceil()
                                              .toString() ??
                                          "-"),
                                  SizedBox(height: 10.h),
                                  NilaiTextBA(
                                      title: penilaianPengController
                                              .nilaiHuruf.value ??
                                          "-"),
                                  SizedBox(height: 10.h),
                                  NilaiTextBA(
                                      title: (penilaianPengController
                                                      .totalNilai.value /
                                                  15)
                                              .ceil()
                                              .toString() ??
                                          "-"),
                                ],
                              );
                            },
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
                    FutureBuilder(
                      future: penilaianPembController.getPenilaianSkripsi(
                          penilaianPembController
                              .penjadwalanSkripsi.pembimbingsatuNip
                              .toString()),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }

                        if (snapshot.hasError) {
                          return Center(
                            child: Text(
                              'Error: ${snapshot.error}',
                              style: poppins,
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
                                title: penilaianPembController
                                            .existPenilaianSkripsiPemb
                                            .penguasaanDasarTeori !=
                                        null
                                    ? penilaianPembController
                                        .existPenilaianSkripsiPemb
                                        .penguasaanDasarTeori
                                        .toString()
                                    : "-"),
                            SizedBox(height: 10.h),
                            NilaiTextBA(
                                title: penilaianPembController
                                            .existPenilaianSkripsiPemb
                                            .tingkatPenguasaanMateri !=
                                        null
                                    ? penilaianPembController
                                        .existPenilaianSkripsiPemb
                                        .tingkatPenguasaanMateri
                                        .toString()
                                    : "-"),
                            SizedBox(height: 10.h),
                            NilaiTextBA(
                                title: penilaianPembController
                                            .existPenilaianSkripsiPemb
                                            .tinjauanPustaka !=
                                        null
                                    ? penilaianPembController
                                        .existPenilaianSkripsiPemb
                                        .tinjauanPustaka
                                        .toString()
                                    : "-"),
                            SizedBox(height: 10.h),
                            NilaiTextBA(
                                title: penilaianPembController
                                            .existPenilaianSkripsiPemb
                                            .tataTulis !=
                                        null
                                    ? penilaianPembController
                                        .existPenilaianSkripsiPemb.tataTulis
                                        .toString()
                                    : "-"),
                            SizedBox(height: 10.h),
                            NilaiTextBA(
                                title: penilaianPembController
                                            .existPenilaianSkripsiPemb
                                            .hasilDanPembahasan !=
                                        null
                                    ? penilaianPembController
                                        .existPenilaianSkripsiPemb
                                        .hasilDanPembahasan
                                        .toString()
                                    : "-"),
                            SizedBox(height: 10.h),
                            NilaiTextBA(
                                title: penilaianPembController
                                            .existPenilaianSkripsiPemb
                                            .sikapDanKepribadian !=
                                        null
                                    ? penilaianPembController
                                        .existPenilaianSkripsiPemb
                                        .sikapDanKepribadian
                                        .toString()
                                    : "-"),
                            SizedBox(height: 10.h),
                            NilaiTextBA(
                                title: penilaianPembController.totalNilai.value
                                        .ceil()
                                        .toString() ??
                                    "-"),
                            SizedBox(height: 10.h),
                            NilaiTextBA(
                                title: penilaianPembController.nilaiHuruf.value
                                        .toString() ??
                                    "-"),
                            SizedBox(height: 10.h),
                            NilaiTextBA(
                                title:
                                    (penilaianPembController.totalNilai.value /
                                                6)
                                            .ceil()
                                            .toString() ??
                                        "-"),
                          ],
                        );
                      },
                    ),
                    SizedBox(width: 10.w),
                    FutureBuilder(
                      future: penilaianPembController.getPenilaianSkripsi(
                          penilaianPembController
                              .penjadwalanSkripsi.pembimbingduaNip
                              .toString()),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }

                        if (snapshot.hasError) {
                          return const SizedBox();
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
                                title: penilaianPembController
                                            .existPenilaianSkripsiPemb
                                            .penguasaanDasarTeori !=
                                        null
                                    ? penilaianPembController
                                        .existPenilaianSkripsiPemb
                                        .penguasaanDasarTeori
                                        .toString()
                                    : "-"),
                            SizedBox(height: 10.h),
                            NilaiTextBA(
                                title: penilaianPembController
                                            .existPenilaianSkripsiPemb
                                            .tingkatPenguasaanMateri !=
                                        null
                                    ? penilaianPembController
                                        .existPenilaianSkripsiPemb
                                        .tingkatPenguasaanMateri
                                        .toString()
                                    : "-"),
                            SizedBox(height: 10.h),
                            NilaiTextBA(
                                title: penilaianPembController
                                            .existPenilaianSkripsiPemb
                                            .tinjauanPustaka !=
                                        null
                                    ? penilaianPembController
                                        .existPenilaianSkripsiPemb
                                        .tinjauanPustaka
                                        .toString()
                                    : "-"),
                            SizedBox(height: 10.h),
                            NilaiTextBA(
                                title: penilaianPembController
                                            .existPenilaianSkripsiPemb
                                            .tataTulis !=
                                        null
                                    ? penilaianPembController
                                        .existPenilaianSkripsiPemb.tataTulis
                                        .toString()
                                    : "-"),
                            SizedBox(height: 10.h),
                            NilaiTextBA(
                                title: penilaianPembController
                                            .existPenilaianSkripsiPemb
                                            .hasilDanPembahasan !=
                                        null
                                    ? penilaianPembController
                                        .existPenilaianSkripsiPemb
                                        .hasilDanPembahasan
                                        .toString()
                                    : "-"),
                            SizedBox(height: 10.h),
                            NilaiTextBA(
                                title: penilaianPembController
                                            .existPenilaianSkripsiPemb
                                            .sikapDanKepribadian !=
                                        null
                                    ? penilaianPembController
                                        .existPenilaianSkripsiPemb
                                        .sikapDanKepribadian
                                        .toString()
                                    : "-"),
                            SizedBox(height: 10.h),
                            NilaiTextBA(
                                title: penilaianPembController.totalNilai.value
                                        .ceil()
                                        .toString() ??
                                    "-"),
                            SizedBox(height: 10.h),
                            NilaiTextBA(
                                title: penilaianPembController.nilaiHuruf.value
                                        .toString() ??
                                    "-"),
                            SizedBox(height: 10.h),
                            NilaiTextBA(
                                title:
                                    (penilaianPembController.totalNilai.value /
                                                6)
                                            .ceil()
                                            .toString() ??
                                        "-"),
                          ],
                        );
                      },
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
                  FutureBuilder(
                    future: penilaianPengController.getBeritaAcara(),
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
                              title: penilaianPengController.baNilaiAkhir.value
                                      .toString() ??
                                  "-"),
                          SizedBox(height: 10.h),
                          NilaiTextBA(
                              title: penilaianPengController.baNilaiHuruf.value
                                      .toString() ??
                                  "-"),
                          SizedBox(height: 10.h),
                          NilaiTextBA(
                              title: penilaianPengController.baKeterangan.value
                                      .toString() ??
                                  "-"),
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
                        penilaianPengController.setujuiKaprodi(
                            penilaianPengController.jadwalSkripsi.id);
                        Get.offAllNamed(Routes.HOME);
                        Get.forceAppUpdate();
                      },
                      child: Text(
                        "Setujui",
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
              "Setujui Kaprodi",
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
