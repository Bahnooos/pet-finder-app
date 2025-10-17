// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pet_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PetModels _$PetModelsFromJson(Map<String, dynamic> json) => PetModels(
  id: json['id'] as String?,
  name: json['name'] as String?,
  origin: json['origin'] as String?,
  description: json['description'] as String?,
  wikipediaUrl: json['wikipediaUrl'] as String?,
  hypoallergenic: (json['hypoallergenic'] as num?)?.toInt(),
  referenceImageId: json['referenceImageId'] as String?,
  image: json['image'] == null
      ? null
      : PetImage.fromJson(json['image'] as Map<String, dynamic>),
);

Map<String, dynamic> _$PetModelsToJson(PetModels instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'origin': instance.origin,
  'description': instance.description,
  'wikipediaUrl': instance.wikipediaUrl,
  'hypoallergenic': instance.hypoallergenic,
  'referenceImageId': instance.referenceImageId,
  'image': instance.image,
};

PetImage _$PetImageFromJson(Map<String, dynamic> json) => PetImage(
  id: json['id'] as String?,
  width: (json['width'] as num?)?.toInt(),
  height: (json['height'] as num?)?.toInt(),
  url: json['url'] as String?,
);

Map<String, dynamic> _$PetImageToJson(PetImage instance) => <String, dynamic>{
  'id': instance.id,
  'width': instance.width,
  'height': instance.height,
  'url': instance.url,
};
