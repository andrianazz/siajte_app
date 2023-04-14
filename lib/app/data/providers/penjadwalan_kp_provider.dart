import 'package:get/get.dart';
import 'package:siajte_app/app/theme/variable.dart';

import '../models/penjadwalan_kp_model.dart';

class PenjadwalanKpProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return PenjadwalanKp.fromJson(map);
      if (map is List) {
        return map.map((item) => PenjadwalanKp.fromJson(item)).toList();
      }
    };
    httpClient.baseUrl = '$baseUrlAPI/';
  }

  Future<PenjadwalanKp?> getPenjadwalanKp(int id) async {
    final response = await get('penjadwalan-kp/$id');
    return response.body;
  }

  Future<Response<PenjadwalanKp>> postPenjadwalanKp(
          PenjadwalanKp penjadwalankp) async =>
      await post('penjadwalan-kp', penjadwalankp);
  Future<Response> deletePenjadwalanKp(int id) async =>
      await delete('penjadwalan-kp/$id');
}
