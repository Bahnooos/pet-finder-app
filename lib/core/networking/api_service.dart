import 'package:dio/dio.dart';
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
}
