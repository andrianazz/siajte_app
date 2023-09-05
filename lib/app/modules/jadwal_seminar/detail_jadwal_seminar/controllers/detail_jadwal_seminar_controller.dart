import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:siajte_app/app/data/models/penjadwalan_kp_model.dart';
import 'package:siajte_app/app/data/models/penjadwalan_sempro_model.dart';
import 'package:siajte_app/app/data/models/penjadwalan_skripsi_model.dart';
import 'package:siajte_app/app/modules/home/controllers/home_controller.dart';
import 'package:siajte_app/app/routes/app_pages.dart';
import 'package:siajte_app/app/theme/colors.dart';
import 'package:siajte_app/app/widgets/card_subdetail_widget.dart';

import '../../../../theme/variable.dart';

class DetailJadwalSeminarController extends GetxController {
  Dio dio = Dio();

  HomeController homeC = Get.put(HomeController());

  RxString idSeminar = ''.obs;
  RxString nama = ''.obs;
  RxString nim = ''.obs;
  RxString seminar = ''.obs;
  RxString prodi = ''.obs;
  RxString tanggal = ''.obs;
  RxString waktu = ''.obs;
  RxString lokasi = ''.obs;
  RxInt status = 0.obs;
  RxString pembimbing1 = ''.obs;
  RxString pembimbing2 = '-'.obs;

  RxString nimPemb1 = ''.obs;
  RxString nimPemb2 = ''.obs;

  RxString penguji1 = ''.obs;
  RxString penguji2 = '-'.obs;
  RxString penguji3 = '-'.obs;

  RxString nimPeng1 = ''.obs;
  RxString nimPeng2 = ''.obs;
  RxString nimPeng3 = ''.obs;

  RxString judul = ''.obs;

  RxBool isInputNilai = false.obs;

  late Future<void> detailPenjadwalan;
  late Future<bool> inputNilai;

  @override
  void onInit() {
    super.onInit();
    detailPenjadwalan = getDetailPenjadwalan();
    inputNilai = getInputNilai();
  }

  //get mahasiswa nama with nim
  Future<String> getMahasiswaWithNim(String nim) async {
    var response =
        await dio.post("$baseUrlAPI/mahasiswa/search", data: {"keyword": nim});
    String namaMahasiswa = response.data['data'][0]['nama'];

    return namaMahasiswa;
  }

  //get prodi with id
  Future<String> getProdiWithId(String id) async {
    var response = await dio.get("$baseUrlAPI/prodi/$id");
    String namaProdi = response.data['data']['nama_prodi'];
    return namaProdi;
  }

  //get dosen with id
  Future<String> getDosenWithNip(String nip) async {
    var response =
        await dio.post("$baseUrlAPI/dosen/search", data: {"keyword": nip});
    String namaDosen = response.data['data'][0]['nama'];
    return namaDosen;
  }

