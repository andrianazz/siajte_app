import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:siajte_app/app/data/models/mahasiswa_model.dart';
import 'package:siajte_app/app/widgets/appbar_widget.dart';

import '../../../theme/colors.dart';
import '../../../theme/style.dart';
import '../controllers/edit_mahasiswa_controller.dart';

class EditMahasiswaView extends GetView<EditMahasiswaController> {
  const EditMahasiswaView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Mahasiswa mahasiswa = Get.arguments as Mahasiswa;
    controller.setMahasiswatoTextField(mahasiswa);

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(56.h),
        child: const AppbarWidget(),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 24.h),
        children: [
          SizedBox(height: 30.h),
          Text(
            "Edit Mahasiswa",
            style: poppins.copyWith(
              fontSize: 18.sp,
              fontWeight: FontWeight.w700,
            ),
          ),
          const Divider(),
          SizedBox(
            height: 40.h,
          ),
          Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Nama Lengkap",
                  style: poppins.copyWith(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    color: fieldChangePassword,
                  ),
                ),
                SizedBox(height: 8.h),
                TextFormField(
                  controller: controller.namaC,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Nama tidak boleh kosong';
                    }
                    return null;
                  },
                  style: poppins.copyWith(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: fieldChangePassword,
                  ),
                  decoration: InputDecoration(
                    hintText: 'Masukkan Nama',
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
                SizedBox(height: 20.h),
                Text(
                  "Email",
                  style: poppins.copyWith(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    color: fieldChangePassword,
                  ),
                ),
                SizedBox(height: 8.h),
                TextFormField(
                  controller: controller.emailC,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Email tidak boleh kosong';
                    }
                    return null;
                  },
                  style: poppins.copyWith(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: fieldChangePassword,
                  ),
                  decoration: InputDecoration(
                    hintText: 'Masukkan Email',
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
                SizedBox(height: 20.h),
                Row(
                  children: [
                    Flexible(
                      flex: 4,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "NIM",
                            style: poppins.copyWith(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                              color: fieldChangePassword,
                            ),
                          ),
                          SizedBox(height: 8.h),
                          TextFormField(
                            controller: controller.nimC,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'NIM tidak boleh kosong';
                              }
                              return null;
                            },
                            style: poppins.copyWith(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                              color: fieldChangePassword,
                            ),
                            decoration: InputDecoration(
                              hintText: '118XXXXXX',
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 12.w, vertical: 10.h),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 20.w),
                    Flexible(
                      flex: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Angkatan",
                            style: poppins.copyWith(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                              color: fieldChangePassword,
                            ),
                          ),
                          SizedBox(height: 8.h),
                          TextFormField(
                            controller: controller.angkatanC,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Angkatan tidak boleh kosong';
                              }
                              return null;
                            },
                            style: poppins.copyWith(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                              color: fieldChangePassword,
                            ),
                            decoration: InputDecoration(
                              hintText: '20xx',
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 12.w, vertical: 10.h),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.h),
                Text(
                  "Program Studi",
                  style: poppins.copyWith(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    color: fieldChangePassword,
                  ),
                ),
                SizedBox(height: 8.h),
                DropdownButtonFormField(
                  value: mahasiswa.prodiId,
                  items: const [
                    DropdownMenuItem(
                      value: 3,
                      child: Text("Teknik Informatika"),
                    ),
                  ],
                  onChanged: (value) {
                    controller.prodiId = value as int;
                  },
                  decoration: InputDecoration(
                    hintText: 'Pilih Program Studi',
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
                SizedBox(height: 20.h),
                Text(
                  "Konsetrasi",
                  style: poppins.copyWith(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    color: fieldChangePassword,
                  ),
                ),
                SizedBox(height: 8.h),
                DropdownButtonFormField(
                  value: mahasiswa.konsentrasiId,
                  items: const [
                    DropdownMenuItem(
                      value: 1,
                      child: Text("Teknik Tenaga Listrik"),
                    ),
                    DropdownMenuItem(
                      value: 2,
                      child: Text("Teknik Telekomunikasi"),
                    ),
                    DropdownMenuItem(
                      value: 3,
                      child: Text("Komputasi Cerdas dan Visualiasi"),
                    ),
                    DropdownMenuItem(
                      value: 4,
                      child: Text("Rekayasa Perangkat Lunak"),
                    ),
                    DropdownMenuItem(
                      value: 5,
                      child: Text("Komputasi Berbasis Jaringan"),
                    ),
                  ],
                  onChanged: (value) {
                    controller.konsentrasiId = value as int;
                  },
                  decoration: InputDecoration(
                    hintText: 'Pilih Konsetrasi',
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
                SizedBox(height: 30.h),
                Obx(
                  () => SizedBox(
                    width: double.infinity,
                    height: 44.h,
                    child: ElevatedButton(
                      onPressed: controller.isLoading.isFalse
                          ? () async {
                              await controller.updateMahaswiswaAPI();
                            }
                          : null,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      child: controller.isLoading.isFalse
                          ? Text(
                              'Ubah Data Mahasiswa',
                              style: poppins.copyWith(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                            )
                          : CircularProgressIndicator(
                              strokeWidth: 4.w,
                              color: Colors.white,
                            ),
                    ),
                  ),
                ),
                SizedBox(height: 40.h),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
