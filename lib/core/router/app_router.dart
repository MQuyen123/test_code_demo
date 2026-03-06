import 'package:flutter/material.dart';
import '../../features/splash/presentation/splash_screen.dart';
import '../../features/intro/presentation/intro_screen.dart';
import '../../features/home/presentation/home_screen.dart';
import '../../features/pin_entry/presentation/pin_entry_screen.dart';
import '../../features/detail/presentation/detail_screen.dart';
import '../../features/map/presentation/map_screen.dart';
import '../../features/home/domain/entities/exhibit_entity.dart';

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
      case map:
        return MaterialPageRoute(builder: (_) => const MapScreen());
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
