class Dosen {
  int? id;
  dynamic roleId;
  dynamic prodiId;
  String? nip;
  String? nama;
  String? namaSingkat;
  String? email;
  String? createdAt;
  String? updatedAt;

  Dosen(
      {this.id,
      this.roleId,
      this.prodiId,
      this.nip,
      this.nama,
      this.namaSingkat,
      this.email,
      this.createdAt,
      this.updatedAt});

  Dosen.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    roleId = json['role_id'];
    prodiId = json['prodi_id'];
    nip = json['nip'];
    nama = json['nama'];
    namaSingkat = json['nama_singkat'];
    email = json['email'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['role_id'] = roleId;
    data['prodi_id'] = prodiId;
    data['nip'] = nip;
    data['nama'] = nama;
    data['nama_singkat'] = namaSingkat;
    data['email'] = email;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
