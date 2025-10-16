import 'package:json_annotation/json_annotation.dart';

part 'pet_models.g.dart';

@JsonSerializable()
class PetModels {
  final String? id;
  final String? name;
  final String? origin;
  final String? description;
  final String? wikipediaUrl;
  final int? hypoallergenic;
  final String? referenceImageId;
  final PetImage? image;

 const PetModels({
     this.id,
     this.name,
     this.origin,
     this.description,
    this.wikipediaUrl,
     this.hypoallergenic,
    this.referenceImageId,
    this.image,
  });
  factory PetModels.fromJson(Map<String, dynamic> json) =>
      _$PetModelsFromJson(json);
}

@JsonSerializable()
class PetImage {
  final String? id;
  final int? width;
  final int? height;
  final String? url;

 const PetImage({
     this.id,
     this.width,
     this.height,
     this.url,
  });

  factory PetImage.fromJson(Map<String, dynamic> json) =>
      _$PetImageFromJson(json);
}
