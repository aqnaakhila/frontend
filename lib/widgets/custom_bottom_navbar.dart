import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  BottomNavBar({required this.selectedIndex, required this.onItemTapped});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior:
          Clip.none, // Pastikan widget di luar batas Stack tidak dipotong
      children: [
        BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.send),
              label: 'Pengajuan',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.approval_rounded),
              label: 'Persetujuan',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profil',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.help),
              label: 'Bantuan',
            ),
          ],
          currentIndex: selectedIndex,
          selectedItemColor: Colors.blueAccent,
          unselectedItemColor: Colors.grey,
          showUnselectedLabels: true,
          backgroundColor: Colors.white,
          elevation: 8.0,
          type: BottomNavigationBarType.fixed,
          onTap: onItemTapped,
        ),
        Positioned(
          bottom:
              20.0, // Tambahkan padding untuk memberi jarak dari body halaman
          left: MediaQuery.of(context).size.width / 2 - 30, // Tengah layar
          child: GestureDetector(
            onTap: () => onItemTapped(2),
            child: Container(
              width: 60.0,
              height: 60.0,
              decoration: BoxDecoration(
                color: Colors.blueAccent,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    spreadRadius: 4,
                    blurRadius: 7,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Icon(
                Icons.home,
                color: Colors.white,
                size: 30.0,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
