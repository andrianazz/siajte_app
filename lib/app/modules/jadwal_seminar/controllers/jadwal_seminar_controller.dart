import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:siajte_app/app/data/models/dosen_model.dart';
import 'package:siajte_app/app/data/models/mahasiswa_model.dart';
import 'package:siajte_app/app/data/models/penjadwalan_kp_model.dart';
import 'package:siajte_app/app/data/models/penjadwalan_model.dart';
import 'package:siajte_app/app/data/models/penjadwalan_sempro_model.dart';
import 'package:siajte_app/app/data/models/penjadwalan_skripsi_model.dart';
import 'package:siajte_app/app/data/models/prodi_model.dart';
import 'package:siajte_app/app/theme/variable.dart';

class JadwalSeminarController extends GetxController {
  Dio dio = Dio();

  PenjadwalanModel penjadwalanModel = PenjadwalanModel();
  Mahasiswa mahasiswa = Mahasiswa();
  Dosen dosen = Dosen();
  Prodi prodi = Prodi();

  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
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

  Future<PenjadwalanModel> getJadwalSeminar() async {
    List<PenjadwalanKp> listJadwalSeminarKP = await getJadwalSeminarKP();
    List<PenjadwalanSempro> listJadwalSeminarSempro = await getJadwalSempro();
    List<PenjadwalanSkripsi> listJadwalSeminarSkripsi =
        await getJadwalSkripsi();

    penjadwalanModel = PenjadwalanModel(
        listPenjadwalanKP: listJadwalSeminarKP,
        listPenjadwalanSempro: listJadwalSeminarSempro,
        listPenjadwalanSkripsi: listJadwalSeminarSkripsi);

    return penjadwalanModel;
  }

  //get mahasiswa nama with nim
  Future<String> getMahasiswaWithNim(String nim) async {
    var response =
        await dio.post("$baseUrlAPI/mahasiswa/search", data: {"keyword": nim});
    String namaMahasiswa = response.data['data'][0]['nama'];

    return namaMahasiswa;
  }
}
