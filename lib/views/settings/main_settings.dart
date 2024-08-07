import 'package:flutter/material.dart';
import 'package:frontend/widgets/custom_top_navbar_fitur.dart';

class MainSettings extends StatelessWidget {
  const MainSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomTopNavbarFitur(
        appPage: 'Pengaturan',
        leading: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20.0),
          child: const Column(
            children: [
              Center(
                child: Text('Settings'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
