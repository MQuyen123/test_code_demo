import 'package:flutter/material.dart';
import 'package:test_code/screen/image_detail_sreen.dart';
import 'screen/home_screen.dart';
import 'screen/detail_screen.dart';

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
        color: Colors.blue,
        borderRadius: isMobile ? BorderRadius.zero : BorderRadius.circular(30),
        boxShadow: isMobile
            ? []
            : const [
                BoxShadow(
                  blurRadius: 20,
                  color: Colors.black26,
                )
              ],
      ),
      clipBehavior: Clip.hardEdge,
      child: Navigator(
        initialRoute: '/',
        onGenerateRoute: (settings) {
          switch (settings.name) {
            case '/':
              return MaterialPageRoute(
                builder: (_) => const HomeScreen(),
              );
            case '/detail':
              return MaterialPageRoute(
                builder: (_) => DetailScreen(),
              );
            case '/image':
              return MaterialPageRoute(
                builder: (_) => const ImageDetailSreen(),
              );
            default:
              return null;
          }
        },
      ),
    );
  }
}
