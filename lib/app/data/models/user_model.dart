class User {
  int? id;
  int? roleId;
  String? username;
  String? nama;
  String? email;
  String? createdAt;
  String? updatedAt;

  User(
      {this.id,
      this.roleId,
      this.username,
      this.nama,
      this.email,
      this.createdAt,
      this.updatedAt});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    roleId = json['role_id'];
    username = json['username'];
    nama = json['nama'];
    email = json['email'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['role_id'] = roleId;
    data['username'] = username;
    data['nama'] = nama;
    data['email'] = email;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
