import 'package:flutter/material.dart';
import 'package:test_code/responsive_layout.dart';
import 'core/theme/app_theme.dart';
import 'core/di/service_locator.dart';

void main() {
  ServiceLocator.setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.theme,
      home: const Scaffold(
        body: Center(
          child: ResponsiveLayout(),
        ),
      ),
    );
  }
}
