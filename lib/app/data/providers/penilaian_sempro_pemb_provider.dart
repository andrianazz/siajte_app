import 'package:get/get.dart';

import '../models/penilaian_sempro_pemb_model.dart';

class PenilaianSemproPembProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return PenilaianSemproPemb.fromJson(map);
      if (map is List)
        return map.map((item) => PenilaianSemproPemb.fromJson(item)).toList();
    };
    httpClient.baseUrl = 'YOUR-API-URL';
  }

  Future<PenilaianSemproPemb?> getPenilaianSemproPemb(int id) async {
    final response = await get('penilaiansempropemb/$id');
    return response.body;
  }

  Future<Response<PenilaianSemproPemb>> postPenilaianSemproPemb(
          PenilaianSemproPemb penilaiansempropemb) async =>
      await post('penilaiansempropemb', penilaiansempropemb);
  Future<Response> deletePenilaianSemproPemb(int id) async =>
      await delete('penilaiansempropemb/$id');
}
