import 'abstact_penjadwalan.dart';

class PenjadwalanSkripsi extends Penjadwalan {
  @override
  int? id;
  @override
  String? mahasiswaNim;
  String? pembimbingsatuNip;
  String? pembimbingduaNip;
  String? pengujisatuNip;
  String? pengujiduaNip;
  String? pengujitigaNip;
  @override
  int? prodiId;
  @override
  String? jenisSeminar;
  String? judulSkripsi;
  dynamic revisiSkripsi;
  dynamic catatan;
  @override
  String? tanggal;
  @override
  String? waktu;
  @override
  String? lokasi;
  @override
  String? statusSeminar;
  @override
  String? dibuatOleh;
  @override
  String? createdAt;
  @override
  String? updatedAt;

  // String? pembimbingsatuNip;
  // String? pembimbingduaNip;
  // String? pengujisatuNip;
  // String? pengujiduaNip;
  // String? pengujitigaNip;
  // String? judulSkripsi;
  // dynamic revisiSkripsi;
  // dynamic catatan;

  PenjadwalanSkripsi(
      {this.id,
      this.mahasiswaNim,
      this.pembimbingsatuNip,
      this.pembimbingduaNip,
      this.pengujisatuNip,
      this.pengujiduaNip,
      this.pengujitigaNip,
      this.prodiId,
      this.jenisSeminar,
      this.judulSkripsi,
      this.revisiSkripsi,
      this.catatan,
      this.tanggal,
      this.waktu,
      this.lokasi,
      this.statusSeminar,
      this.dibuatOleh,
      this.createdAt,
      this.updatedAt});

  PenjadwalanSkripsi.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    mahasiswaNim = json['mahasiswa_nim'];
    pembimbingsatuNip = json['pembimbingsatu_nip'];
    pembimbingduaNip = json['pembimbingdua_nip'];
    pengujisatuNip = json['pengujisatu_nip'];
    pengujiduaNip = json['pengujidua_nip'];
    pengujitigaNip = json['pengujitiga_nip'];
    prodiId = json['prodi_id'];
    jenisSeminar = json['jenis_seminar'];
    judulSkripsi = json['judul_skripsi'];
    revisiSkripsi = json['revisi_skripsi'];
    catatan = json['catatan'];
    tanggal = json['tanggal'];
    waktu = json['waktu'];
    lokasi = json['lokasi'];
    statusSeminar = json['status_seminar'];
    dibuatOleh = json['dibuat_oleh'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['mahasiswa_nim'] = mahasiswaNim;
    data['pembimbingsatu_nip'] = pembimbingsatuNip;
    data['pembimbingdua_nip'] = pembimbingduaNip;
    data['pengujisatu_nip'] = pengujisatuNip;
    data['pengujidua_nip'] = pengujiduaNip;
    data['pengujitiga_nip'] = pengujitigaNip;
    data['prodi_id'] = prodiId;
    data['jenis_seminar'] = jenisSeminar;
    data['judul_skripsi'] = judulSkripsi;
    data['revisi_skripsi'] = revisiSkripsi;
    data['catatan'] = catatan;
    data['tanggal'] = tanggal;
    data['waktu'] = waktu;
    data['lokasi'] = lokasi;
    data['status_seminar'] = statusSeminar;
    data['dibuat_oleh'] = dibuatOleh;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
