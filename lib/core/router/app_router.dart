import 'package:flutter/material.dart';

class AppRouter {
  static const String splash = '/';
  static const String intro = '/intro';
  static const String home = '/home';
  static const String pinEntry = '/pin';
  static const String detail = '/detail';
  static const String map = '/map';

  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      // Sẽ thêm routes thật khi implement từng feature
      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(child: Text('Route not found!')),
          ),
        );
    }
  }
}
