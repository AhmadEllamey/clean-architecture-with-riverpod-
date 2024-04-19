import 'package:flutter/material.dart';
import '../features/feature_one/presentation/screens/screen_one.dart';
import 'constants/app_constants.dart';

class RouteGenerator {
  static generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    final name = settings.name;
    AppConstants.currentAppRoute = name;
    debugPrint("the name here ----> $name");
    debugPrint("the args here ----> $args");

    switch (name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const ScreenOne());

      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Invalid Route'),
        ),
        body: const Center(
          child: Text('Invalid Route'),
        ),
      );
    });
  }
}
