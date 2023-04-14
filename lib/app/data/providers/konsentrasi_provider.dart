import 'package:get/get.dart';
import 'package:siajte_app/app/theme/variable.dart';

import '../models/konsentrasi_model.dart';

class KonsentrasiProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return Konsentrasi.fromJson(map);
      if (map is List) {
        return map.map((item) => Konsentrasi.fromJson(item)).toList();
      }
    };
    httpClient.baseUrl = '$baseUrlAPI/';
  }

  Future<Konsentrasi?> getKonsentrasi(int id) async {
    final response = await get('konsentrasi/$id');
    return response.body;
  }

  Future<Response<Konsentrasi>> postKonsentrasi(
          Konsentrasi konsentrasi) async =>
      await post('konsentrasi', konsentrasi);
  Future<Response> deleteKonsentrasi(int id) async =>
      await delete('konsentrasi/$id');
}
