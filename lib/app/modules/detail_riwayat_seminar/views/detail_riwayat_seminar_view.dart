import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../../../theme/colors.dart';
import '../../../theme/style.dart';
import '../../../widgets/appbar_widget.dart';
import '../../../widgets/card_subdetail_widget.dart';
import '../controllers/detail_riwayat_seminar_controller.dart';

class DetailRiwayatSeminarView extends GetView<DetailRiwayatSeminarController> {
  const DetailRiwayatSeminarView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
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
                    children: [
                      const Icon(Icons.arrow_back_ios),
                      SizedBox(width: 16.w),
                      Text(
                        'Kembali',
                        style: poppins.copyWith(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
                // SizedBox(height: 24.h),
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
                    future: controller.getDetailPenjadwalan(),
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
                SizedBox(height: 10.h),

                // //Input Nilai untuk Dosen
                // SingleChildScrollView(
                //   scrollDirection: Axis.horizontal,
                //   child: Row(
                //     children: [
                //       CardSubDetailWidget(
                //         onTap: () {},
                //         title: "Input / Edit Nilai",
                //         color: primaryColor,
                //       ),
                //     ],
                //   ),
                // ),
                // SizedBox(height: 20.h),

                //Riwayat Seminar untuk Mahasiswa
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      CardSubDetailWidget(
                        onTap: () {},
                        title: "Perbaikan Penguji 1",
                        color: primaryColor,
                      ),
                      SizedBox(width: 12.w),
                      CardSubDetailWidget(
                        onTap: () {},
                        title: "Perbaikan Penguji 2",
                        color: secondaryColor,
                      ),
                      SizedBox(width: 12.w),
                      CardSubDetailWidget(
                        onTap: () {},
                        title: "Perbaikan Penguji 3",
                        color: textSkripsi,
                      ),
                    ],
                  ),
                )
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
