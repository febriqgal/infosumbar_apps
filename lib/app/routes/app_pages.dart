import 'package:get/get.dart';

import '../modules/akun/bindings/akun_binding.dart';
import '../modules/akun/views/akun_view.dart';
import '../modules/berita_utama/bindings/berita_utama_binding.dart';
import '../modules/berita_utama/views/berita_utama_view.dart';
import '../modules/beritasaya/bindings/beritasaya_binding.dart';
import '../modules/beritasaya/views/beritasaya_view.dart';
import '../modules/detailberita/bindings/detailberita_binding.dart';
import '../modules/detailberita/views/detailberita_view.dart';
import '../modules/edit_akun/bindings/edit_akun_binding.dart';
import '../modules/edit_akun/views/edit_akun_view.dart';
import '../modules/edit_berita/bindings/edit_berita_binding.dart';
import '../modules/edit_berita/views/edit_berita_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/introduction_page/bindings/introduction_page_binding.dart';
import '../modules/introduction_page/views/introduction_page_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/pencarian/bindings/pencarian_binding.dart';
import '../modules/pencarian/views/pencarian_view.dart';
import '../modules/pengaturan/bindings/pengaturan_binding.dart';
import '../modules/pengaturan/views/pengaturan_view.dart';
import '../modules/tambahberita/bindings/tambahberita_binding.dart';
import '../modules/tambahberita/views/tambahberita_view.dart';

// ignore_for_file: constant_identifier_names

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
      name: _Paths.PENGATURAN,
      page: () => const PengaturanView(),
      binding: PengaturanBinding(),
    ),
    GetPage(
      name: _Paths.TAMBAHBERITA,
      page: () => const TambahberitaView(),
      binding: TambahberitaBinding(),
    ),
    GetPage(
      name: _Paths.DETAILBERITA,
      page: () => const DetailberitaView(),
      binding: DetailberitaBinding(),
    ),
    GetPage(
      name: _Paths.PENCARIAN,
      page: () => const PencarianView(),
      binding: PencarianBinding(),
    ),
    GetPage(
      name: _Paths.BERITA_UTAMA,
      page: () => const BeritautamaView(),
      binding: BeritaUtamaBinding(),
    ),
    GetPage(
      name: _Paths.AKUN,
      page: () => const ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.BERITASAYA,
      page: () => const BeritasayaView(),
      binding: BeritasayaBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_BERITA,
      page: () => const EditBeritaView(),
      binding: EditBeritaBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_AKUN,
      page: () => const EditAkunView(),
      binding: EditAkunBinding(),
    ),
    GetPage(
      name: _Paths.INTRODUCTION_PAGE,
      page: () => const IntroductionPageView(),
      binding: IntroductionPageBinding(),
    ),
  ];
}
