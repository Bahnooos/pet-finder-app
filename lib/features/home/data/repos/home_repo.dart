import 'package:pet_finder_app/core/networking/api_error_handler.dart';
import 'package:pet_finder_app/core/networking/api_result.dart';
import 'package:pet_finder_app/core/networking/api_service.dart';
import 'package:pet_finder_app/core/networking/models/favorite_item.dart';
import 'package:pet_finder_app/features/home/data/models/favorite_response.dart';
import 'package:pet_finder_app/features/home/data/models/favroite_request_body.dart';
import 'package:pet_finder_app/features/home/data/models/pet_models.dart';

class HomeRepo {
  final ApiService _apiService;

  HomeRepo(this._apiService);

  Future<ApiResult<List<PetModels>>> getPets({
    required int page,
    required int limit,
  }) async {
    try {
      final response = await _apiService.getPets(page, limit);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
  Future<ApiResult<List<FavoriteItem>>> getFavoriteItems() async {
    try {
      final response = await _apiService.getFavorites();
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  Future<ApiResult<FavoriteResponse>> addToFavorites({
    required FavroiteRequestBody favroiteRequestBody,
  }) async {
    try {
      final response = await _apiService.addToFavorite(favroiteRequestBody);
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }
  Future<ApiResult<void>> deleteFavorite(String favoriteId) async {
    try {
      // The API call returns nothing on success, so we use ApiResult<void>
      await _apiService.deleteFavorite(favoriteId);
      return const ApiResult.success(null);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }
}
