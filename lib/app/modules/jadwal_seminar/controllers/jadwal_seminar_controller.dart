import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:siajte_app/app/data/models/abstact_penjadwalan.dart';
import 'package:siajte_app/app/data/models/dosen_model.dart';
import 'package:siajte_app/app/data/models/mahasiswa_model.dart';
import 'package:siajte_app/app/data/models/penjadwalan_kp_model.dart';
import 'package:siajte_app/app/data/models/penjadwalan_sempro_model.dart';
import 'package:siajte_app/app/data/models/penjadwalan_skripsi_model.dart';
import 'package:siajte_app/app/data/models/prodi_model.dart';
import 'package:siajte_app/app/theme/variable.dart';

class JadwalSeminarController extends GetxController {
  RxList<String> selectedChoice = <String>[].obs;
  List<String> listJenisSeminar = ['Skripsi', 'Proposal', 'KP'];

  RxBool isProposal = true.obs;
  RxBool isKP = true.obs;
  RxBool isSkripsi = true.obs;

  Dio dio = Dio();

  void selectedJenisSeminar(String val) {
    selectedChoice.add(val);
    update();
  }

  Future<List<Mahasiswa>> getMahasiswa() async {
    List<Mahasiswa> listMahasiswa = [];
    var response = await dio.get("$baseUrlAPI/mahasiswa");

    for (var item in response.data['data']) {
      listMahasiswa.add(Mahasiswa.fromJson(item));
    }
    return listMahasiswa;
  }

  Future<List<Dosen>> getDosen() async {
    List<Dosen> listDosen = [];
    var response = await dio.get("$baseUrlAPI/dosen");

    for (var item in response.data['data']) {
      listDosen.add(Dosen.fromJson(item));
    }
    return listDosen;
  }

  Future<List<Prodi>> getProdi() async {
    List<Prodi> listProdi = [];
    var response = await dio.get("$baseUrlAPI/prodi");

    for (var item in response.data['data']) {
      listProdi.add(Prodi.fromJson(item));
    }
    return listProdi;
  }

  Future<List<PenjadwalanKp>> getJadwalSeminarKP() async {
    List<PenjadwalanKp> listJadwalSeminar = [];
    var response = await dio.get("$baseUrlAPI/penjadwalan-kp");

    for (var item in response.data['data']) {
      listJadwalSeminar.add(PenjadwalanKp.fromJson(item));
    }
    return listJadwalSeminar;
  }

  Future<List<PenjadwalanSempro>> getJadwalSempro() async {
    List<PenjadwalanSempro> listJadwalSeminar = [];
    var response = await dio.get("$baseUrlAPI/penjadwalan-sempro");

    for (var item in response.data['data']) {
      listJadwalSeminar.add(PenjadwalanSempro.fromJson(item));
    }
    return listJadwalSeminar;
  }

  Future<List<PenjadwalanSkripsi>> getJadwalSkripsi() async {
    List<PenjadwalanSkripsi> listJadwalSeminar = [];
    var response = await dio.get("$baseUrlAPI/penjadwalan-skripsi");

    for (var item in response.data['data']) {
      listJadwalSeminar.add(PenjadwalanSkripsi.fromJson(item));
    }
    return listJadwalSeminar;
  }

  Future<List<Penjadwalan>> getJadwalSeminar() async {
    List<PenjadwalanKp> listJadwalSeminarKP = await getJadwalSeminarKP();
    List<PenjadwalanSempro> listJadwalSeminarSempro = await getJadwalSempro();
    List<PenjadwalanSkripsi> listJadwalSeminarSkripsi =
        await getJadwalSkripsi();

    List<Penjadwalan> penjadwalan = [];
    for (var item in listJadwalSeminarKP) {
      penjadwalan.add(item);
    }
    for (var item in listJadwalSeminarSempro) {
      penjadwalan.add(item);
    }
    for (var item in listJadwalSeminarSkripsi) {
      penjadwalan.add(item);
    }

    return penjadwalan;
  }

  //get mahasiswa nama with nim
  Future<String> getMahasiswaWithNim(String nim) async {
    var response =
        await dio.post("$baseUrlAPI/mahasiswa/search", data: {"keyword": nim});
    String namaMahasiswa = response.data['data'][0]['nama'];

    return namaMahasiswa;
  }
}
