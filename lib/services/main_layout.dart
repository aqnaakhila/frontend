import 'package:flutter/material.dart';
import 'package:frontend/services/responsive_layout.dart';
import 'package:frontend/views/app.dart';
import 'package:frontend/views/web.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      app: App(),
      desktop: Website(),
    );
  }
}
