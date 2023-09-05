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
                      future: penilaianPengController
                          .getPenilaianSkripsiPengReturn(penilaianPengController
                              .jadwalSkripsi.pengujisatuNip
                              .toString()),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
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

                        if (snapshot.data?.totalNilaiAngka.toString() ==
                            "null") {
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
                                title: snapshot.data!.presentasi.toString()),
                            SizedBox(height: 10.h),
                            NilaiTextBA(
                                title: snapshot.data!.tingkatPenguasaanMateri
                                    .toString()),
                            SizedBox(height: 10.h),
                            NilaiTextBA(
                                title: snapshot.data!.keaslian.toString()),
                            SizedBox(height: 10.h),
                            NilaiTextBA(
                                title: snapshot.data!.ketepatanMetodologi
                                    .toString()),
                            SizedBox(height: 10.h),
                            NilaiTextBA(
                                title: snapshot.data!.penguasaanDasarTeori
                                    .toString()),
                            SizedBox(height: 10.h),
                            NilaiTextBA(
                                title: snapshot.data!.kecermatanPerumusanMasalah
                                    .toString()),
                            SizedBox(height: 10.h),
                            NilaiTextBA(
                                title:
                                    snapshot.data!.tinjauanPustaka.toString()),
                            SizedBox(height: 10.h),
                            NilaiTextBA(
                                title: snapshot.data!.tataTulis.toString()),
                            SizedBox(height: 10.h),
                            NilaiTextBA(title: snapshot.data!.tools.toString()),
                            SizedBox(height: 10.h),
                            NilaiTextBA(
                                title: snapshot.data!.penyajianData.toString()),
                            SizedBox(height: 10.h),
                            NilaiTextBA(title: snapshot.data!.hasil.toString()),
                            SizedBox(height: 10.h),
                            NilaiTextBA(
                                title: snapshot.data!.pembahasan.toString()),
                            SizedBox(height: 10.h),
                            NilaiTextBA(
                                title: snapshot.data!.kesimpulan.toString()),
                            SizedBox(height: 10.h),
                            NilaiTextBA(
                                title: snapshot.data!.luaran.toString()),
                            SizedBox(height: 10.h),
                            NilaiTextBA(
                                title: snapshot.data!.sumbanganPemikiran
                                    .toString()),
                            SizedBox(height: 10.h),
                            NilaiTextBA(
                                title: snapshot.data!.totalNilaiAngka
                                    .ceil()
                                    .toString()),
                            SizedBox(height: 10.h),
                            NilaiTextBA(
                                title:
                                    snapshot.data!.totalNilaiHuruf.toString()),
                            SizedBox(height: 10.h),
                            NilaiTextBA(
                                title: (snapshot.data!.totalNilaiAngka / 15)
                                    .ceil()
                                    .toString()),
                          ],
                        );
                      },
                    ),
                    SizedBox(width: 10.w),
                    FutureBuilder(
                        future: penilaianPengController
                            .getPenilaianSkripsiPengReturn(
                                penilaianPengController
                                    .jadwalSkripsi.pengujiduaNip
                                    .toString()),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
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

                          if (snapshot.data?.totalNilaiAngka.toString() ==
                              "null") {
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
                                  title: snapshot.data!.presentasi.toString()),
                              SizedBox(height: 10.h),
                              NilaiTextBA(
                                  title: snapshot.data!.tingkatPenguasaanMateri
                                      .toString()),
                              SizedBox(height: 10.h),
                              NilaiTextBA(
                                  title: snapshot.data!.keaslian.toString()),
                              SizedBox(height: 10.h),
                              NilaiTextBA(
                                  title: snapshot.data!.ketepatanMetodologi
                                      .toString()),
                              SizedBox(height: 10.h),
                              NilaiTextBA(
                                  title: snapshot.data!.penguasaanDasarTeori
                                      .toString()),
                              SizedBox(height: 10.h),
                              NilaiTextBA(
                                  title: snapshot
                                      .data!.kecermatanPerumusanMasalah
                                      .toString()),
                              SizedBox(height: 10.h),
                              NilaiTextBA(
                                  title: snapshot.data!.tinjauanPustaka
                                      .toString()),
                              SizedBox(height: 10.h),
                              NilaiTextBA(
                                  title: snapshot.data!.tataTulis.toString()),
                              SizedBox(height: 10.h),
                              NilaiTextBA(
                                  title: snapshot.data!.tools.toString()),
                              SizedBox(height: 10.h),
                              NilaiTextBA(
                                  title:
                                      snapshot.data!.penyajianData.toString()),
                              SizedBox(height: 10.h),
                              NilaiTextBA(
                                  title: snapshot.data!.hasil.toString()),
                              SizedBox(height: 10.h),
                              NilaiTextBA(
                                  title: snapshot.data!.pembahasan.toString()),
                              SizedBox(height: 10.h),
                              NilaiTextBA(
                                  title: snapshot.data!.kesimpulan.toString()),
                              SizedBox(height: 10.h),
                              NilaiTextBA(
                                  title: snapshot.data!.luaran.toString()),
                              SizedBox(height: 10.h),
                              NilaiTextBA(
                                  title: snapshot.data!.sumbanganPemikiran
                                      .toString()),
                              SizedBox(height: 10.h),
                              NilaiTextBA(
                                  title: snapshot.data!.totalNilaiAngka
                                      .ceil()
                                      .toString()),
                              SizedBox(height: 10.h),
                              NilaiTextBA(
                                  title: snapshot.data!.totalNilaiHuruf),
                              SizedBox(height: 10.h),
                              NilaiTextBA(
                                  title: (snapshot.data!.totalNilaiAngka / 15)
                                          .ceil()
                                          .toString() ??
                                      "-"),
                            ],
                          );
                        }),
                    SizedBox(width: 10.w),
                    FutureBuilder(
                      future: penilaianPengController
                          .getPenilaianSkripsiPengReturn(penilaianPengController
                              .jadwalSkripsi.pengujitigaNip
                              .toString()),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
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

                        if (snapshot.data?.totalNilaiAngka.toString() ==
                            "null") {
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
                            SizedBox(height: 15.h),
                            NilaiTextBA(
                                title: snapshot.data!.presentasi.toString()),
                            SizedBox(height: 10.h),
                            NilaiTextBA(
                                title: snapshot.data!.tingkatPenguasaanMateri
                                    .toString()),
                            SizedBox(height: 10.h),
                            NilaiTextBA(
                                title: snapshot.data!.keaslian.toString()),
                            SizedBox(height: 10.h),
                            NilaiTextBA(
                                title: snapshot.data!.ketepatanMetodologi
                                    .toString()),
                            SizedBox(height: 10.h),
                            NilaiTextBA(
                                title: snapshot.data!.penguasaanDasarTeori
                                    .toString()),
                            SizedBox(height: 10.h),
                            NilaiTextBA(
                                title: snapshot.data!.kecermatanPerumusanMasalah
                                    .toString()),
                            SizedBox(height: 10.h),
                            NilaiTextBA(
                                title:
                                    snapshot.data!.tinjauanPustaka.toString()),
                            SizedBox(height: 10.h),
                            NilaiTextBA(
                                title: snapshot.data!.tataTulis.toString()),
                            SizedBox(height: 10.h),
                            NilaiTextBA(title: snapshot.data!.tools.toString()),
                            SizedBox(height: 10.h),
                            NilaiTextBA(
                                title: snapshot.data!.penyajianData.toString()),
                            SizedBox(height: 10.h),
                            NilaiTextBA(title: snapshot.data!.hasil.toString()),
                            SizedBox(height: 10.h),
                            NilaiTextBA(
                                title: snapshot.data!.pembahasan.toString()),
                            SizedBox(height: 10.h),
                            NilaiTextBA(
                                title: snapshot.data!.kesimpulan.toString()),
                            SizedBox(height: 10.h),
                            NilaiTextBA(
                                title: snapshot.data!.luaran.toString()),
                            SizedBox(height: 10.h),
                            NilaiTextBA(
                                title: snapshot.data!.sumbanganPemikiran
                                    .toString()),
                            SizedBox(height: 10.h),
                            NilaiTextBA(
                                title: snapshot.data!.totalNilaiAngka
                                    .ceil()
                                    .toString()),
                            SizedBox(height: 10.h),
                            NilaiTextBA(title: snapshot.data!.totalNilaiHuruf),
                            SizedBox(height: 10.h),
                            NilaiTextBA(
                                title: (snapshot.data!.totalNilaiAngka / 15)
                                    .ceil()
                                    .toString()),
                          ],
                        );
                      },
                    ),
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
                      future: penilaianPembController.getPenilaianSkripsiReturn(
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

                        if (snapshot.data?.totalNilaiAngka.toString() ==
                            "null") {
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
                              "Pembimbing 1",
                              style: poppins.copyWith(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(height: 15.h),
                            NilaiTextBA(
                                title: snapshot.data!.penguasaanDasarTeori
                                    .toString()),
                            SizedBox(height: 10.h),
                            NilaiTextBA(
                                title: snapshot.data!.tingkatPenguasaanMateri
                                    .toString()),
                            SizedBox(height: 10.h),
                            NilaiTextBA(
                                title:
                                    snapshot.data!.tinjauanPustaka.toString()),
                            SizedBox(height: 10.h),
                            NilaiTextBA(
                                title: snapshot.data!.tataTulis.toString()),
                            SizedBox(height: 10.h),
                            NilaiTextBA(
                                title: snapshot.data!.hasilDanPembahasan
                                    .toString()),
                            SizedBox(height: 10.h),
                            NilaiTextBA(
                                title: snapshot.data!.sikapDanKepribadian
                                    .toString()),
                            SizedBox(height: 10.h),
                            NilaiTextBA(
                                title: snapshot.data!.totalNilaiAngka
                                    .ceil()
                                    .toString()),
                            SizedBox(height: 10.h),
                            NilaiTextBA(
                                title:
                                    snapshot.data!.totalNilaiHuruf.toString()),
                            SizedBox(height: 10.h),
                            NilaiTextBA(
                                title: (snapshot.data!.totalNilaiAngka / 6)
                                    .ceil()
                                    .toString()),
                          ],
                        );
                      },
                    ),
                    SizedBox(width: 10.w),
                    penilaianPembController.penjadwalanSkripsi.pembimbingduaNip
                                .toString() !=
                            "null"
                        ? FutureBuilder(
                            future: penilaianPembController
                                .getPenilaianSkripsiReturn(
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

                              if (snapshot.data?.totalNilaiAngka.toString() ==
                                  "null") {
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
                                    "Pembimbing 2",
                                    style: poppins.copyWith(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  SizedBox(height: 15.h),
                                  NilaiTextBA(
                                      title: snapshot.data!.penguasaanDasarTeori
                                          .toString()),
                                  SizedBox(height: 10.h),
                                  NilaiTextBA(
                                      title: snapshot
                                          .data!.tingkatPenguasaanMateri
                                          .toString()),
                                  SizedBox(height: 10.h),
                                  NilaiTextBA(
                                      title: snapshot.data!.tinjauanPustaka
                                          .toString()),
                                  SizedBox(height: 10.h),
                                  NilaiTextBA(
                                      title:
                                          snapshot.data!.tataTulis.toString()),
                                  SizedBox(height: 10.h),
                                  NilaiTextBA(
                                      title: snapshot.data!.hasilDanPembahasan
                                          .toString()),
                                  SizedBox(height: 10.h),
                                  NilaiTextBA(
                                      title: snapshot.data!.sikapDanKepribadian
                                          .toString()),
                                  SizedBox(height: 10.h),
                                  NilaiTextBA(
                                      title: snapshot.data!.totalNilaiAngka
                                          .ceil()
                                          .toString()),
                                  SizedBox(height: 10.h),
                                  NilaiTextBA(
                                      title: snapshot.data!.totalNilaiHuruf
                                          .toString()),
                                  SizedBox(height: 10.h),
                                  NilaiTextBA(
                                      title:
                                          (snapshot.data!.totalNilaiAngka / 6)
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
