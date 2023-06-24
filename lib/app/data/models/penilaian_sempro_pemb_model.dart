class PenilaianSemproPemb {
  int? id;
  int? penjadwalanSemproId;
  String? pembimbingNip;
  String? penguasaanDasarTeori;
  String? tingkatPenguasaanMateri;
  String? tinjauanPustaka;
  String? tataTulis;
  String? sikapDanKepribadian;
  String? totalNilaiAngka;
  String? totalNilaiHuruf;
  String? createdAt;
  String? updatedAt;

  PenilaianSemproPemb(
      {this.id,
      this.penjadwalanSemproId,
      this.pembimbingNip,
      this.penguasaanDasarTeori,
      this.tingkatPenguasaanMateri,
      this.tinjauanPustaka,
      this.tataTulis,
      this.sikapDanKepribadian,
      this.totalNilaiAngka,
      this.totalNilaiHuruf,
      this.createdAt,
      this.updatedAt});

  PenilaianSemproPemb.fromJson(Map<String, dynamic> json) {
    id = int.parse(json['id'].toString());
    penjadwalanSemproId = int.parse(json['penjadwalan_sempro_id'].toString());
    pembimbingNip = json['pembimbing_nip'];
    penguasaanDasarTeori = json['penguasaan_dasar_teori'].toString();
    tingkatPenguasaanMateri = json['tingkat_penguasaan_materi'].toString();
    tinjauanPustaka = json['tinjauan_pustaka'].toString();
    tataTulis = json['tata_tulis'].toString();
    sikapDanKepribadian = json['sikap_dan_kepribadian'].toString();
    totalNilaiAngka = json['total_nilai_angka'];
    totalNilaiHuruf = json['total_nilai_huruf'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['penjadwalan_sempro_id'] = penjadwalanSemproId;
    data['pembimbing_nip'] = pembimbingNip;
    data['penguasaan_dasar_teori'] = penguasaanDasarTeori;
    data['tingkat_penguasaan_materi'] = tingkatPenguasaanMateri;
    data['tinjauan_pustaka'] = tinjauanPustaka;
    data['tata_tulis'] = tataTulis;
    data['sikap_dan_kepribadian'] = sikapDanKepribadian;
    data['total_nilai_angka'] = totalNilaiAngka;
    data['total_nilai_huruf'] = totalNilaiHuruf;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
