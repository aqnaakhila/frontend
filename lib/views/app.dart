import 'package:flutter/material.dart';
import 'package:frontend/services/main_layout.dart';
import 'package:frontend/services/route.dart';
import 'package:frontend/views/hak/main_hak.dart';
import 'package:frontend/views/help/main_bantuan.dart';
import 'package:frontend/views/home/main_home.dart';
import 'package:frontend/views/kalender/main_kalender.dart';
import 'package:frontend/views/laporan/main_laporan.dart';
import 'package:frontend/views/pengajuan/main_pengajuan.dart';
import 'package:frontend/views/persetujuan/main_persetujuan.dart';
import 'package:frontend/views/profile/main_profile.dart';
import 'package:frontend/widgets/custom_bottom_navbar.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  int _selectedIndex = 0;

  static List<Widget> _pages() {
    return <Widget>[
      MainLayout(),
      PengajuanPage(),
      PersetujanPage(),
      KalenderCutiPage(),
      HakCutiPage(),
      ProfilePage(),
      BantuanPage(),
    ];
  }

  void _onItemtapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages().elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemtapped,
      ),
    );
  }
}
