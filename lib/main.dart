import 'package:flutter/material.dart';
import 'package:test_code/responsive_layout.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 71, 9, 9),
        body: Center(
          child: ResponsiveLayout(),
        ),
      ),
    );
  }
}
