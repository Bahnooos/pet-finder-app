import 'package:json_annotation/json_annotation.dart';
part 'favorite_response.g.dart';
@JsonSerializable()
class FavoriteResponse {
  final String? message;
  final String? id;

  const FavoriteResponse(this.message, this.id);
  factory FavoriteResponse.fromJson(Map<String, dynamic> json) =>
      _$FavoriteResponseFromJson(json);
}
