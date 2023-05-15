import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:siajte_app/app/data/models/abstact_penjadwalan.dart';
import 'package:siajte_app/app/data/models/dosen_model.dart';
import 'package:siajte_app/app/data/models/mahasiswa_model.dart';
import 'package:siajte_app/app/data/models/penjadwalan_kp_model.dart';
import 'package:siajte_app/app/data/models/penjadwalan_sempro_model.dart';
import 'package:siajte_app/app/data/models/penjadwalan_skripsi_model.dart';
import 'package:siajte_app/app/data/models/prodi_model.dart';
import 'package:siajte_app/app/modules/home/controllers/home_controller.dart';
import 'package:siajte_app/app/theme/variable.dart';

class JadwalSeminarController extends GetxController {
  RxBool isLoading = false.obs;
  RxList<String> selectedChoice = <String>[].obs;
  List<String> listJenisSeminar = ['Skripsi', 'Proposal', 'KP'];

  Dio dio = Dio();

  RxList<Penjadwalan> filterJadwal = <Penjadwalan>[].obs;
  RxList<Penjadwalan> allJadwal = <Penjadwalan>[].obs;

  HomeController homeC = Get.put(HomeController());

  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();

    isLoading.value = true;
    allJadwal.value = await getJadwalSeminar();
    filterJadwal.value = allJadwal;
    isLoading.value = false;

    if (homeC.mapUser['role'] == 'mahasiswa') {
      filterJadwalSeminarWithNim(homeC.mapUser['data']['nim']);
    } else if (homeC.mapUser['role'] == 'dosen') {
      filterJadwalSeminarWithNip(homeC.mapUser['data']['nip']);
    }
  }

  void filterJadwalSeminarWithChoice(List<String> val) async {
    List<Penjadwalan> result = [];

    if (val.isEmpty) {
      result = allJadwal;
    } else {
      result = allJadwal.where((element) {
        return val.contains(element.jenisSeminar);
      }).toList();
    }

    filterJadwal.value = result;
  }

  void filterJadwalSeminarWithName(String nama) async {
    List<Penjadwalan> result = [];

    if (nama.isEmpty) {
      result = allJadwal;
    } else {
      String nim = await getMahasiswaWithNama(nama);

      result = allJadwal.where((element) {
        return element.mahasiswaNim!.toLowerCase().contains(nim.toLowerCase());
      }).toList();
    }

    filterJadwal.value = result;
  }

  void filterJadwalSeminarWithNim(String nimMhs) async {
    List<Penjadwalan> result = [];

    result = allJadwal.where((element) {
      return element.mahasiswaNim!.toLowerCase().contains(nimMhs.toLowerCase());
    }).toList();

    filterJadwal.value = result;
  }

  void filterJadwalSeminarWithNip(String nipDosen) async {
    List<Penjadwalan> result = [];

    if (nipDosen.isEmpty) {
      result = allJadwal;
    } else {
      for (var item in allJadwal) {
        if (item is PenjadwalanKp) {
          result = allJadwal
              .where((p0) => item.pembimbingNip!
                  .toLowerCase()
                  .contains(nipDosen.toLowerCase()))
              .where((element) => item.pengujiNip!
                  .toLowerCase()
                  .contains(nipDosen.toLowerCase()))
              .toList();
        } else if (item is PenjadwalanSempro) {
          result = allJadwal
              .where((p0) => item.pembimbingsatuNip!
                  .toLowerCase()
                  .contains(nipDosen.toLowerCase()))
              .where((element) => item.pembimbingduaNip!
                  .toLowerCase()
                  .contains(nipDosen.toLowerCase()))
              .where((element) => item.pengujisatuNip!
                  .toLowerCase()
                  .contains(nipDosen.toLowerCase()))
              .where((element) => item.pengujiduaNip!
                  .toLowerCase()
                  .contains(nipDosen.toLowerCase()))
              .where((element) => item.pengujitigaNip!
                  .toLowerCase()
                  .contains(nipDosen.toLowerCase()))
              .toList();
        } else if (item is PenjadwalanSkripsi) {
          result = allJadwal
              .where((p0) => item.pembimbingsatuNip!
                  .toLowerCase()
                  .contains(nipDosen.toLowerCase()))
              .where((element) => item.pembimbingduaNip!
                  .toLowerCase()
                  .contains(nipDosen.toLowerCase()))
              .where((element) => item.pengujisatuNip!
                  .toLowerCase()
                  .contains(nipDosen.toLowerCase()))
              .where((element) => item.pengujiduaNip!
                  .toLowerCase()
                  .contains(nipDosen.toLowerCase()))
              .where((element) => item.pengujitigaNip!
                  .toLowerCase()
                  .contains(nipDosen.toLowerCase()))
              .toList();
        }
      }
    }

    filterJadwal.value = result;
  }

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

    if (selectedChoice.isNotEmpty) {
      List<Penjadwalan> penjadwalanFilter = [];
      for (var item in penjadwalan) {
        if (selectedChoice.contains(item.jenisSeminar)) {
          penjadwalanFilter.add(item);
        }
      }
      penjadwalan = penjadwalanFilter;
    } else {
      penjadwalan = penjadwalan;
    }

    penjadwalan.sort((a, b) => b.tanggal!.compareTo(a.tanggal!));

    return penjadwalan;
  }

  //get mahasiswa nama with nim
  Future<String> getMahasiswaWithNim(String nim) async {
    var response =
        await dio.post("$baseUrlAPI/mahasiswa/search", data: {"keyword": nim});
    String namaMahasiswa = response.data['data'][0]['nama'];

    return namaMahasiswa;
  }

  Future<String> getMahasiswaWithNama(String nama) async {
    var response =
        await dio.post("$baseUrlAPI/mahasiswa/search", data: {"keyword": nama});
    String nimMahasiswa = response.data['data'][0]['nim'];

    return nimMahasiswa;
  }
}