  Future<void> getDetailPenjadwalan() async {
    if (Get.arguments is PenjadwalanKp) {
      PenjadwalanKp penjadwalanKp = Get.arguments;

      idSeminar.value = penjadwalanKp.id!.toString();
      nama.value = await getMahasiswaWithNim(penjadwalanKp.mahasiswaNim!);
      nim.value = penjadwalanKp.mahasiswaNim!;
      seminar.value = penjadwalanKp.jenisSeminar!;
      prodi.value = await getProdiWithId(penjadwalanKp.prodiId!.toString());
      tanggal.value = penjadwalanKp.tanggal!;

      status.value = int.parse(penjadwalanKp.statusSeminar!);

      waktu.value = penjadwalanKp.waktu!;
      lokasi.value = penjadwalanKp.lokasi!;
      pembimbing1.value = await getDosenWithNip(penjadwalanKp.pembimbingNip!);
      penguji1.value = await getDosenWithNip(penjadwalanKp.pengujiNip!);

      nimPemb1.value = penjadwalanKp.pembimbingNip!;
      nimPeng1.value = penjadwalanKp.pengujiNip!;

      isInputNilai.value = DateTime.now()
          .isAfter(DateTime.parse("${tanggal.value} ${waktu.value}"));

      judul.value = penjadwalanKp.judulKp!;
    } else if (Get.arguments is PenjadwalanSempro) {
      PenjadwalanSempro penjadwalanSempro = Get.arguments;

      idSeminar.value = penjadwalanSempro.id!.toString();
      nama.value = await getMahasiswaWithNim(penjadwalanSempro.mahasiswaNim!);
      nim.value = penjadwalanSempro.mahasiswaNim!;
      seminar.value = penjadwalanSempro.jenisSeminar!;
      prodi.value = await getProdiWithId(penjadwalanSempro.prodiId!.toString());
      tanggal.value = penjadwalanSempro.tanggal!;
      status.value = int.parse(penjadwalanSempro.statusSeminar!);
      waktu.value = penjadwalanSempro.waktu!;
      lokasi.value = penjadwalanSempro.lokasi!;
      judul.value = penjadwalanSempro.judulProposal!;

      pembimbing1.value =
          await getDosenWithNip(penjadwalanSempro.pembimbingsatuNip!);

      if (penjadwalanSempro.pembimbingduaNip != null) {
        pembimbing2.value =
            await getDosenWithNip(penjadwalanSempro.pembimbingduaNip!);
      }

      nimPemb1.value = penjadwalanSempro.pembimbingsatuNip!;
      nimPemb2.value = penjadwalanSempro.pembimbingduaNip ?? "";

      penguji1.value = await getDosenWithNip(penjadwalanSempro.pengujisatuNip!);
      penguji2.value = await getDosenWithNip(penjadwalanSempro.pengujiduaNip!);

      if (penjadwalanSempro.pengujitigaNip != null) {
        penguji3.value =
            await getDosenWithNip(penjadwalanSempro.pengujitigaNip!);
      }
      nimPeng1.value = penjadwalanSempro.pengujisatuNip!;
      nimPeng2.value = penjadwalanSempro.pengujiduaNip!;
      nimPeng3.value = penjadwalanSempro.pengujitigaNip ?? "";

      isInputNilai.value = DateTime.now()
          .isAfter(DateTime.parse("${tanggal.value} ${waktu.value}"));
    } else {
      PenjadwalanSkripsi penjadwalanSkripsi = Get.arguments;

      idSeminar.value = penjadwalanSkripsi.id!.toString();

      String penguji1Nama =
          await getDosenWithNip(penjadwalanSkripsi.pengujisatuNip!.toString());

      judul.value = penjadwalanSkripsi.judulSkripsi!;

      nama.value = await getMahasiswaWithNim(penjadwalanSkripsi.mahasiswaNim!);
      nim.value = penjadwalanSkripsi.mahasiswaNim!;
      seminar.value = penjadwalanSkripsi.jenisSeminar!;
      prodi.value =
          await getProdiWithId(penjadwalanSkripsi.prodiId!.toString());
      tanggal.value = penjadwalanSkripsi.tanggal!;
      status.value = int.parse(penjadwalanSkripsi.statusSeminar!);
      waktu.value = penjadwalanSkripsi.waktu!;
      lokasi.value = penjadwalanSkripsi.lokasi!;
      pembimbing1.value =
          await getDosenWithNip(penjadwalanSkripsi.pembimbingsatuNip!);

      if (penjadwalanSkripsi.pembimbingduaNip != null) {
        pembimbing2.value =
            await getDosenWithNip(penjadwalanSkripsi.pembimbingduaNip!);
      }

      nimPemb1.value = penjadwalanSkripsi.pembimbingsatuNip!;
      nimPemb2.value = penjadwalanSkripsi.pembimbingduaNip ?? "";

      penguji1.value = penguji1Nama;
      penguji2.value = await getDosenWithNip(penjadwalanSkripsi.pengujiduaNip!);
      if (penjadwalanSkripsi.pengujitigaNip != null) {
        penguji3.value =
            await getDosenWithNip(penjadwalanSkripsi.pengujitigaNip!);
      }

      nimPeng1.value = penjadwalanSkripsi.pengujisatuNip!;
      nimPeng2.value = penjadwalanSkripsi.pengujiduaNip!;
      nimPeng3.value = penjadwalanSkripsi.pengujitigaNip ?? "";

      isInputNilai.value = DateTime.now()
          .isAfter(DateTime.parse("${tanggal.value} ${waktu.value}"));
    }
  }

