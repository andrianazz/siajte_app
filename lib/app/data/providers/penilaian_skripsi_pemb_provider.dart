import 'package:get/get.dart';

import '../models/penilaian_skripsi_pemb_model.dart';

class PenilaianSkripsiPembProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>)
        return PenilaianSkripsiPemb.fromJson(map);
      if (map is List)
        return map.map((item) => PenilaianSkripsiPemb.fromJson(item)).toList();
    };
    httpClient.baseUrl = 'YOUR-API-URL';
  }

  Future<PenilaianSkripsiPemb?> getPenilaianSkripsiPemb(int id) async {
    final response = await get('penilaianskripsipemb/$id');
    return response.body;
  }

  Future<Response<PenilaianSkripsiPemb>> postPenilaianSkripsiPemb(
          PenilaianSkripsiPemb penilaianskripsipemb) async =>
      await post('penilaianskripsipemb', penilaianskripsipemb);
  Future<Response> deletePenilaianSkripsiPemb(int id) async =>
      await delete('penilaianskripsipemb/$id');
}
