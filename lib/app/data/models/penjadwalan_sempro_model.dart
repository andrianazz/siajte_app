// ignore_for_file: overridden_fields

import 'package:siajte_app/app/data/models/abstact_penjadwalan.dart';

class PenjadwalanSempro extends Penjadwalan {
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
  String? judulProposal;
  dynamic revisiProposal;
  dynamic catatan1;
  dynamic catatan2;
  dynamic catatan3;
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
  // String? judulProposal;
  // dynamic revisiProposal;
  // dynamic catatan1;
  // dynamic catatan2;
  // dynamic catatan3;

  PenjadwalanSempro(
      {this.id,
      this.mahasiswaNim,
      this.pembimbingsatuNip,
      this.pembimbingduaNip,
      this.pengujisatuNip,
      this.pengujiduaNip,
      this.pengujitigaNip,
      this.prodiId,
      this.jenisSeminar,
      this.judulProposal,
      this.revisiProposal,
      this.catatan1,
      this.catatan2,
      this.catatan3,
      this.tanggal,
      this.waktu,
      this.lokasi,
      this.statusSeminar,
      this.dibuatOleh,
      this.createdAt,
      this.updatedAt});

  PenjadwalanSempro.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    mahasiswaNim = json['mahasiswa_nim'];
    pembimbingsatuNip = json['pembimbingsatu_nip'];
    pembimbingduaNip = json['pembimbingdua_nip'];
    pengujisatuNip = json['pengujisatu_nip'];
    pengujiduaNip = json['pengujidua_nip'];
    pengujitigaNip = json['pengujitiga_nip'];
    prodiId = int.parse(json['prodi_id'].toString());
    jenisSeminar = json['jenis_seminar'];
    judulProposal = json['judul_proposal'];
    revisiProposal = json['revisi_proposal'];
    catatan1 = json['catatan1'];
    catatan2 = json['catatan2'];
    catatan3 = json['catatan3'];
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
    data['judul_proposal'] = judulProposal;
    data['revisi_proposal'] = revisiProposal;
    data['catatan1'] = catatan1;
    data['catatan2'] = catatan2;
    data['catatan3'] = catatan3;
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
