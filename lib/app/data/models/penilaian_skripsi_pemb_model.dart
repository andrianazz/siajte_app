class PenilaianSkripsiPemb {
  int? id;
  int? penjadwalanSkripsiId;
  String? pembimbingNip;
  dynamic penguasaanDasarTeori;
  dynamic tingkatPenguasaanMateri;
  dynamic tinjauanPustaka;
  dynamic tataTulis;
  dynamic hasilDanPembahasan;
  dynamic sikapDanKepribadian;
  String? totalNilaiAngka;
  String? totalNilaiHuruf;
  String? createdAt;
  String? updatedAt;

  PenilaianSkripsiPemb(
      {this.id,
      this.penjadwalanSkripsiId,
      this.pembimbingNip,
      this.penguasaanDasarTeori,
      this.tingkatPenguasaanMateri,
      this.tinjauanPustaka,
      this.tataTulis,
      this.hasilDanPembahasan,
      this.sikapDanKepribadian,
      this.totalNilaiAngka,
      this.totalNilaiHuruf,
      this.createdAt,
      this.updatedAt});

  PenilaianSkripsiPemb.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    penjadwalanSkripsiId = json['penjadwalan_skripsi_id'];
    pembimbingNip = json['pembimbing_nip'];
    penguasaanDasarTeori = json['penguasaan_dasar_teori'];
    tingkatPenguasaanMateri = json['tingkat_penguasaan_materi'];
    tinjauanPustaka = json['tinjauan_pustaka'];
    tataTulis = json['tata_tulis'];
    hasilDanPembahasan = json['hasil_dan_pembahasan'];
    sikapDanKepribadian = json['sikap_dan_kepribadian'];
    totalNilaiAngka = json['total_nilai_angka'];
    totalNilaiHuruf = json['total_nilai_huruf'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['penjadwalan_skripsi_id'] = penjadwalanSkripsiId;
    data['pembimbing_nip'] = pembimbingNip;
    data['penguasaan_dasar_teori'] = penguasaanDasarTeori;
    data['tingkat_penguasaan_materi'] = tingkatPenguasaanMateri;
    data['tinjauan_pustaka'] = tinjauanPustaka;
    data['tata_tulis'] = tataTulis;
    data['hasil_dan_pembahasan'] = hasilDanPembahasan;
    data['sikap_dan_kepribadian'] = sikapDanKepribadian;
    data['total_nilai_angka'] = totalNilaiAngka;
    data['total_nilai_huruf'] = totalNilaiHuruf;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
