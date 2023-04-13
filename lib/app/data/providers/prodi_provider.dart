import 'package:get/get.dart';

import '../models/prodi_model.dart';

class ProdiProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return Prodi.fromJson(map);
      if (map is List) return map.map((item) => Prodi.fromJson(item)).toList();
    };
    httpClient.baseUrl = 'YOUR-API-URL';
  }

  Future<Prodi?> getProdi(int id) async {
    final response = await get('prodi/$id');
    return response.body;
  }

  Future<Response<Prodi>> postProdi(Prodi prodi) async =>
      await post('prodi', prodi);
  Future<Response> deleteProdi(int id) async => await delete('prodi/$id');
}
