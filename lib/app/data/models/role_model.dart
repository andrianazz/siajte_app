class Role {
  int? id;
  String? roleAkses;
  String? createdAt;
  String? updatedAt;

  Role({this.id, this.roleAkses, this.createdAt, this.updatedAt});

  Role.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    roleAkses = json['role_akses'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['role_akses'] = roleAkses;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
