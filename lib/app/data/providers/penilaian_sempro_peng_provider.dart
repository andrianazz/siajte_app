import 'package:get/get.dart';

import '../models/penilaian_sempro_peng_model.dart';

class PenilaianSemproPengProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return PenilaianSemproPeng.fromJson(map);
      if (map is List)
        return map.map((item) => PenilaianSemproPeng.fromJson(item)).toList();
    };
    httpClient.baseUrl = 'YOUR-API-URL';
  }

  Future<PenilaianSemproPeng?> getPenilaianSemproPeng(int id) async {
    final response = await get('penilaiansempropeng/$id');
    return response.body;
  }

  Future<Response<PenilaianSemproPeng>> postPenilaianSemproPeng(
          PenilaianSemproPeng penilaiansempropeng) async =>
      await post('penilaiansempropeng', penilaiansempropeng);
  Future<Response> deletePenilaianSemproPeng(int id) async =>
      await delete('penilaiansempropeng/$id');
}
