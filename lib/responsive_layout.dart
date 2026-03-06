import 'package:flutter/material.dart';
import 'package:test_code/mobile_container.dart';

class ResponsiveLayout extends StatefulWidget {
  const ResponsiveLayout({super.key});

  @override
  State<ResponsiveLayout> createState() => _ResponsiveLayoutState();
}

class _ResponsiveLayoutState extends State<ResponsiveLayout> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 600) {
          return MobileContainer();
        } else {
          return Scaffold(
            backgroundColor: Colors.blue,
            body: Center(
              child: MobileContainer(),
            ),
          );
        }
      },
    );
  }
}