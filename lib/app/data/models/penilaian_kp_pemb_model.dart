class PenilaianKpPemb {
  int? id;
  int? penjadwalanKpId;
  String? pembimbingNip;
  dynamic presentasi;
  dynamic materi;
  dynamic tanyaJawab;
  dynamic totalNilaiHuruf;
  dynamic totalNilaiAngka;
  dynamic catatan1;
  dynamic catatan2;
  dynamic catatan3;
  dynamic nilaiPembimbingLapangan;
  String? createdAt;
  String? updatedAt;

  PenilaianKpPemb(
      {this.id,
      this.penjadwalanKpId,
      this.pembimbingNip,
      this.presentasi,
      this.materi,
      this.tanyaJawab,
      this.totalNilaiHuruf,
      this.totalNilaiAngka,
      this.catatan1,
      this.catatan2,
      this.catatan3,
      this.nilaiPembimbingLapangan,
      this.createdAt,
      this.updatedAt});

  PenilaianKpPemb.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    penjadwalanKpId = int.parse(json['penjadwalan_kp_id'].toString());
    pembimbingNip = json['pembimbing_nip'];
    presentasi = json['presentasi'];
    materi = json['materi'];
    tanyaJawab = json['tanya_jawab'];
    totalNilaiHuruf = json['total_nilai_huruf'];
    totalNilaiAngka = json['total_nilai_angka'];
    catatan1 = json['catatan1'];
    catatan2 = json['catatan2'];
    catatan3 = json['catatan3'];
    nilaiPembimbingLapangan = json['nilai_pembimbing_lapangan'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['penjadwalan_kp_id'] = penjadwalanKpId;
    data['pembimbing_nip'] = pembimbingNip;
    data['presentasi'] = presentasi;
    data['materi'] = materi;
    data['tanya_jawab'] = tanyaJawab;
    data['total_nilai_huruf'] = totalNilaiHuruf;
    data['total_nilai_angka'] = totalNilaiAngka;
    data['catatan1'] = catatan1;
    data['catatan2'] = catatan2;
    data['catatan3'] = catatan3;
    data['nilai_pembimbing_lapangan'] = nilaiPembimbingLapangan;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
