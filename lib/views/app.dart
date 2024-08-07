import 'package:flutter/material.dart';
import 'package:frontend/resources/theme/app_colors.dart';
import 'package:frontend/service/main_layout.dart';
import 'package:frontend/service/route.dart';
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
  int _selectedIndex = 2;

  static List<Widget> _pages() {
    return <Widget>[
      PengajuanPage(),
      PersetujuanPage(),
      HomePage(),
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
