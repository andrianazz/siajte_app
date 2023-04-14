import 'package:get/get.dart';
import 'package:siajte_app/app/theme/variable.dart';

import '../models/role_model.dart';

class RoleProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return Role.fromJson(map);
      if (map is List) return map.map((item) => Role.fromJson(item)).toList();
    };
    httpClient.baseUrl = '$baseUrlAPI/';
  }

  Future<Role?> getRole(int id) async {
    final response = await get('role/$id');
    return response.body;
  }

  Future<Response<Role>> postRole(Role role) async => await post('role', role);
  Future<Response> deleteRole(int id) async => await delete('role/$id');
}
