import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:siajte_app/app/widgets/appbar_widget.dart';

import '../../../theme/colors.dart';
import '../../../theme/style.dart';
import '../controllers/detail_mahasiswa_controller.dart';

class DetailMahasiswaView extends GetView<DetailMahasiswaController> {
  const DetailMahasiswaView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mahasiswa = Get.arguments;

    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(56),
        child: AppbarWidget(),
      ),
      body: ListView(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
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
                SizedBox(height: 24.h),
                Container(
                  width: 327.w,
                  height: 180.h,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/images/detail_seminar.png"),
                        fit: BoxFit.cover),
                  ),
                ),
                SizedBox(height: 24.h),
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
                    future: controller.getAllMahasiswa(),
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
                          DetailMahasiswa(
                            textTitle: "Nama",
                            textSubtitle: mahasiswa.nama,
                          ),
                          SizedBox(height: 16.h),
                          DetailMahasiswa(
                            textTitle: "NIM",
                            textSubtitle: mahasiswa.nim!,
                          ),
                          SizedBox(height: 16.h),
                          DetailMahasiswa(
                            textTitle: "Angkatan",
                            textSubtitle: mahasiswa.angkatan!,
                          ),
                          SizedBox(height: 16.h),
                          FutureBuilder<String>(
                            future:
                                controller.getProdiWithId(mahasiswa.prodiId!),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              }

                              if (snapshot.hasError) {
                                return const Center(
                                  child: Text("Error"),
                                );
                              }
                              return DetailMahasiswa(
                                textTitle: "Prodi",
                                textSubtitle: snapshot.data!,
                              );
                            },
                          ),
                          SizedBox(height: 16.h),
                          FutureBuilder<String>(
                            future: controller
                                .getKonsentrasiWithId(mahasiswa.konsentrasiId!),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              }

                              if (snapshot.hasError) {
                                return const Center(
                                  child: Text("Error"),
                                );
                              }
                              return DetailMahasiswa(
                                textTitle: "Konsentasi",
                                textSubtitle: snapshot.data!,
                              );
                            },
                          ),
                          SizedBox(height: 16.h),
                          DetailMahasiswa(
                            textTitle: "Email",
                            textSubtitle: mahasiswa.email!,
                          ),
                          SizedBox(height: 16.h),
                        ],
                      );
                    },
                  ),
                ),
                SizedBox(height: 40.h),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class DetailMahasiswa extends StatelessWidget {
  final String textTitle;
  final String textSubtitle;

  const DetailMahasiswa({
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
