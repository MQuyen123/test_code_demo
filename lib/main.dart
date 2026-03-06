import 'package:flutter/material.dart';
import 'package:test_code/responsive_layout.dart';
import 'mobile_container.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
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