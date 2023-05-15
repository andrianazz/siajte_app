import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:siajte_app/app/data/models/mahasiswa_model.dart';
import 'package:siajte_app/app/theme/variable.dart';

class MahasiswaController extends GetxController {
  Dio dio = Dio();
  TextEditingController searchC = TextEditingController();

  RxList<Mahasiswa> allMahasiswa = <Mahasiswa>[].obs;
  RxList<Mahasiswa> filterMahasiswa = <Mahasiswa>[].obs;

  Future<List<Mahasiswa>> getAllMahasiswa() async {
    List<Mahasiswa> listMahasiswa = <Mahasiswa>[];

    var response = await dio.get("$baseUrlAPI/mahasiswa");
    for (var item in response.data['data']) {
      listMahasiswa.add(Mahasiswa.fromJson(item));
    }

    listMahasiswa.sort((a, b) => a.nama!.compareTo(b.nama!));

    return listMahasiswa;
  }

  Future<String> getMahasiswaWithNim(String nim) async {
    var response =
        await dio.post("$baseUrlAPI/mahasiswa/search", data: {"keyword": nim});
    String namaMahasiswa = response.data['data'][0]['nama'];

    return namaMahasiswa;
  }

  Future<String> getProdiWithProdiId(int prodiId) async {
    var response = await dio.get("$baseUrlAPI/prodi/$prodiId");

    String prodi = response.data['data']['nama_prodi'].toString();

    return prodi;
  }

  void getMahasiswabyName(String name) {
    List<Mahasiswa> result = [];

    if (name.isEmpty) {
      result = allMahasiswa;
    } else {
      result = allMahasiswa
          .where((mahasiswa) =>
              mahasiswa.nama!.toLowerCase().contains(name.toLowerCase()))
          .toList();
    }

    filterMahasiswa.value = result;
  }

  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    allMahasiswa.value = await getAllMahasiswa();
    filterMahasiswa.value = allMahasiswa;
  }
}
