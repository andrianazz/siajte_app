import 'package:siajte_app/app/data/models/penjadwalan_kp_model.dart';
import 'package:siajte_app/app/data/models/penjadwalan_sempro_model.dart';
import 'package:siajte_app/app/data/models/penjadwalan_skripsi_model.dart';

class PenjadwalanModel {
  List<PenjadwalanKp>? listPenjadwalanKP;
  List<PenjadwalanSempro>? listPenjadwalanSempro;
  List<PenjadwalanSkripsi>? listPenjadwalanSkripsi;

  PenjadwalanModel({
    this.listPenjadwalanKP,
    this.listPenjadwalanSempro,
    this.listPenjadwalanSkripsi,
  });
}
