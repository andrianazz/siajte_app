import 'package:get/get.dart';

import '../models/penjadwalan_kp_model.dart';

class PenjadwalanKpProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return PenjadwalanKp.fromJson(map);
      if (map is List)
        return map.map((item) => PenjadwalanKp.fromJson(item)).toList();
    };
    httpClient.baseUrl = 'YOUR-API-URL';
  }

  Future<PenjadwalanKp?> getPenjadwalanKp(int id) async {
    final response = await get('penjadwalankp/$id');
    return response.body;
  }

  Future<Response<PenjadwalanKp>> postPenjadwalanKp(
          PenjadwalanKp penjadwalankp) async =>
      await post('penjadwalankp', penjadwalankp);
  Future<Response> deletePenjadwalanKp(int id) async =>
      await delete('penjadwalankp/$id');
}
