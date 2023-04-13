class Konsentrasi {
  int? id;
  String? namaKonsentrasi;
  String? createdAt;
  String? updatedAt;

  Konsentrasi({this.id, this.namaKonsentrasi, this.createdAt, this.updatedAt});

  Konsentrasi.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    namaKonsentrasi = json['nama_konsentrasi'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['nama_konsentrasi'] = namaKonsentrasi;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
