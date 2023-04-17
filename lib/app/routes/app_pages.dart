import 'package:get/get.dart';

import '../modules/change_password/bindings/change_password_binding.dart';
import '../modules/change_password/views/change_password_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/jadwal_seminar/bindings/jadwal_seminar_binding.dart';
import '../modules/jadwal_seminar/detail_jadwal_seminar/bindings/detail_jadwal_seminar_binding.dart';
import '../modules/jadwal_seminar/detail_jadwal_seminar/views/detail_jadwal_seminar_view.dart';
import '../modules/jadwal_seminar/views/jadwal_seminar_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/success/bindings/success_binding.dart';
import '../modules/success/views/success_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

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
          page: () => DetailJadwalSeminarView(),
          binding: DetailJadwalSeminarBinding(),
        ),
      ],
    ),
  ];
}
