import 'package:dio/dio.dart';
import 'package:pet_finder_app/core/networking/models/favorite_item.dart';
import 'package:pet_finder_app/features/home/data/models/favorite_response.dart';
import 'package:pet_finder_app/features/home/data/models/favroite_request_body.dart';
import 'package:pet_finder_app/features/home/data/models/pet_models.dart';
import 'package:retrofit/retrofit.dart';

import 'api_constants.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;
  @GET(ApiConstants.breeds)
  Future<List<PetModels>> getPets(
    @Header('page') int page,
    @Header('limit') int limit,
  );
  @GET(ApiConstants.favorites)
  Future<List<FavoriteItem>> getFavorites();

  @POST(ApiConstants.favorites)
  Future<FavoriteResponse> addToFavorite(
    @Body() FavroiteRequestBody favroiteRequestBody,
  );

  @DELETE("${ApiConstants.favorites}/{favorite_id}")
  Future<void> deleteFavorite(@Path("favorite_id") String favoriteId);
}
