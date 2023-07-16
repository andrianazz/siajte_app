class PenilaianSemproPeng {
  int? id;
  int? penjadwalanSemproId;
  String? pengujiNip;
  dynamic presentasi;
  dynamic tingkatPenguasaanMateri;
  dynamic keaslian;
  dynamic ketepatanMetodologi;
  dynamic penguasaanDasarTeori;
  dynamic kecermatanPerumusanMasalah;
  dynamic tinjauanPustaka;
  dynamic tataTulis;
  dynamic sumbanganPemikiran;
  dynamic revisiNaskah1;
  dynamic revisiNaskah2;
  dynamic revisiNaskah3;
  dynamic revisiNaskah4;
  dynamic revisiNaskah5;
  dynamic totalNilaiHuruf;
  dynamic totalNilaiAngka;
  String? createdAt;
  String? updatedAt;

  PenilaianSemproPeng(
      {this.id,
      this.penjadwalanSemproId,
      this.pengujiNip,
      this.presentasi,
      this.tingkatPenguasaanMateri,
      this.keaslian,
      this.ketepatanMetodologi,
      this.penguasaanDasarTeori,
      this.kecermatanPerumusanMasalah,
      this.tinjauanPustaka,
      this.tataTulis,
      this.sumbanganPemikiran,
      this.revisiNaskah1,
      this.revisiNaskah2,
      this.revisiNaskah3,
      this.revisiNaskah4,
      this.revisiNaskah5,
      this.totalNilaiHuruf,
      this.totalNilaiAngka,
      this.createdAt,
      this.updatedAt});

  PenilaianSemproPeng.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    penjadwalanSemproId = int.parse(json['penjadwalan_sempro_id'].toString());
    pengujiNip = json['penguji_nip'];
    presentasi = json['presentasi'];
    tingkatPenguasaanMateri = json['tingkat_penguasaan_materi'];
    keaslian = json['keaslian'];
    ketepatanMetodologi = json['ketepatan_metodologi'];
    penguasaanDasarTeori = json['penguasaan_dasar_teori'];
    kecermatanPerumusanMasalah = json['kecermatan_perumusan_masalah'];
    tinjauanPustaka = json['tinjauan_pustaka'];
    tataTulis = json['tata_tulis'];
    sumbanganPemikiran = json['sumbangan_pemikiran'];
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
    data['penjadwalan_sempro_id'] = penjadwalanSemproId;
    data['penguji_nip'] = pengujiNip;
    data['presentasi'] = presentasi;
    data['tingkat_penguasaan_materi'] = tingkatPenguasaanMateri;
    data['keaslian'] = keaslian;
    data['ketepatan_metodologi'] = ketepatanMetodologi;
    data['penguasaan_dasar_teori'] = penguasaanDasarTeori;
    data['kecermatan_perumusan_masalah'] = kecermatanPerumusanMasalah;
    data['tinjauan_pustaka'] = tinjauanPustaka;
    data['tata_tulis'] = tataTulis;
    data['sumbangan_pemikiran'] = sumbanganPemikiran;
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
