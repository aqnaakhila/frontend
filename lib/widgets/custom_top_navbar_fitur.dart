import 'package:flutter/material.dart';
import 'package:frontend/resources/theme/app_colors.dart';

class CustomTopNavbarFitur extends StatelessWidget
    implements PreferredSizeWidget {
  final String appPage;

  const CustomTopNavbarFitur({super.key, required this.appPage});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(appPage),
      backgroundColor: AppColors.contentColorBlue,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kTextTabBarHeight);
}
