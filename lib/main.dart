import 'package:flutter/material.dart';
import 'package:frontend/services/main_layout.dart';
import 'package:frontend/services/route.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cuti Online',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: MainLayout(),
      initialRoute: AppRoute.main,
      onGenerateRoute: AppRoute.generateRoute,
    );
  }
}
