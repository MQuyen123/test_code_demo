import 'package:flutter/material.dart';
import 'core/router/app_router.dart';

class MobileContainer extends StatelessWidget {
  const MobileContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final isMobile = width < 600;
    return Container(
      width: isMobile ? double.infinity : 375,
      height: isMobile ? double.infinity : 812,
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: isMobile ? BorderRadius.zero : BorderRadius.circular(30),
        boxShadow: isMobile
            ? []
            : const [
                BoxShadow(
                  blurRadius: 20,
                  color: Colors.black26,
                  offset: Offset(0, 10),
                )
              ],
      ),
      clipBehavior: Clip.hardEdge,
      child: Navigator(
        initialRoute: AppRouter.splash,
        onGenerateRoute: AppRouter.onGenerateRoute,
      ),
    );
  }
}
