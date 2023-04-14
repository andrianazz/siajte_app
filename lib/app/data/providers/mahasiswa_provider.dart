import 'package:get/get.dart';
import 'package:siajte_app/app/theme/variable.dart';

import '../models/mahasiswa_model.dart';

class MahasiswaProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return Mahasiswa.fromJson(map);
      if (map is List) {
        return map.map((item) => Mahasiswa.fromJson(item)).toList();
      }
    };
    httpClient.baseUrl = '$baseUrlAPI/';
  }

  Future<Mahasiswa?> getMahasiswa(int id) async {
    final response = await get('mahasiswa/$id');
    return response.body;
  }

  Future<Response<Mahasiswa>> postMahasiswa(Mahasiswa mahasiswa) async =>
      await post('mahasiswa', mahasiswa);
  Future<Response> deleteMahasiswa(int id) async =>
      await delete('mahasiswa/$id');
}
