import 'package:flutter/material.dart';
import 'package:test_code/mobile_container.dart';

class ResponsiveLayout extends StatelessWidget {
  const ResponsiveLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 600) {
          return const MobileContainer();
        } else {
          return Scaffold(
            body: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/Dinh_doc_lap.webp'),
                  fit: BoxFit.cover,
                ),
              ),
              child: const Center(
                child: MobileContainer(),
              ),
            ),
          );
        }
      },
    );
  }
}
