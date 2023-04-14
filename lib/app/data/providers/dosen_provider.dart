import 'package:get/get.dart';
import 'package:siajte_app/app/theme/variable.dart';

import '../models/dosen_model.dart';

class DosenProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return Dosen.fromJson(map);
      if (map is List) return map.map((item) => Dosen.fromJson(item)).toList();
    };
    httpClient.baseUrl = '$baseUrlAPI/';
  }

  Future<Dosen?> getDosen(int id) async {
    final response = await get('dosen/$id');
    return response.body;
  }

  Future<Response<Dosen>> postDosen(Dosen dosen) async =>
      await post('dosen', dosen);
  Future<Response> deleteDosen(int id) async => await delete('dosen/$id');
}
