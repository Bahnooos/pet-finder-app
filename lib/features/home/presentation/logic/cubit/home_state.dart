import '../../../data/models/pet_models.dart';

sealed class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeSuccess<T> extends HomeState {
  final List<PetModels> pets;
  final Map<String?, String> favoritesMap;
  HomeSuccess({this.pets = const [],
    this.favoritesMap = const {},});
}

class HomeError extends HomeState {
  final String? errorMessage;

  HomeError({required this.errorMessage});
}
