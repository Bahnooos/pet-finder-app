import 'dart:ui';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:pet_finder_app/pet_finder_app.dart';

import 'core/di/dependency_injection.dart';
import 'core/routing/app_router.dart';
import 'firebase_options_prod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  setupGetIt();
  FlutterError.onError = (flutterErrorDetails) {
    FirebaseCrashlytics.instance.recordFlutterFatalError(flutterErrorDetails);
  };
  PlatformDispatcher.instance.onError = (exception, stack) {
    FirebaseCrashlytics.instance.recordError(exception, stack, fatal: true);
    return true;
  };
  runApp(PetFinderApp(appRouter: AppRouter()));
}

