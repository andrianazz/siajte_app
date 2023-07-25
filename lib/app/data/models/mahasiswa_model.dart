class Mahasiswa {
  int? id;
  dynamic roleId;
  int? prodiId;
  int? konsentrasiId;
  String? nim;
  String? nama;
  String? angkatan;
  String? email;
  String? createdAt;
  String? updatedAt;

  Mahasiswa(
      {this.id,
      this.roleId,
      this.prodiId,
      this.konsentrasiId,
      this.nim,
      this.nama,
      this.angkatan,
      this.email,
      this.createdAt,
      this.updatedAt});

  Mahasiswa.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    roleId = json['role_id'];
    prodiId = int.parse(json['prodi_id'].toString());
    konsentrasiId = int.parse(json['konsentrasi_id'].toString());
    nim = json['nim'];
    nama = json['nama'];
    angkatan = json['angkatan'];
    email = json['email'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['role_id'] = roleId;
    data['prodi_id'] = prodiId;
    data['konsentrasi_id'] = konsentrasiId;
    data['nim'] = nim;
    data['nama'] = nama;
    data['angkatan'] = angkatan;
    data['email'] = email;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
