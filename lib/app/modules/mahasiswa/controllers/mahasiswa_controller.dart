import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:siajte_app/app/data/models/mahasiswa_model.dart';
import 'package:siajte_app/app/theme/variable.dart';

class MahasiswaController extends GetxController {
  Dio dio = Dio();
  TextEditingController searchC = TextEditingController();

  Future<List<Mahasiswa>> getAllMahasiswa() async {
    List<Mahasiswa> listMahasiswa = <Mahasiswa>[];

    var response = await dio.get("$baseUrlAPI/mahasiswa");
    for (var item in response.data['data']) {
      listMahasiswa.add(Mahasiswa.fromJson(item));
    }

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
}
