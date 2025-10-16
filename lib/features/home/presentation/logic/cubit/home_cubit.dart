import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pet_finder_app/core/networking/api_result.dart';
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
        emit(HomeSuccess(data: _allProducts));
      },
      failure: (errorMessage) =>
          emit(HomeError(errorMessage: errorMessage.message)),
    );
  }
}
