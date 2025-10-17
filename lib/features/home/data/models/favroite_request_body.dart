import 'package:json_annotation/json_annotation.dart';

part 'favroite_request_body.g.dart';

@JsonSerializable()
class FavroiteRequestBody {
  @JsonKey(name: 'image_id')
  final String? imageId;
  @JsonKey(name: 'sub_id')
  final String? subId = 'my-user-1234';

 const FavroiteRequestBody({required this.imageId});

  Map<String, dynamic> toJson() =>
      _$FavroiteRequestBodyToJson(this);
}
