import 'package:get/get.dart';

import '../models/penilaian_kp_peng_model.dart';

class PenilaianKpPengProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return PenilaianKpPeng.fromJson(map);
      if (map is List)
        return map.map((item) => PenilaianKpPeng.fromJson(item)).toList();
    };
    httpClient.baseUrl = 'YOUR-API-URL';
  }

  Future<PenilaianKpPeng?> getPenilaianKpPeng(int id) async {
    final response = await get('penilaiankppeng/$id');
    return response.body;
  }

  Future<Response<PenilaianKpPeng>> postPenilaianKpPeng(
          PenilaianKpPeng penilaiankppeng) async =>
      await post('penilaiankppeng', penilaiankppeng);
  Future<Response> deletePenilaianKpPeng(int id) async =>
      await delete('penilaiankppeng/$id');
}
