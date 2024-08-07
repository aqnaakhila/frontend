import 'package:flutter/material.dart';
import 'package:frontend/resources/theme/app_colors.dart';

class CustomTopNavbar extends StatelessWidget implements PreferredSizeWidget {
  final String appName;

  CustomTopNavbar({required this.appName});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 4.0, // menambahkan bayangan pada AppBar
      leading: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Image.asset(
          'assets/images/logo.png',
          height: 64,
          width: 64,
        ),
      ),
      title: Text(
        appName,
        style: TextStyle(
          color: AppColors.mainTextColor1,
          fontWeight: FontWeight.bold, // membuat teks lebih menonjol
          fontSize: 20, // menambah ukuran teks
        ),
      ),
      actions: [
        IconButton(
          icon: Icon(Icons.settings),
          color: AppColors.contentColorWhite,
          onPressed: () {
            showModalBottomSheet(
              context: context,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(16.0),
                ),
              ),
              backgroundColor:
                  AppColors.contentColorWhite, // menyesuaikan warna background
              builder: (BuildContext context) {
                return Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      ListTile(
                        leading: Icon(Icons.person,
                            color: AppColors.contentColorBlue),
                        title: Text(
                          'Profile',
                          style: TextStyle(
                            color: AppColors.contentColorBlack,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        onTap: () {
                          Navigator.pushNamed(context, '/profile');
                        },
                      ),
                      ListTile(
                        leading: Icon(Icons.settings,
                            color: AppColors.contentColorBlue),
                        title: Text(
                          'Pengaturan',
                          style: TextStyle(
                            color: AppColors.contentColorBlack,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        onTap: () {
                          Navigator.pushNamed(context, '/settings');
                        },
                      ),
                      ListTile(
                        leading: Icon(Icons.logout, color: Colors.redAccent),
                        title: Text(
                          'Logout',
                          style: TextStyle(
                            color: AppColors.contentColorBlack,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        onTap: () {
                          Navigator.pushNamed(context, '/login');
                        },
                      ),
                    ],
                  ),
                );
              },
            );
          },
        ),
      ],
      backgroundColor: AppColors.contentColorBlue,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
