import 'package:get/get.dart';

import '../modules/add_jadwal_kp/bindings/add_jadwal_kp_binding.dart';
import '../modules/add_jadwal_kp/views/add_jadwal_kp_view.dart';
import '../modules/add_jadwal_proposal/bindings/add_jadwal_proposal_binding.dart';
import '../modules/add_jadwal_proposal/views/add_jadwal_proposal_view.dart';
import '../modules/add_jadwal_skripsi/bindings/add_jadwal_skripsi_binding.dart';
import '../modules/add_jadwal_skripsi/views/add_jadwal_skripsi_view.dart';
import '../modules/add_mahasiswa/bindings/add_mahasiswa_binding.dart';
import '../modules/add_mahasiswa/views/add_mahasiswa_view.dart';
import '../modules/change_password/bindings/change_password_binding.dart';
import '../modules/change_password/views/change_password_view.dart';
import '../modules/detail_mahasiswa/bindings/detail_mahasiswa_binding.dart';
import '../modules/detail_mahasiswa/views/detail_mahasiswa_view.dart';
import '../modules/detail_riwayat_seminar/bindings/detail_riwayat_seminar_binding.dart';
import '../modules/detail_riwayat_seminar/views/detail_riwayat_seminar_view.dart';
import '../modules/edit_jadwal_kp/bindings/edit_jadwal_kp_binding.dart';
import '../modules/edit_jadwal_kp/views/edit_jadwal_kp_view.dart';
import '../modules/edit_jadwal_proposal/bindings/edit_jadwal_proposal_binding.dart';
import '../modules/edit_jadwal_proposal/views/edit_jadwal_proposal_view.dart';
import '../modules/edit_jadwal_skripsi/bindings/edit_jadwal_skripsi_binding.dart';
import '../modules/edit_jadwal_skripsi/views/edit_jadwal_skripsi_view.dart';
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
import '../modules/penialian_pemb_skipsi/bindings/penialian_pemb_skipsi_binding.dart';
import '../modules/penialian_pemb_skipsi/views/penialian_pemb_skipsi_view.dart';
import '../modules/penilaian_pemb_kp/bindings/penilaian_pemb_kp_binding.dart';
import '../modules/penilaian_pemb_kp/views/penilaian_pemb_kp_view.dart';
import '../modules/penilaian_pemb_proposal/bindings/penilaian_pemb_proposal_binding.dart';
import '../modules/penilaian_pemb_proposal/views/penilaian_pemb_proposal_view.dart';
import '../modules/penilaian_peng_kp/bindings/penilaian_peng_kp_binding.dart';
import '../modules/penilaian_peng_kp/views/penilaian_peng_kp_view.dart';
import '../modules/penilaian_peng_proposal/bindings/penilaian_peng_proposal_binding.dart';
import '../modules/penilaian_peng_proposal/views/penilaian_peng_proposal_view.dart';
import '../modules/penilaian_peng_skripsi/bindings/penilaian_peng_skripsi_binding.dart';
import '../modules/penilaian_peng_skripsi/views/penilaian_peng_skripsi_view.dart';
import '../modules/penilaian_seminar/bindings/penilaian_seminar_binding.dart';
import '../modules/penilaian_seminar/views/penilaian_seminar_view.dart';
import '../modules/persetujuan_kaprodi/bindings/persetujuan_kaprodi_binding.dart';
import '../modules/persetujuan_kaprodi/views/persetujuan_kaprodi_view.dart';
import '../modules/persetujuan_koor_ta/bindings/persetujuan_koor_ta_binding.dart';
import '../modules/persetujuan_koor_ta/views/persetujuan_koor_ta_view.dart';
import '../modules/riwayat_seminar/bindings/riwayat_seminar_binding.dart';
import '../modules/riwayat_seminar/views/riwayat_seminar_view.dart';
import '../modules/success/bindings/success_binding.dart';
import '../modules/success/views/success_view.dart';
import '../modules/web_appearance/bindings/web_appearance_binding.dart';
import '../modules/web_appearance/views/web_appearance_view.dart';

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
    GetPage(
      name: _Paths.ADD_JADWAL_PROPOSAL,
      page: () => const AddJadwalProposalView(),
      binding: AddJadwalProposalBinding(),
    ),
    GetPage(
      name: _Paths.ADD_JADWAL_SKRIPSI,
      page: () => const AddJadwalSkripsiView(),
      binding: AddJadwalSkripsiBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_JADWAL_KP,
      page: () => const EditJadwalKpView(),
      binding: EditJadwalKpBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_JADWAL_PROPOSAL,
      page: () => const EditJadwalProposalView(),
      binding: EditJadwalProposalBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_JADWAL_SKRIPSI,
      page: () => const EditJadwalSkripsiView(),
      binding: EditJadwalSkripsiBinding(),
    ),
    GetPage(
      name: _Paths.PENILAIAN_PEMB_KP,
      page: () => const PenilaianPembKpView(),
      binding: PenilaianPembKpBinding(),
    ),
    GetPage(
      name: _Paths.PENILAIAN_PENG_KP,
      page: () => const PenilaianPengKpView(),
      binding: PenilaianPengKpBinding(),
    ),
    GetPage(
      name: _Paths.PENILAIAN_PEMB_PROPOSAL,
      page: () => const PenilaianPembProposalView(),
      binding: PenilaianPembProposalBinding(),
    ),
    GetPage(
      name: _Paths.PENILAIAN_PENG_PROPOSAL,
      page: () => const PenilaianPengProposalView(),
      binding: PenilaianPengProposalBinding(),
    ),
    GetPage(
      name: _Paths.PENIALIAN_PEMB_SKIPSI,
      page: () => const PenialianPembSkipsiView(),
      binding: PenialianPembSkipsiBinding(),
    ),
    GetPage(
      name: _Paths.PENILAIAN_PENG_SKRIPSI,
      page: () => const PenilaianPengSkripsiView(),
      binding: PenilaianPengSkripsiBinding(),
    ),
    GetPage(
      name: _Paths.WEB_APPEARANCE,
      page: () => const WebAppearanceView(),
      binding: WebAppearanceBinding(),
    ),
    GetPage(
      name: _Paths.PERSETUJUAN_KOOR_TA,
      page: () => const PersetujuanKoorTaView(),
      binding: PersetujuanKoorTaBinding(),
    ),
    GetPage(
      name: _Paths.PERSETUJUAN_KAPRODI,
      page: () => const PersetujuanKaprodiView(),
      binding: PersetujuanKaprodiBinding(),
    ),
  ];
}
