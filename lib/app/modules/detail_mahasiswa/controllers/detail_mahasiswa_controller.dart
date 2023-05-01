import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:siajte_app/app/data/models/mahasiswa_model.dart';
import 'package:siajte_app/app/theme/variable.dart';

class DetailMahasiswaController extends GetxController {
  Dio dio = Dio();

  Future<List<Mahasiswa>> getAllMahasiswa() async {
    List<Mahasiswa> allMahasiswa = [];

    var response = await dio.get("$baseUrlAPI/mahasiswa");
    for (var item in response.data['data']) {
      allMahasiswa.add(Mahasiswa.fromJson(item));
    }

    return allMahasiswa;
  }

  Future<String> getProdiWithId(int prodiId) async {
    var response = await dio.get("$baseUrlAPI/prodi/$prodiId");

    String prodi = response.data['data']['nama_prodi'].toString();

    return prodi;
  }

  Future<String> getKonsentrasiWithId(int id) async {
    var response = await dio.get("$baseUrlAPI/konsentrasi/$id");

    String konsentrasi = response.data['data']['nama_konsentrasi'].toString();

    return konsentrasi;
  }
}
