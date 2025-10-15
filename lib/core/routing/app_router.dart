import 'package:flutter/material.dart';
import 'package:pet_finder_app/features/home/presentation/home_screen.dart';
import 'package:pet_finder_app/features/onboarding/presentation/onboarding_screen.dart';

import 'routes.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.onbordingScreen:
        return MaterialPageRoute(builder: (_) => const OnboardingScreen());
      case Routes.homeScreen:
        return MaterialPageRoute(builder: (_) => const HomeScreen());

      default:
        return null;
    }
  }
}
