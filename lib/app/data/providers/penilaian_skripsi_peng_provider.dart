import 'package:get/get.dart';

import '../models/penilaian_skripsi_peng_model.dart';

class PenilaianSkripsiPengProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>)
        return PenilaianSkripsiPeng.fromJson(map);
      if (map is List)
        return map.map((item) => PenilaianSkripsiPeng.fromJson(item)).toList();
    };
    httpClient.baseUrl = 'YOUR-API-URL';
  }

  Future<PenilaianSkripsiPeng?> getPenilaianSkripsiPeng(int id) async {
    final response = await get('penilaianskripsipeng/$id');
    return response.body;
  }

  Future<Response<PenilaianSkripsiPeng>> postPenilaianSkripsiPeng(
          PenilaianSkripsiPeng penilaianskripsipeng) async =>
      await post('penilaianskripsipeng', penilaianskripsipeng);
  Future<Response> deletePenilaianSkripsiPeng(int id) async =>
      await delete('penilaianskripsipeng/$id');
}
