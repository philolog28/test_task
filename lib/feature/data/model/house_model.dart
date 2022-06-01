import 'package:json_annotation/json_annotation.dart';

part 'house_model.g.dart';

@JsonSerializable()
class HouseModel {
  final int? id;
  final String? name;
  final String? location;
  final String? description;
  final String? type;
  final int? rating;
  @JsonKey(name:'review_count')
  final int? reviewCount;
  final List<String?> images;
  final double? price;

  HouseModel(this.name, this.location, this.description, this.type, this.rating,
      this.reviewCount, this.images, this.price, this.id);

  factory HouseModel.fromJson(Object? json) =>
      _$HouseModelFromJson(json as Map<String, dynamic>);

  Map<String, dynamic> toJson() => _$HouseModelToJson(this);
}