  Future<void> deleteJadwal() async {
    //delete jadwal with dio
    if (Get.arguments is PenjadwalanKp) {
      PenjadwalanKp penjadwalanKp = Get.arguments;

      Get.defaultDialog(
        title: "Konfirmasi",
        middleText:
            "Apakah kamu yakin ingin menghapus seminar ${penjadwalanKp.jenisSeminar} ini?",
        actions: [
          ElevatedButton(
            onPressed: () async {
              try {
                var response = await dio
                    .delete("$baseUrlAPI/penjadwalan-kp/${penjadwalanKp.id}");

                var data = response.data;

                if (data != null) {
                  Get.snackbar("DELETE Jadwal Berhasil", "${data['status']}");

                  Get.offAllNamed(Routes.JADWAL_SEMINAR);
                } else if (response.statusCode == 401) {
                  Get.snackbar("DELETE Jadwal Gagal", "Status 401");
                } else {
                  Get.snackbar("DELETE Jadwal Gagal", "Status 500");
                }
              } on DioError catch (e) {
                if (e.type == DioErrorType.connectionTimeout) {
                  Get.snackbar("DELETE Jadwal Gagal", "Connection Timeout");
                } else {
                  Get.snackbar("DELETE Jadwal Gagal", "Status 500");
                }
              }
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.red),
            ),
            child: const Text("Ya"),
          ),
          TextButton(
            onPressed: () {
              Get.back();
            },
            child: const Text("Tidak"),
          ),
        ],
      );
    } else if (Get.arguments is PenjadwalanSempro) {
      PenjadwalanSempro penjadwalanSempro = Get.arguments;

      Get.defaultDialog(
        title: "Konfirmasi",
        middleText:
            "Apakah kamu yakin ingin menghapus seminar ${penjadwalanSempro.jenisSeminar} ini?",
        actions: [
          ElevatedButton(
            onPressed: () async {
              try {
                var response = await dio.delete(
                    "$baseUrlAPI/penjadwalan-sempro/${penjadwalanSempro.id}");

                var data = response.data;

                if (data != null) {
                  Get.snackbar("DELETE Jadwal Berhasil", "${data['status']}");

                  Get.offAllNamed(Routes.JADWAL_SEMINAR);
                } else if (response.statusCode == 401) {
                  Get.snackbar("DELETE Jadwal Gagal", "Status 401");
                } else {
                  Get.snackbar("DELETE Jadwal Gagal", "Status 500");
                }
              } on DioError catch (e) {
                if (e.type == DioErrorType.connectionTimeout) {
                  Get.snackbar("DELETE Jadwal Gagal", "Connection Timeout");
                } else {
                  Get.snackbar("DELETE Jadwal Gagal", "Status 500");
                }
              }
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.red),
            ),
            child: const Text("Ya"),
          ),
          TextButton(
            onPressed: () {
              Get.back();
            },
            child: const Text("Tidak"),
          ),
        ],
      );
    } else {
      PenjadwalanSkripsi penjadwalanSkripsi = Get.arguments;

      Get.defaultDialog(
        title: "Konfirmasi",
        middleText:
            "Apakah kamu yakin ingin menghapus seminar ${penjadwalanSkripsi.jenisSeminar} ini?",
        actions: [
          ElevatedButton(
            onPressed: () async {
              try {
                var response = await dio.delete(
                    "$baseUrlAPI/penjadwalan-skripsi/${penjadwalanSkripsi.id}");

                var data = response.data;

                if (data != null) {
                  Get.snackbar("DELETE Jadwal Berhasil", "${data['status']}");

                  Get.offAllNamed(Routes.JADWAL_SEMINAR);
                } else if (response.statusCode == 401) {
                  Get.snackbar("DELETE Jadwal Gagal", "Status 401");
                } else {
                  Get.snackbar("DELETE Jadwal Gagal", "Status 500");
                }
              } on DioError catch (e) {
                if (e.type == DioErrorType.connectionTimeout) {
                  Get.snackbar("DELETE Jadwal Gagal", "Connection Timeout");
                } else {
                  Get.snackbar("DELETE Jadwal Gagal", "Status 500");
                }
              }
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.red),
            ),
            child: const Text("Ya"),
          ),
          TextButton(
            onPressed: () {
              Get.back();
            },
            child: const Text("Tidak"),
          ),
        ],
      );
    }
  }

  Widget riwayatSeminarCondition() {
    if (homeC.mapUser['role'] == "dosen") {
      if (seminar.value == "KP") {
        //Pembimbing
        if (nimPemb1.contains(homeC.mapUser['data']['nip'])) {
          return Row(
            children: [
              CardSubDetailWidget(
                onTap: () {
                  Get.toNamed(Routes.WEB_APPEARANCE);
                },
                title: "Perbaikan Penguji 1",
                color: primaryColor,
              ),
              SizedBox(width: 12.w),
              CardSubDetailWidget(
                onTap: () {},
                title: "Berita Acara",
                color: secondaryColor,
              ),
            ],
          );
        }
        //Penguji
        if (nimPeng1.contains(homeC.mapUser['data']['nip'])) {
          return Row(
            children: [
              CardSubDetailWidget(
                onTap: () {
                  Get.toNamed(Routes.WEB_APPEARANCE,
                      arguments:
                          "$baseUrl/perbaikan2-pengujikp/${idSeminar.value}/${nimPeng1.value}");
                },
                title: "Perbaikan Penguji 1",
                color: primaryColor,
              ),
              SizedBox(width: 12.w),
              CardSubDetailWidget(
                onTap: () {},
                title: "Form Nilai Seminar",
                color: secondaryColor,
              ),
            ],
          );
        }
      } else if (seminar.value == "Proposal") {
        return const SizedBox();
      } else if (seminar.value == "Skripsi") {
        return const SizedBox();
      }
    } else if (homeC.mapUser['role'] == "mahasiswa") {
      if (seminar.value == "KP") {
        return const SizedBox();
      } else if (seminar.value == "Proposal") {
        return const SizedBox();
      } else if (seminar.value == "Skripsi") {
        return const SizedBox();
      }
    } else if (homeC.mapUser['role'] == "web") {
      return const SizedBox();
    }

    return const SizedBox();
  }

  Future<bool> getInputNilai() async {
    return isInputNilai.value;
  }
}
