import 'package:flutter/material.dart';
import '../../features/splash/presentation/splash_screen.dart';
import '../../features/intro/presentation/intro_screen.dart';
import '../../features/main/presentation/main_screen.dart';
import '../../features/detail/presentation/detail_screen.dart';
import '../../features/home/domain/entities/exhibit_entity.dart';

class AppRouter {
  static const String splash = '/';
  static const String intro = '/intro';
  static const String main = '/main';
  static const String detail = '/detail';

  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case intro:
        return MaterialPageRoute(builder: (_) => const IntroScreen());
      case main:
        final int initialIndex = settings.arguments as int? ?? 0;
        return MaterialPageRoute(
            builder: (_) => MainScreen(initialIndex: initialIndex));
      case detail:
        if (settings.arguments is ExhibitEntity) {
          final exhibit = settings.arguments as ExhibitEntity;
          return MaterialPageRoute(
              builder: (_) => DetailScreen(exhibit: exhibit));
        }
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(child: Text('Missing exhibit data')),
          ),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(child: Text('Route not found!')),
          ),
        );
    }
  }
}
