import 'package:siajte_app/app/data/models/mahasiswa_model.dart';

abstract class Penjadwalan {
  int? id;
  String? mahasiswaNim;
  int? prodiId;
  String? jenisSeminar;
  String? tanggal;
  String? waktu;
  String? lokasi;
  String? statusSeminar;
  String? dibuatOleh;
  String? createdAt;
  String? updatedAt;
  Mahasiswa? mahasiswa;
}
