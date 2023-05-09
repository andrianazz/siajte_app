import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:siajte_app/app/data/models/dosen_model.dart';
import 'package:siajte_app/app/data/models/mahasiswa_model.dart';
import 'package:siajte_app/app/theme/colors.dart';
import 'package:siajte_app/app/widgets/appbar_widget.dart';

import '../../../theme/style.dart';
import '../controllers/add_jadwal_kp_controller.dart';

class AddJadwalKpView extends GetView<AddJadwalKpController> {
  const AddJadwalKpView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            "Tambah Jadwal KP",
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
                  "Mahasiswa",
                  style: poppins.copyWith(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    color: fieldChangePassword,
                  ),
                ),
                SizedBox(height: 8.h),
                FutureBuilder<List<Mahasiswa>>(
                  future: controller.getAllMahasiswa(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return DropdownButtonFormField(
                        items: const [
                          DropdownMenuItem(child: Text("Loading..."))
                        ],
                        onChanged: (value) {
                          controller.prodiId = value as int;
                        },
                        decoration: InputDecoration(
                          hintText: "Loading.....",
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 12.w, vertical: 10.h),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      );
                    }

                    if (snapshot.hasError) {
                      return const Text("error");
                    }

                    return DropdownButtonFormField(
                      items: snapshot.data!
                          .map(
                            (element) => DropdownMenuItem(
                              value: element,
                              child: Text(
                                "${element.nama}",
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          )
                          .toList(),
                      onChanged: (value) {
                        controller.mahasiswa = value!;
                      },
                      decoration: InputDecoration(
                        hintText: 'Pilih Mahasiswa',
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 12.w, vertical: 10.h),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    );
                  },
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
                  "Judul",
                  style: poppins.copyWith(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    color: fieldChangePassword,
                  ),
                ),
                SizedBox(height: 8.h),
                TextFormField(
                  controller: controller.judulKP,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Judul tidak boleh kosong';
                    }
                    return null;
                  },
                  style: poppins.copyWith(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: fieldChangePassword,
                  ),
                  decoration: InputDecoration(
                    hintText: 'Judul KP',
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
                SizedBox(height: 20.h),
                Text(
                  "Pembimbing",
                  style: poppins.copyWith(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    color: fieldChangePassword,
                  ),
                ),
                SizedBox(height: 8.h),
                FutureBuilder<List<Dosen>>(
                  future: controller.getAllDosen(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return DropdownButtonFormField(
                        items: const [
                          DropdownMenuItem(
                            child: Text("Loading..."),
                          )
                        ],
                        onChanged: (value) {},
                        decoration: InputDecoration(
                          hintText: 'Loading...',
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 12.w, vertical: 10.h),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      );
                    }
                    if (snapshot.hasError) {}
                    return DropdownButtonFormField(
                      items: snapshot.data!
                          .map((e) => DropdownMenuItem(
                                value: e,
                                child: Text("${e.nama}"),
                              ))
                          .toList(),
                      onChanged: (value) {
                        controller.pembimbing = value!;
                      },
                      decoration: InputDecoration(
                        hintText: 'Pilih Pembimbing',
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 12.w, vertical: 10.h),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    );
                  },
                ),
                SizedBox(height: 20.h),
                Text(
                  "Pembimbing",
                  style: poppins.copyWith(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    color: fieldChangePassword,
                  ),
                ),
                SizedBox(height: 8.h),
                FutureBuilder<List<Dosen>>(
                  future: controller.getAllDosen(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return DropdownButtonFormField(
                        items: const [
                          DropdownMenuItem(
                            child: Text("Loading..."),
                          )
                        ],
                        onChanged: (value) {},
                        decoration: InputDecoration(
                          hintText: 'Loading...',
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 12.w, vertical: 10.h),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      );
                    }
                    if (snapshot.hasError) {}
                    return DropdownButtonFormField(
                      items: snapshot.data!
                          .map((e) => DropdownMenuItem(
                                value: e,
                                child: Text("${e.nama}"),
                              ))
                          .toList(),
                      onChanged: (value) {
                        controller.penguji = value!;
                      },
                      decoration: InputDecoration(
                        hintText: 'Pilih Penguji',
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 12.w, vertical: 10.h),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    );
                  },
                ),
                SizedBox(height: 20.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Tanggal",
                            style: poppins.copyWith(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                              color: fieldChangePassword,
                            ),
                          ),
                          SizedBox(height: 8.h),
                          Obx(
                            () => OutlinedButton.icon(
                              onPressed: () {
                                showDatePicker(
                                  context: context,
                                  initialDate: controller.tanggal.value,
                                  firstDate: DateTime(2010),
                                  lastDate: DateTime(2101),
                                ).then((value) {
                                  controller.tanggal.value = value!;
                                });
                              },
                              icon: const Icon(Icons.calendar_month),
                              label: Text(
                                controller.tanggal.toString().substring(0, 10),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(width: 20.w),
                    Flexible(
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Waktu",
                            style: poppins.copyWith(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                              color: fieldChangePassword,
                            ),
                          ),
                          SizedBox(height: 8.h),
                          Obx(
                            () => OutlinedButton.icon(
                              onPressed: () {
                                showTimePicker(
                                  context: context,
                                  initialTime: controller.waktu.value,
                                ).then(
                                    (value) => controller.waktu.value = value!);
                              },
                              icon: const Icon(Icons.calendar_month),
                              label: Text(
                                  "${controller.waktu.value.hour}:${controller.waktu.value.minute}"),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.h),
                Text(
                  "Lokasi",
                  style: poppins.copyWith(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    color: fieldChangePassword,
                  ),
                ),
                SizedBox(height: 8.h),
                TextFormField(
                  controller: controller.lokasi,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Lokasi tidak boleh kosong';
                    }
                    return null;
                  },
                  style: poppins.copyWith(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: fieldChangePassword,
                  ),
                  decoration: InputDecoration(
                    hintText: 'Lokasi',
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30.h,
                ),
                Obx(
                  () => SizedBox(
                    width: double.infinity,
                    height: 44.h,
                    child: ElevatedButton(
                      onPressed: controller.isLoading.isFalse
                          ? () async {
                              await controller.addJadwalKPAPI();
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
                              'Tambah Jadwal Seminar',
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
