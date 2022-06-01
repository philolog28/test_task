// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'house_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HouseModel _$HouseModelFromJson(Map<String, dynamic> json) => HouseModel(
      json['name'] as String?,
      json['location'] as String?,
      json['description'] as String?,
      json['type'] as String?,
      json['rating'] as int?,
      json['review_count'] as int?,
      (json['images'] as List<dynamic>).map((e) => e as String?).toList(),
      (json['price'] as num?)?.toDouble(),
      json['id'] as int?,
    );

Map<String, dynamic> _$HouseModelToJson(HouseModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'location': instance.location,
      'description': instance.description,
      'type': instance.type,
      'rating': instance.rating,
      'review_count': instance.reviewCount,
      'images': instance.images,
      'price': instance.price,
    };
