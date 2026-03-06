import 'package:flutter/material.dart';
import 'package:test_code/mobile_container.dart';
import 'core/theme/app_colors.dart';

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
              decoration: const BoxDecoration(
                gradient: AppColors.bgGradient,
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
