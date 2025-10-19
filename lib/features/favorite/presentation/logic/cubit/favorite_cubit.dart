import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pet_finder_app/core/networking/api_result.dart';
import 'package:pet_finder_app/features/home/data/repos/home_repo.dart';

import 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  FavoriteCubit(this.homeRepo) : super(FavoriteInitialState());
  final HomeRepo homeRepo;
  Future<void> emitFavoriteStates() async {
    emit(FavoriteLoadingState());
    final response = await homeRepo.getFavoriteItems();
    response.when(
      success: (data) => emit(FavoriteSuccessState(data: data)),
      failure: (errorMessage) =>
          emit(FavoriteErrorState(errorMessage: errorMessage.message)),
    );
  }
}
