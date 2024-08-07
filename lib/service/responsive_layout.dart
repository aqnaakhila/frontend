import 'package:flutter/cupertino.dart';
import 'package:frontend/views/app.dart';
import 'package:frontend/views/web.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget app;
  final Widget desktop;

  ResponsiveLayout({required this.app, required this.desktop});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth < 600) {
        return const App();
      } else {
        return const Website();
      }
    });
  }
}
