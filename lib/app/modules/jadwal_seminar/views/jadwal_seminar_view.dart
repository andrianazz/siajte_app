import 'package:chips_choice/chips_choice.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

import 'package:get/get.dart';
import 'package:siajte_app/app/routes/app_pages.dart';
import 'package:siajte_app/app/theme/style.dart';
import 'package:siajte_app/app/widgets/card_jadwal_widget.dart';

import '../../../theme/colors.dart';
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
                Container(
                  child: Obx(
                    () => ChipsChoice<String>.multiple(
                      value: controller.selectedChoice.toList(),
                      onChanged: (val) {
                        controller.selectedChoice.value = val;
                      },
                      choiceItems: C2Choice.listFrom<String, String>(
                        source: controller.listJenisSeminar,
                        value: (i, v) => v,
                        label: (i, v) => v,
                      ),
                      choiceStyle: C2ChipStyle.filled(
                        selectedStyle: C2ChipStyle(
                          foregroundColor: Colors.white,
                          backgroundColor: primaryColor,
                        ),
                        color: Colors.grey[200],
                        padding: EdgeInsets.symmetric(
                          horizontal: 12.w,
                        ),
                        height: 44.h,
                        foregroundStyle: poppins.copyWith(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 24.h),
                // Tampilan Web
                FutureBuilder(
                  future: controller.getJadwalSeminar(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      snapshot.data!
                          .sort((a, b) => b.tanggal!.compareTo(a.tanggal!));

                      return Column(
                        children: snapshot.data!
                            .map((e) => CardJadwalWidget(
                                  onTap: () {
                                    Get.toNamed(
                                      Routes.DETAIL_JADWAL_SEMINAR,
                                      arguments: e,
                                    );
                                  },
                                  penjadwalan: e,
                                ))
                            .toList(),
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
      floatingActionButton: SpeedDial(
        animatedIcon: AnimatedIcons.menu_close,
        backgroundColor: secondaryColor,
        foregroundColor: Colors.white,
        overlayColor: Colors.black,
        overlayOpacity: 0.5,
        children: [
          SpeedDialChild(
            child: const Icon(Icons.edit_document),
            backgroundColor: textKP,
            foregroundColor: Colors.white,
            label: 'KP',
            onTap: () {
              Get.toNamed(Routes.ADD_JADWAL_KP);
            },
          ),
          SpeedDialChild(
            child: const Icon(Icons.file_copy_outlined),
            backgroundColor: textProposal,
            foregroundColor: Colors.white,
            label: 'Proposal',
            onTap: () {
              Get.toNamed(Routes.ADD_JADWAL_PROPOSAL);
            },
          ),
          SpeedDialChild(
            child: const Icon(Icons.file_copy),
            backgroundColor: textSkripsi,
            foregroundColor: Colors.white,
            label: 'Skripsi',
            onTap: () {
              Get.toNamed(Routes.ADD_JADWAL_SKRIPSI);
            },
          ),
        ],
      ),
    );
  }
}
