import 'package:flutter/material.dart';
import 'package:test_code/screen/image_detail_sreen.dart';
import 'screen/home_screen.dart';
import 'screen/detail_screen.dart';

class MobileContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    final double width = mediaQuery.size.width;
    final double height = mediaQuery.size.height;
    final isMobile = width < 600;
    return Container(
      width: isMobile ? double.infinity : 375,
      height: isMobile ? double.infinity : 812,
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: isMobile ? BorderRadius.zero : BorderRadius.circular(30),
        boxShadow: isMobile ? [] : [
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
                builder: (_) => HomeScreen(),
              );
            case '/detail':
              return MaterialPageRoute(
                builder: (_) => DetailScreen(),
              );
            case '/image':
              return MaterialPageRoute(
                builder: (_) => ImageDetailSreen(),
              );
            default:
              return null;
          }
        },
      ),
    );
  }
}