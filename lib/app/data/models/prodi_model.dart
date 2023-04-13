class Prodi {
  int? id;
  String? namaProdi;
  String? createdAt;
  String? updatedAt;

  Prodi({this.id, this.namaProdi, this.createdAt, this.updatedAt});

  Prodi.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    namaProdi = json['nama_prodi'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['nama_prodi'] = namaProdi;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
