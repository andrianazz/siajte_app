import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:siajte_app/app/theme/colors.dart';
import 'package:siajte_app/app/theme/style.dart';
import 'package:siajte_app/app/widgets/appbar_widget.dart';

class DetailJadwalSeminarView extends GetView {
  const DetailJadwalSeminarView({Key? key}) : super(key: key);
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
            margin: EdgeInsets.symmetric(
              horizontal: 24.w,
            ),
            child: Column(
              children: [
                SizedBox(height: 24.h),
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
                  child: Column(
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
                      const DetailSeminar(
                        textTitle: "Nama",
                        textSubtitle: "Andrian Wahyu",
                      ),
                      SizedBox(height: 16.h),
                      const DetailSeminar(
                        textTitle: "NIM",
                        textSubtitle: "11850112219",
                      ),
                      SizedBox(height: 16.h),
                      const DetailSeminar(
                        textTitle: "SEMINAR",
                        textSubtitle: "KP",
                      ),
                      SizedBox(height: 16.h),
                      const DetailSeminar(
                        textTitle: "Prodi",
                        textSubtitle: "Teknik Informatika",
                      ),
                      SizedBox(height: 16.h),
                      const DetailSeminar(
                        textTitle: "Tanggal",
                        textSubtitle: "11/12/2023",
                      ),
                      SizedBox(height: 16.h),
                      const DetailSeminar(
                        textTitle: "Waktu",
                        textSubtitle: "10:00",
                      ),
                      SizedBox(height: 16.h),
                      const DetailSeminar(
                        textTitle: "Lokasi",
                        textSubtitle: "LAB 3",
                      ),
                      SizedBox(height: 16.h),
                      Divider(
                        color: dividerColor,
                        thickness: 1,
                      ),
                      SizedBox(height: 16.h),
                      const DetailSeminar(
                        textTitle: "Pembimbing",
                        textSubtitle: "NL",
                      ),
                      SizedBox(height: 16.h),
                      const DetailSeminar(
                        textTitle: "",
                        textSubtitle: "-",
                      ),
                      SizedBox(height: 16.h),
                      Divider(
                        color: dividerColor,
                        thickness: 1,
                      ),
                      const DetailSeminar(
                        textTitle: "Penguji",
                        textSubtitle: "NL",
                      ),
                      SizedBox(height: 16.h),
                      const DetailSeminar(
                        textTitle: "",
                        textSubtitle: "TY",
                      ),
                      SizedBox(height: 16.h),
                      const DetailSeminar(
                        textTitle: "",
                        textSubtitle: "IT",
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
    return Column(
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
            Text(
              textSubtitle,
              style: poppins.copyWith(
                fontSize: 12.sp,
                color: textJadwalSeminar,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        SizedBox(height: 16.h),
      ],
    );
  }
}
