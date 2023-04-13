import 'package:get/get.dart';

import '../models/penjadwalan_skripsi_model.dart';

class PenjadwalanSkripsiProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return PenjadwalanSkripsi.fromJson(map);
      if (map is List)
        return map.map((item) => PenjadwalanSkripsi.fromJson(item)).toList();
    };
    httpClient.baseUrl = 'YOUR-API-URL';
  }

  Future<PenjadwalanSkripsi?> getPenjadwalanSkripsi(int id) async {
    final response = await get('penjadwalanskripsi/$id');
    return response.body;
  }

  Future<Response<PenjadwalanSkripsi>> postPenjadwalanSkripsi(
          PenjadwalanSkripsi penjadwalanskripsi) async =>
      await post('penjadwalanskripsi', penjadwalanskripsi);
  Future<Response> deletePenjadwalanSkripsi(int id) async =>
      await delete('penjadwalanskripsi/$id');
}
