import 'package:equatable/equatable.dart';

class HouseEntity extends Equatable {
  final int? id;
  final String? name;
  final String? location;
  final String? description;
  final String? type;
  final int? rating;
  final int? reviewCount;
  final List<String?> images;
  final double? price;

  const HouseEntity(
      {required this.name,
      required this.location,
      required this.description,
      required this.type,
      required this.rating,
      required this.reviewCount,
      required this.images,
      required this.price,
      required this.id});

  @override
  List<Object?> get props => [
        id,
        price,
        images,
        reviewCount,
        rating,
        type,
        description,
        location,
        name
      ];

}
