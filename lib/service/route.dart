import 'package:flutter/material.dart';
import 'package:frontend/service/main_layout.dart';
import 'package:frontend/views/app.dart';
import 'package:frontend/views/hak/main_hak.dart';
import 'package:frontend/views/help/main_bantuan.dart';
import 'package:frontend/views/home/main_home.dart';
import 'package:frontend/views/kalender/main_kalender.dart';
import 'package:frontend/views/laporan/main_laporan.dart';
import 'package:frontend/views/pengajuan/form_pengajuan.dart';
import 'package:frontend/views/pengajuan/main_pengajuan.dart';
import 'package:frontend/views/persetujuan/main_persetujuan.dart';
import 'package:frontend/views/profile/login.dart';
import 'package:frontend/views/profile/main_profile.dart';
import 'package:frontend/views/settings/main_settings.dart';

class AppRoute {
  static const String main = '/';
  static const String home = '/home';
  static const String pengajuan = '/pengajuan';
  static const String persetujuan = '/persetujuan';
  static const String laporan = '/laporan';
  static const String kalender = '/kalender';
  static const String hak = '/hak-cuti';
  static const String profile = '/profile';
  static const String login = '/login';
  static const String help = '/bantuan';
  static const String form = '/form-pengajuan';
  static const String setting = '/settings';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case main:
        return MaterialPageRoute(builder: (_) => MainLayout());
      case home:
        return MaterialPageRoute(builder: (_) => App());
      case pengajuan:
        return MaterialPageRoute(builder: (_) => PengajuanPage());
      case persetujuan:
        return MaterialPageRoute(builder: (_) => PersetujuanPage());
      case profile:
        return MaterialPageRoute(builder: (_) => ProfilePage());
      case hak:
        return MaterialPageRoute(builder: (_) => HakCutiPage());
      case kalender:
        return MaterialPageRoute(builder: (_) => KalenderCutiPage());
      case help:
        return MaterialPageRoute(builder: (_) => BantuanPage());
      case laporan:
        return MaterialPageRoute(builder: (_) => LaporanCutiPage());
      case form:
        return MaterialPageRoute(builder: (_) => FormPengajuan());
      case login:
        return MaterialPageRoute(builder: (_) => Login());
      case setting:
        return MaterialPageRoute(builder: (_) => MainSettings());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(body: Text('Page not found')));
    }
  }
}
