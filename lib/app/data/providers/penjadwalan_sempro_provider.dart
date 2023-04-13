import 'package:get/get.dart';

import '../models/penjadwalan_sempro_model.dart';

class PenjadwalanSemproProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return PenjadwalanSempro.fromJson(map);
      if (map is List)
        return map.map((item) => PenjadwalanSempro.fromJson(item)).toList();
    };
    httpClient.baseUrl = 'YOUR-API-URL';
  }

  Future<PenjadwalanSempro?> getPenjadwalanSempro(int id) async {
    final response = await get('penjadwalansempro/$id');
    return response.body;
  }

  Future<Response<PenjadwalanSempro>> postPenjadwalanSempro(
          PenjadwalanSempro penjadwalansempro) async =>
      await post('penjadwalansempro', penjadwalansempro);
  Future<Response> deletePenjadwalanSempro(int id) async =>
      await delete('penjadwalansempro/$id');
}
