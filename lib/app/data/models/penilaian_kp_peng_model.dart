class PenilaianKpPeng {
  int? id;
  int? penjadwalanKpId;
  String? pengujiNip;
  dynamic presentasi;
  dynamic materi;
  dynamic tanyaJawab;
  dynamic revisiNaskah1;
  dynamic revisiNaskah2;
  dynamic revisiNaskah3;
  dynamic revisiNaskah4;
  dynamic revisiNaskah5;
  dynamic totalNilaiHuruf;
  dynamic totalNilaiAngka;
  String? createdAt;
  String? updatedAt;

  PenilaianKpPeng(
      {this.id,
      this.penjadwalanKpId,
      this.pengujiNip,
      this.presentasi,
      this.materi,
      this.tanyaJawab,
      this.revisiNaskah1,
      this.revisiNaskah2,
      this.revisiNaskah3,
      this.revisiNaskah4,
      this.revisiNaskah5,
      this.totalNilaiHuruf,
      this.totalNilaiAngka,
      this.createdAt,
      this.updatedAt});

  PenilaianKpPeng.fromJson(Map<String, dynamic> json) {
    id = int.parse(json['id'].toString());
    penjadwalanKpId = int.parse(json['penjadwalan_kp_id'].toString());
    pengujiNip = json['penguji_nip'];
    presentasi = json['presentasi'];
    materi = json['materi'];
    tanyaJawab = json['tanya_jawab'];
    revisiNaskah1 = json['revisi_naskah1'];
    revisiNaskah2 = json['revisi_naskah2'];
    revisiNaskah3 = json['revisi_naskah3'];
    revisiNaskah4 = json['revisi_naskah4'];
    revisiNaskah5 = json['revisi_naskah5'];
    totalNilaiHuruf = json['total_nilai_huruf'];
    totalNilaiAngka = json['total_nilai_angka'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['penjadwalan_kp_id'] = penjadwalanKpId;
    data['penguji_nip'] = pengujiNip;
    data['presentasi'] = presentasi;
    data['materi'] = materi;
    data['tanya_jawab'] = tanyaJawab;
    data['revisi_naskah1'] = revisiNaskah1;
    data['revisi_naskah2'] = revisiNaskah2;
    data['revisi_naskah3'] = revisiNaskah3;
    data['revisi_naskah4'] = revisiNaskah4;
    data['revisi_naskah5'] = revisiNaskah5;
    data['total_nilai_huruf'] = totalNilaiHuruf;
    data['total_nilai_angka'] = totalNilaiAngka;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
