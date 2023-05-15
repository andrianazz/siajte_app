import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:siajte_app/app/data/models/mahasiswa_model.dart';
import 'package:siajte_app/app/theme/variable.dart';

class SearchMahasiswaController extends GetxController {
  Dio dio = Dio();
  TextEditingController searchC = TextEditingController();

  final String nama = Get.arguments;

  Future<List<Mahasiswa>> getMahasiswabyName() async {
    List<Mahasiswa> listMahasiswa = <Mahasiswa>[];

    var response = await dio.post(
      "$baseUrlAPI/mahasiswa/search",
      data: {"keyword": nama},
    );

    for (var item in response.data['data']) {
      listMahasiswa.add(Mahasiswa.fromJson(item));
    }

    return listMahasiswa;
  }
}
