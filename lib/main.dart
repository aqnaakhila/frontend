import 'package:frontend/state_util.dart';
import 'package:frontend/core.dart';
import 'package:flutter/material.dart';
import 'package:frontend/service/main_layout.dart';
import 'package:frontend/service/route.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runMainApp();
}

runMainApp() async {
  return runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cuti Online',
      navigatorKey: Get.navigatorKey,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: MainLayout(),
      initialRoute: AppRoute.login,
      onGenerateRoute: AppRoute.generateRoute,
    );
  }
}
