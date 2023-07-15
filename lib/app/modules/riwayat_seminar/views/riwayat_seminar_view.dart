import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:siajte_app/app/widgets/card_jadwal_widget.dart';

import '../../../routes/app_pages.dart';
import '../../../theme/style.dart';
import '../../../widgets/appbar_widget.dart';
import '../controllers/riwayat_seminar_controller.dart';

class RiwayatSeminarView extends GetView<RiwayatSeminarController> {
  const RiwayatSeminarView({Key? key}) : super(key: key);
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
                    onFieldSubmitted: (value) {
                      controller.filterJadwalSeminarWithName(value);
                    },
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

                // Tampilan Choice
                // Container(
                //   child: Obx(
                //     () => ChipsChoice<String>.multiple(
                //       value: controller.selectedChoice.toList(),
                //       onChanged: (val) {
                //         controller.selectedChoice.value = val;
                //         controller.filterJadwalSeminarWithChoice(val);
                //       },
                //       choiceItems: C2Choice.listFrom<String, String>(
                //         source: controller.listJenisSeminar,
                //         value: (i, v) => v,
                //         label: (i, v) => v,
                //       ),
                //       choiceStyle: C2ChipStyle.filled(
                //         selectedStyle: C2ChipStyle(
                //           foregroundColor: Colors.white,
                //           backgroundColor: primaryColor,
                //         ),
                //         color: Colors.grey[200],
                //         padding: EdgeInsets.symmetric(
                //           horizontal: 12.w,
                //         ),
                //         height: 44.h,
                //         foregroundStyle: poppins.copyWith(
                //           fontSize: 16.sp,
                //           fontWeight: FontWeight.w500,
                //         ),
                //       ),
                //     ),
                //   ),
                // ),
                // SizedBox(height: 24.h),

                // Tampilan Web
                SizedBox(
                  width: double.infinity,
                  height: 500.h,
                  child: Obx(
                    () => controller.isLoading.isFalse
                        ? ListView.builder(
                            itemCount: controller.filterJadwal.value.length,
                            itemBuilder: (context, index) {
                              return CardJadwalWidget(
                                onTap: () {
                                  Get.toNamed(
                                    Routes.DETAIL_RIWAYAT_SEMINAR,
                                    arguments:
                                        controller.filterJadwal.value[index],
                                  );
                                },
                                penjadwalan:
                                    controller.filterJadwal.value[index],
                              );
                            },
                          )
                        : SizedBox(
                            width: 20.w,
                            height: 20.h,
                            child: const Center(
                                child: CircularProgressIndicator()),
                          ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
