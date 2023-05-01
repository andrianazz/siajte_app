import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:siajte_app/app/data/models/mahasiswa_model.dart';
import 'package:siajte_app/app/modules/mahasiswa/controllers/mahasiswa_controller.dart';
import 'package:siajte_app/app/theme/colors.dart';
import 'package:siajte_app/app/theme/style.dart';

class CardMahasiswa extends StatelessWidget {
  final Mahasiswa mahasiswa;
  final Function onTap;
  const CardMahasiswa({
    super.key,
    required this.mahasiswa,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    MahasiswaController controller = Get.find();
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
            onTap();
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
                    FutureBuilder<String>(
                      future: controller.getMahasiswaWithNim(
                        mahasiswa.nim!,
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
                          return const Text("error");
                        } else {
                          return const Center(
                              child: CircularProgressIndicator());
                        }
                      },
                    ),
                    // Text(
                    //   "edit",
                    //   style: poppins.copyWith(
                    //     fontSize: 12.sp,
                    //     fontWeight: FontWeight.w600,
                    //   ),
                    // ),
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
                              "Prodi",
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
                            FutureBuilder<String>(
                              future: controller.getProdiWithProdiId(
                                mahasiswa.prodiId!,
                              ),
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  return Text(
                                    snapshot.data!,
                                    style: poppins.copyWith(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w600,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  );
                                } else if (snapshot.hasError) {
                                  print(snapshot.error);
                                  return const Text("error");
                                } else {
                                  return const Center(
                                      child: CircularProgressIndicator());
                                }
                              },
                            ),
                            SizedBox(height: 8.h),
                            Text(
                              mahasiswa.nim!,
                              style: poppins.copyWith(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w600,
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
                          mahasiswa.angkatan!,
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
