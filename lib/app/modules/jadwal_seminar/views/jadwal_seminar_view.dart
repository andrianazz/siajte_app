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
                // Tampilan Web
                FutureBuilder(
                  future: controller.getJadwalSeminar(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      if (snapshot.data!.listPenjadwalanKP!.isEmpty &&
                          snapshot.data!.listPenjadwalanSempro!.isEmpty &&
                          snapshot.data!.listPenjadwalanSkripsi!.isEmpty) {
                        return Center(
                          child: Text(
                            'Tidak ada jadwal seminar',
                            style: poppins.copyWith(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        );
                      }

                      snapshot.data!.listPenjadwalanKP!
                          .sort((a, b) => b.tanggal!.compareTo(a.tanggal!));
                      snapshot.data!.listPenjadwalanSempro!
                          .sort((a, b) => a.tanggal!.compareTo(b.tanggal!));
                      snapshot.data!.listPenjadwalanSkripsi!
                          .sort((a, b) => a.tanggal!.compareTo(b.tanggal!));

                      return Column(
                        children: [
                          Column(
                            children: snapshot.data!.listPenjadwalanKP!
                                .map((jadwalKP) => CardJadwalWidget(
                                      onTap: () {},
                                      penjadwalanKp: jadwalKP,
                                    ))
                                .toList(),
                          ),
                          Column(
                            children: snapshot.data!.listPenjadwalanSempro!
                                .map((jadwalSempro) => CardJadwalWidget(
                                      onTap: () {},
                                      penjadwalanSempro: jadwalSempro,
                                    ))
                                .toList(),
                          ),
                          Column(
                            children: snapshot.data!.listPenjadwalanSkripsi!
                                .map((jadwalSkripsi) => CardJadwalWidget(
                                      onTap: () {},
                                      penjadwalanSkripsi: jadwalSkripsi,
                                    ))
                                .toList(),
                          ),
                        ],
                      );
                    } else if (snapshot.hasError) {
                      return const Text("error");
                    } else {
                      return const Center(child: CircularProgressIndicator());
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
