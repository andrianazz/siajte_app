import 'package:get/get.dart';

import '../modules/add_jadwal_kp/bindings/add_jadwal_kp_binding.dart';
import '../modules/add_jadwal_kp/views/add_jadwal_kp_view.dart';
import '../modules/add_mahasiswa/bindings/add_mahasiswa_binding.dart';
import '../modules/add_mahasiswa/views/add_mahasiswa_view.dart';
import '../modules/change_password/bindings/change_password_binding.dart';
import '../modules/change_password/views/change_password_view.dart';
import '../modules/detail_mahasiswa/bindings/detail_mahasiswa_binding.dart';
import '../modules/detail_mahasiswa/views/detail_mahasiswa_view.dart';
import '../modules/detail_riwayat_seminar/bindings/detail_riwayat_seminar_binding.dart';
import '../modules/detail_riwayat_seminar/views/detail_riwayat_seminar_view.dart';
import '../modules/edit_mahasiswa/bindings/edit_mahasiswa_binding.dart';
import '../modules/edit_mahasiswa/views/edit_mahasiswa_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/jadwal_seminar/bindings/jadwal_seminar_binding.dart';
import '../modules/jadwal_seminar/detail_jadwal_seminar/bindings/detail_jadwal_seminar_binding.dart';
import '../modules/jadwal_seminar/detail_jadwal_seminar/views/detail_jadwal_seminar_view.dart';
import '../modules/jadwal_seminar/views/jadwal_seminar_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/mahasiswa/bindings/mahasiswa_binding.dart';
import '../modules/mahasiswa/views/mahasiswa_view.dart';
import '../modules/penilaian_seminar/bindings/penilaian_seminar_binding.dart';
import '../modules/penilaian_seminar/views/penilaian_seminar_view.dart';
import '../modules/riwayat_seminar/bindings/riwayat_seminar_binding.dart';
import '../modules/riwayat_seminar/views/riwayat_seminar_view.dart';
import '../modules/success/bindings/success_binding.dart';
import '../modules/success/views/success_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  // ignore: constant_identifier_names
  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.CHANGE_PASSWORD,
      page: () => const ChangePasswordView(),
      binding: ChangePasswordBinding(),
    ),
    GetPage(
      name: _Paths.SUCCESS,
      page: () => const SuccessView(),
      binding: SuccessBinding(),
    ),
    GetPage(
      name: _Paths.JADWAL_SEMINAR,
      page: () => const JadwalSeminarView(),
      binding: JadwalSeminarBinding(),
      children: [
        GetPage(
          name: _Paths.DETAIL_JADWAL_SEMINAR,
          page: () => const DetailJadwalSeminarView(),
          binding: DetailJadwalSeminarBinding(),
        ),
      ],
    ),
    GetPage(
      name: _Paths.PENILAIAN_SEMINAR,
      page: () => const PenilaianSeminarView(),
      binding: PenilaianSeminarBinding(),
    ),
    GetPage(
      name: _Paths.RIWAYAT_SEMINAR,
      page: () => const RiwayatSeminarView(),
      binding: RiwayatSeminarBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL_RIWAYAT_SEMINAR,
      page: () => const DetailRiwayatSeminarView(),
      binding: DetailRiwayatSeminarBinding(),
    ),
    GetPage(
      name: _Paths.MAHASISWA,
      page: () => const MahasiswaView(),
      binding: MahasiswaBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL_MAHASISWA,
      page: () => const DetailMahasiswaView(),
      binding: DetailMahasiswaBinding(),
    ),
    GetPage(
      name: _Paths.ADD_MAHASISWA,
      page: () => const AddMahasiswaView(),
      binding: AddMahasiswaBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_MAHASISWA,
      page: () => const EditMahasiswaView(),
      binding: EditMahasiswaBinding(),
    ),
    GetPage(
      name: _Paths.ADD_JADWAL_KP,
      page: () => const AddJadwalKpView(),
      binding: AddJadwalKpBinding(),
    ),
  ];
}
