import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pet_finder_app/core/networking/api_result.dart';
import 'package:pet_finder_app/features/home/data/models/favroite_request_body.dart';
import 'package:pet_finder_app/features/home/data/models/pet_models.dart';
import 'package:pet_finder_app/features/home/data/repos/home_repo.dart';

import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepo homeRepo;
  HomeCubit(this.homeRepo) : super(HomeInitial());
  int page = 0;
  int limit = 0;
  final List<PetModels> _allProducts = [];
  bool hasMore = true;

  Future<void> emitHomeStates() async {
    if (state is HomeSuccess && hasMore == false) return;

    if (!hasMore) {
      page = 0;
      limit = 10;
      hasMore = true;
      emit(HomeLoading());
    }
    final response = await homeRepo.getPets(page: page, limit: limit);
    response.when(
      success: (newData) {
        if (newData.isEmpty) {
          hasMore = false;
        } else {
          _allProducts.addAll(newData);
          page++;
          limit += limit;
        }
        emit(HomeSuccess(pets: _allProducts));
      },
      failure: (errorMessage) =>
          emit(HomeError(errorMessage: errorMessage.message)),
    );
  }
  Future<void> loadInitialFavorites() async {
    if (state is! HomeSuccess) return;
    final currentState = state as HomeSuccess;

    final response = await homeRepo.getFavoriteItems();
    response.when(
      success: (favoriteItems) {
        // Create the map: {petId: favoriteId}
        final newFavoritesMap = {
          for (var item in favoriteItems) item.imageId : item.id.toString()
        };
        emit(HomeSuccess(
          pets: currentState.pets,
          favoritesMap: newFavoritesMap,
        ));
      },
      failure: (_) { /* Do nothing on failure */ },
    );
  }

  Future<void> toggleFavorite({required String petId}) async {
    // 1. Guard Clause: Ensure we are in a success state.
    if (state is! HomeSuccess) return;
    final currentState = state as HomeSuccess;

    final isFavorite = currentState.favoritesMap.containsKey(petId);

    if (isFavorite) {
      final response = await homeRepo.deleteFavorite(petId);
      

      // On success, create a new state without the petId
      response.when(
        success: (_) {
          final newFavoritesMap = Map<String, String>.from(currentState.favoritesMap);
          newFavoritesMap.remove(petId);
          emit(
            HomeSuccess(pets: currentState.pets, favoritesMap: newFavoritesMap),
          );
        },
        failure: (_) => null,
      );
    } else {
      // --- ADD TO FAVORITES ---
      final responseSuccess = await homeRepo.addToFavorites(
        favroiteRequestBody: FavroiteRequestBody(imageId: petId),
      );

      // On success, create a new state with the added petId
      responseSuccess.when(
        success: (favoriteResponse) {
          final newFavoritesMap = Map<String, String>.from(currentState.favoritesMap);
          newFavoritesMap[petId] = favoriteResponse.id??'';
          emit(
            HomeSuccess(pets: currentState.pets, favoritesMap: newFavoritesMap),
          );
        },
        failure: (_) {},
      );
    }
  }
}
