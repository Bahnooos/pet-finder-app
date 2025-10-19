import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pet_finder_app/core/di/dependency_injection.dart';
import 'package:pet_finder_app/features/favorite/presentation/favorite_screen.dart';
import 'package:pet_finder_app/features/favorite/presentation/logic/cubit/favorite_cubit.dart';
import 'package:pet_finder_app/features/home/data/models/pet_models.dart';
import 'package:pet_finder_app/features/home/presentation/home_screen.dart';
import 'package:pet_finder_app/features/home/presentation/logic/cubit/home_cubit.dart';
import 'package:pet_finder_app/features/onboarding/presentation/onboarding_screen.dart';

import '../../features/details/presentation/details_screen.dart';
import 'routes.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.onbordingScreen:
        return MaterialPageRoute(builder: (_) => const OnboardingScreen());
      case Routes.favoriteScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<FavoriteCubit>()..emitFavoriteStates(),
            child: const FavoriteScreen(),
          ),
        );
      case Routes.detailsScreen:
        final args = settings.arguments as PetModels;
        return MaterialPageRoute(builder: (_) => DetailsScreen(pet: args));
      case Routes.homeScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<HomeCubit>()..emitHomeStates(),
            child: const HomeScreen(),
          ),
        );

      default:
        return null;
    }
  }
}
