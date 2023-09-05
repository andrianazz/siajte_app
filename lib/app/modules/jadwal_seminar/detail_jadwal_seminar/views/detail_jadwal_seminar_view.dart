import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:siajte_app/app/data/models/penjadwalan_kp_model.dart';
import 'package:siajte_app/app/data/models/penjadwalan_sempro_model.dart';
import 'package:siajte_app/app/data/models/penjadwalan_skripsi_model.dart';
import 'package:siajte_app/app/modules/home/controllers/home_controller.dart';
import 'package:siajte_app/app/routes/app_pages.dart';
import 'package:siajte_app/app/widgets/card_inputnilai_widget.dart';

import '../../../../theme/colors.dart';
import '../../../../theme/style.dart';
import '../../../../widgets/appbar_widget.dart';
import '../controllers/detail_jadwal_seminar_controller.dart';

class DetailJadwalSeminarView extends GetView<DetailJadwalSeminarController> {
  const DetailJadwalSeminarView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeController homeC = Get.put(HomeController());

    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(56),
        child: AppbarWidget(),
      ),
      body: ListView(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () => Get.back(),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      homeC.mapUser['role'] == "web"
                          ? ElevatedButton.icon(
                              onPressed: () async {
                                if (Get.arguments is PenjadwalanKp) {
                                  Get.toNamed(Routes.EDIT_JADWAL_KP,
                                      arguments: Get.arguments);
                                } else if (Get.arguments is PenjadwalanSempro) {
                                  Get.toNamed(Routes.EDIT_JADWAL_PROPOSAL,
                                      arguments: Get.arguments);
                                } else if (Get.arguments
                                    is PenjadwalanSkripsi) {
                                  Get.toNamed(Routes.EDIT_JADWAL_SKRIPSI,
                                      arguments: Get.arguments);
                                }
                              },
                              icon: const Icon(Icons.update),
                              label: const Text("Edit"),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: secondaryColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                            )
                          : const SizedBox(),
                    ],
                  ),
                ),
                // SizedBox(height: 5.h),
                // Container(
                //   width: 327.w,
                //   height: 180.h,
                //   decoration: const BoxDecoration(
                //     image: DecorationImage(
                //         image: AssetImage("assets/images/detail_seminar.png"),
                //         fit: BoxFit.cover),
                //   ),
                // ),
                SizedBox(height: 15.h),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                    vertical: 16.h,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: FutureBuilder(
                    future: controller.detailPenjadwalan,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }

                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Detail Seminar",
                            style: poppins.copyWith(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(height: 24.h),
                          DetailSeminar(
                            textTitle: "Nama",
                            textSubtitle: controller.nama.value,
                          ),
                          SizedBox(height: 5.h),
                          DetailSeminar(
                            textTitle: "NIM",
                            textSubtitle: controller.nim.value,
                          ),
                          SizedBox(height: 5.h),
                          DetailSeminar(
                            textTitle: "Seminar",
                            textSubtitle: controller.seminar.value,
                          ),
                          SizedBox(height: 5.h),
                          DetailSeminar(
                            textTitle: "Judul",
                            textSubtitle: controller.judul.value,
                          ),
                          SizedBox(height: 5.h),
                          DetailSeminar(
                            textTitle: "Prodi",
                            textSubtitle: controller.prodi.value,
                          ),
                          SizedBox(height: 5.h),
                          DetailSeminar(
                            textTitle: "Tanggal",
                            textSubtitle: controller.tanggal.value,
                          ),
                          SizedBox(height: 5.h),
                          DetailSeminar(
                            textTitle: "Waktu",
                            textSubtitle: controller.waktu.value,
                          ),
                          SizedBox(height: 5.h),
                          DetailSeminar(
                            textTitle: "Lokasi",
                            textSubtitle: controller.lokasi.value,
                          ),
                          SizedBox(height: 5.h),
                          Divider(
                            color: dividerColor,
                            thickness: 1,
                          ),
                          SizedBox(height: 5.h),
                          DetailSeminar(
                            textTitle: "Pembimbing",
                            textSubtitle: controller.pembimbing1.value,
                          ),
                          SizedBox(height: 5.h),
                          DetailSeminar(
                            textTitle: "",
                            textSubtitle: controller.pembimbing2.value,
                          ),
                          SizedBox(height: 5.h),
                          Divider(
                            color: dividerColor,
                            thickness: 1,
                          ),
                          SizedBox(height: 5.h),
                          DetailSeminar(
                            textTitle: "Penguji",
                            textSubtitle: controller.penguji1.value,
                          ),
                          SizedBox(height: 5.h),
                          DetailSeminar(
                            textTitle: "",
                            textSubtitle: controller.penguji2.value,
                          ),
                          SizedBox(height: 5.h),
                          DetailSeminar(
                            textTitle: "",
                            textSubtitle: controller.penguji3.value,
                          ),
                        ],
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                homeC.mapUser['role'] == "web"
                    ? SizedBox(
                        width: double.infinity,
                        height: 50.h,
                        child: ElevatedButton.icon(
                          onPressed: () async {
                            await controller.deleteJadwal();
                          },
                          icon: const Icon(Icons.delete),
                          label: Text(
                            "HAPUS SEMINAR",
                            style: poppins.copyWith(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: textDanger,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                        ),
                      )
                    : const SizedBox(),
                SizedBox(height: 10.h),

                //Input Nilai untuk Dosen
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      homeC.mapUser['role'] == "dosen"
                          ? Obx(
                              () => FutureBuilder<bool>(
                                  future: controller.getInputNilai(),
                                  builder: (context, snapshot) {
                                    print(snapshot.data);
                                    if (snapshot.data == true) {
                                      return CardInputNilaiWidget(
                                        onTap: () {
                                          if (Get.arguments is PenjadwalanKp) {
                                            //check if pembimbing

                                            final PenjadwalanKp data =
                                                Get.arguments;

                                            if (data.pembimbingNip!.contains(
                                                homeC.mapUser['data']['nip'])) {
                                              //Pembimbing
                                              Get.toNamed(
                                                  Routes.PENILAIAN_PEMB_KP,
                                                  arguments: data);
                                            } else if (data.pengujiNip!
                                                .contains(homeC.mapUser['data']
                                                    ['nip'])) {
                                              //Penguji
                                              Get.toNamed(
                                                  Routes.PENILAIAN_PENG_KP,
                                                  arguments: data);
                                            }
                                          } else if (Get.arguments
                                              is PenjadwalanSempro) {
                                            final PenjadwalanSempro data =
                                                Get.arguments;

                                            if (data.pembimbingsatuNip!.contains(
                                                homeC.mapUser['data']['nip'])) {
                                              //Pembimbing

                                              Get.toNamed(
                                                  Routes
                                                      .PENILAIAN_PEMB_PROPOSAL,
                                                  arguments: data);
                                            } else if ((data.pengujisatuNip!
                                                    .contains(
                                                        homeC.mapUser['data']
                                                            ['nip']) ||
                                                data.pengujiduaNip!.contains(
                                                    homeC.mapUser['data']
                                                        ['nip']) ||
                                                data.pengujitigaNip!.contains(
                                                    homeC.mapUser['data']
                                                        ['nip']))) {
                                              //Penguji
                                              Get.toNamed(
                                                  Routes
                                                      .PENILAIAN_PENG_PROPOSAL,
                                                  arguments: data);
                                            } else if (data.pembimbingduaNip !=
                                                null) {
                                              if (data.pembimbingduaNip!
                                                  .contains(
                                                      homeC.mapUser['data']
                                                          ['nip'])) {
                                                Get.toNamed(
                                                    Routes
                                                        .PENILAIAN_PEMB_PROPOSAL,
                                                    arguments: data);
                                              }
                                            }
                                          } else if (Get.arguments
                                              is PenjadwalanSkripsi) {
                                            final PenjadwalanSkripsi data =
                                                Get.arguments;

                                            if (data.pembimbingsatuNip!.contains(
                                                homeC.mapUser['data']['nip'])) {
                                              //Pembimbing
                                              Get.toNamed(
                                                  Routes.PENIALIAN_PEMB_SKIPSI,
                                                  arguments: data);
                                            } else if (data.pengujisatuNip!
                                                    .contains(
                                                        homeC.mapUser['data']
                                                            ['nip']) ||
                                                data.pengujiduaNip!.contains(
                                                    homeC.mapUser['data']
                                                        ['nip']) ||
                                                data.pengujitigaNip!.contains(
                                                    homeC.mapUser['data']
                                                        ['nip'])) {
                                              //Penguji

                                              Get.toNamed(
                                                  Routes.PENILAIAN_PENG_SKRIPSI,
                                                  arguments: data);
                                            } else if (data.pembimbingduaNip !=
                                                null) {
                                              if (data.pembimbingduaNip!
                                                  .contains(
                                                      homeC.mapUser['data']
                                                          ['nip'])) {
                                                Get.toNamed(
                                                    Routes
                                                        .PENIALIAN_PEMB_SKIPSI,
                                                    arguments: data);
                                              }
                                            }
                                          }
                                        },
                                        title: "Input / Edit Nilai",
                                        color: primaryColor,
                                      );
                                    } else {
                                      return CardInputNilaiWidget(
                                        onTap: () {},
                                        title: "Belum Dimulai",
                                        color: redColor,
                                      );
                                    }
                                  }),
                            )
                          : const SizedBox(),
                    ],
                  ),
                ),
                SizedBox(height: 20.h),

                // //Riwayat Seminar untuk Mahasiswa
                // SingleChildScrollView(
                //   scrollDirection: Axis.horizontal,
                //   child: controller.riwayatSeminarCondition(),
                // ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class DetailSeminar extends StatelessWidget {
  final String textTitle;
  final String textSubtitle;

  const DetailSeminar({
    super.key,
    required this.textTitle,
    required this.textSubtitle,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                textTitle,
                style: poppins.copyWith(
                  fontSize: 12.sp,
                  color: secondaryJadwalSeminar,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                width: 200.w,
                child: Text(
                  textSubtitle,
                  style: poppins.copyWith(
                    fontSize: 12.sp,
                    color: textJadwalSeminar,
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.end,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),
        ],
      ),
    );
  }
}
