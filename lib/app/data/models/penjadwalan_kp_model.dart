import 'package:siajte_app/app/data/models/abstact_penjadwalan.dart';

class PenjadwalanKp extends Penjadwalan {
  int? id;
  String? mahasiswaNim;
  String? pembimbingNip;
  String? pengujiNip;
  int? prodiId;
  String? jenisSeminar;
  String? judulKp;
  String? tanggal;
  String? waktu;
  String? lokasi;
  String? statusSeminar;
  String? dibuatOleh;
  String? createdAt;
  String? updatedAt;

  // String? pembimbingNip;
  // String? pengujiNip;
  // String? judulKp;

  PenjadwalanKp(
      {this.id,
      this.mahasiswaNim,
      this.pembimbingNip,
      this.pengujiNip,
      this.prodiId,
      this.jenisSeminar,
      this.judulKp,
      this.tanggal,
      this.waktu,
      this.lokasi,
      this.statusSeminar,
      this.dibuatOleh,
      this.createdAt,
      this.updatedAt});

  PenjadwalanKp.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    mahasiswaNim = json['mahasiswa_nim'];
    pembimbingNip = json['pembimbing_nip'];
    pengujiNip = json['penguji_nip'];
    prodiId = json['prodi_id'];
    jenisSeminar = json['jenis_seminar'];
    judulKp = json['judul_kp'];
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
    data['pembimbing_nip'] = pembimbingNip;
    data['penguji_nip'] = pengujiNip;
    data['prodi_id'] = prodiId;
    data['jenis_seminar'] = jenisSeminar;
    data['judul_kp'] = judulKp;
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
