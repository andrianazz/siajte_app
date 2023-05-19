import 'package:get/get.dart';

import '../models/penilaian_kp_pemb_model.dart';

class PenilaianKpPembProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return PenilaianKpPemb.fromJson(map);
      if (map is List)
        return map.map((item) => PenilaianKpPemb.fromJson(item)).toList();
    };
    httpClient.baseUrl = 'YOUR-API-URL';
  }

  Future<PenilaianKpPemb?> getPenilaianKpPemb(int id) async {
    final response = await get('penilaiankppemb/$id');
    return response.body;
  }

  Future<Response<PenilaianKpPemb>> postPenilaianKpPemb(
          PenilaianKpPemb penilaiankppemb) async =>
      await post('penilaiankppemb', penilaiankppemb);
  Future<Response> deletePenilaianKpPemb(int id) async =>
      await delete('penilaiankppemb/$id');
}
