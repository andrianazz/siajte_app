import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:siajte_app/app/routes/app_pages.dart';
import 'package:siajte_app/app/theme/style.dart';
import 'package:siajte_app/app/widgets/appbar_widget.dart';
import 'package:siajte_app/app/widgets/mahasiswa/card_mahasiswa_widget.dart';

import '../controllers/mahasiswa_controller.dart';

class MahasiswaView extends GetView<MahasiswaController> {
  const MahasiswaView({Key? key}) : super(key: key);
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
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Search tidak boleh kosong';
                      }
                      return null;
                    },
                    onFieldSubmitted: (value) async {
                      controller.getMahasiswabyName(value);
                    },
                    style: poppins.copyWith(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                    ),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: 16.w, vertical: 10.h),
                      hintText: 'Cari Nama Mahasiswa....',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      suffixIcon: const Icon(Icons.search_rounded),
                    ),
                  ),
                ),
                SizedBox(height: 24.h),
                SizedBox(
                  height: 500.h,
                  child: Obx(
                    () => ListView.builder(
                      itemCount: controller.filterMahasiswa.value.length,
                      itemBuilder: (context, index) {
                        return CardMahasiswa(
                          mahasiswa: controller.filterMahasiswa.value[index],
                          onTap: () {
                            Get.toNamed(
                              Routes.DETAIL_MAHASISWA,
                              arguments:
                                  controller.filterMahasiswa.value[index],
                            );
                          },
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(Routes.ADD_MAHASISWA);
        },
        child: const Icon(
          Icons.add,
        ),
      ),
    );
  }
}
