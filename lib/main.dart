import 'package:flutter/material.dart';
import 'package:pet_finder_app/pet_finder_app.dart';

import 'core/di/dependency_injection.dart';
import 'core/routing/app_router.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupGetIt();
  runApp(PetFinderApp(appRouter: AppRouter()));
}
