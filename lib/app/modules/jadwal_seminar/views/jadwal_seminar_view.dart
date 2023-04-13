import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:siajte_app/app/theme/style.dart';
import 'package:siajte_app/app/widgets/card_jadwal_widget.dart';

import '../../../widgets/appbar_widget.dart';
import '../controllers/jadwal_seminar_controller.dart';

class JadwalSeminarView extends GetView<JadwalSeminarController> {
  const JadwalSeminarView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(56.h),
        child: const AppbarWidget(),
      ),
      body: ListView(
        children: [
          Container(
            margin: EdgeInsets.symmetric(
              horizontal: 24.w,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 24.h),
                Form(
                  // key: controller.formKey,
                  child: TextFormField(
                    // controller: controller.userC,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Search tidak boleh kosong';
                      }
                      return null;
                    },
                    style: poppins.copyWith(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                    ),

                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: 16.w, vertical: 10.h),
                      hintText: 'Search',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      suffixIcon: const Icon(Icons.search_rounded),
                    ),
                  ),
                ),
                SizedBox(height: 24.h),
                const CardJadwalWidget(
                  nama: "Andrian Wahyu",
                  tanggal: "12/12/2021",
                  jam: "12:00",
                  jenis: "KP",
                  nim: "11850112219",
                ),
                SizedBox(height: 20.h),
                const CardJadwalWidget(
                  nama: "Wirasatria Putra",
                  tanggal: "23/08/2002",
                  jenis: "Proposal",
                  nim: "118656622123",
                  jam: "12:00",
                ),
                SizedBox(height: 20.h),
                const CardJadwalWidget(
                  nama: "Ridho Abdillah Alta",
                  tanggal: "12/12/2021",
                  jam: "08:00",
                  jenis: "Skripsi",
                  nim: "11850112219",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
