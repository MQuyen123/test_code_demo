import 'package:flutter/material.dart';
import '../../features/splash/presentation/splash_screen.dart';
import '../../features/intro/presentation/intro_screen.dart';
import '../../features/home/presentation/home_screen.dart';
import '../../features/pin_entry/presentation/pin_entry_screen.dart';

class AppRouter {
  static const String splash = '/';
  static const String intro = '/intro';
  static const String home = '/home';
  static const String pinEntry = '/pin';
  static const String detail = '/detail';
  static const String map = '/map';

  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case intro:
        return MaterialPageRoute(builder: (_) => const IntroScreen());
      case home:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case pinEntry:
        return MaterialPageRoute(builder: (_) => const PinEntryScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(child: Text('Route not found!')),
          ),
        );
    }
  }
}
