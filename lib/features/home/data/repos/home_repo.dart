import 'package:pet_finder_app/core/networking/api_error_handler.dart';
import 'package:pet_finder_app/core/networking/api_result.dart';
import 'package:pet_finder_app/core/networking/api_service.dart';
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
}
