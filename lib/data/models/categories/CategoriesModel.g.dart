// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'CategoriesModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CuisineModel _$CuisineModelFromJson(Map<String, dynamic> json) => CuisineModel(
  image: json['image'] as String,
  title: json['title'] as String,
  id: (json['id'] as num).toInt(),
);

Map<String, dynamic> _$CuisineModelToJson(CuisineModel instance) =>
    <String, dynamic>{
      'image': instance.image,
      'title': instance.title,
      'id': instance.id,
    };
