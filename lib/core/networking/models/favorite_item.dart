import 'package:json_annotation/json_annotation.dart';

part 'favorite_item.g.dart';

@JsonSerializable()
class FavoriteItem {
  final int? id;
  @JsonKey(name: 'user_id')
  final String? userId;
  @JsonKey(name: 'image_id')
  final String? imageId;
  @JsonKey(name: 'sub_id')
  final String? subId;
  @JsonKey(name: 'created_at')
  final String? createdAt;
  final FavoriteImage? image;

  FavoriteItem({
     this.id,
     this.userId,
     this.imageId,
    this.subId,
     this.createdAt,
     this.image,
  });

  factory FavoriteItem.fromJson(Map<String, dynamic> json) =>
      _$FavoriteItemFromJson(json);

}

@JsonSerializable()
class FavoriteImage {
  final String? id;
  final String? url;

  FavoriteImage({ this.id,  this.url});

  factory FavoriteImage.fromJson(Map<String, dynamic> json) =>
      _$FavoriteImageFromJson(json);

}