import 'package:flutter/material.dart';
import 'package:frontend/resources/theme/app_colors.dart';

class CustomTopNavbarFitur extends StatelessWidget
    implements PreferredSizeWidget {
  final String appPage;
  final bool leading;

  const CustomTopNavbarFitur(
      {super.key, required this.appPage, required this.leading});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        appPage,
        style: TextStyle(
          color: AppColors.mainTextColor1,
          fontSize: 20, // Menambahkan ukuran font
          fontWeight: FontWeight.bold, // Menambahkan ketebalan font
        ),
      ),
      backgroundColor: AppColors.contentColorBlue,
      automaticallyImplyLeading: leading,
      elevation: 5, // Menambahkan shadow
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(
              20), // Menambahkan border radius pada bagian bawah
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
