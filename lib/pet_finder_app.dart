import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pet_finder_app/core/routing/app_router.dart';
import 'package:pet_finder_app/core/routing/routes.dart';

class PetFinderApp extends StatelessWidget {
  const PetFinderApp({super.key, required this.appRouter});
  final AppRouter appRouter;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      child:  MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: Routes.onbordingScreen,
        onGenerateRoute: appRouter.generateRoute,
      ),
    );
  }
}
