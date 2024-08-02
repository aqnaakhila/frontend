import 'package:flutter/material.dart';
import 'package:frontend/services/main_layout.dart';
import 'package:frontend/views/hak/main_hak.dart';
import 'package:frontend/views/help/main_bantuan.dart';
import 'package:frontend/views/kalender/main_kalender.dart';
import 'package:frontend/views/laporan/main_laporan.dart';
import 'package:frontend/views/pengajuan/form_pengajuan.dart';
import 'package:frontend/views/pengajuan/main_pengajuan.dart';
import 'package:frontend/views/persetujuan/main_persetujuan.dart';
import 'package:frontend/views/profile/main_profile.dart';

class AppRoute {
  static const String main = '/';
  static const String pengajuan = '/pengajuan';
  static const String persetujuan = '/persetujuan';
  static const String laporan = '/laporan';
  static const String kalender = '/kalender';
  static const String hak = '/hak-cuti';
  static const String profile = '/profile';
  static const String help = '/bantuan';
  static const String form = '/form-pengajuan';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case main:
        return MaterialPageRoute(builder: (_) => MainLayout());
      case pengajuan:
        return MaterialPageRoute(builder: (_) => PengajuanPage());
      case persetujuan:
        return MaterialPageRoute(builder: (_) => PersetujanPage());
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
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(body: Text('Page not found')));
    }
  }
}
