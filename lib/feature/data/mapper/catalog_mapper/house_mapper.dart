import 'package:test_task/feature/data/mapper/mapper.dart';
import 'package:test_task/feature/data/model/house_model.dart';
import 'package:test_task/feature/domain/entities/catalog/house_entity.dart';

class HouseResponseMapper extends Mapper<HouseModel, HouseEntity> {
  HouseResponseMapper();

  @override
  HouseEntity? map(HouseModel? entity) {
    return HouseEntity(
        id: entity?.id ?? 0,
        reviewCount: entity?.reviewCount ?? 0,
        rating: entity?.rating ?? 0,
        description: entity?.description ?? '',
        type: entity?.type ?? '',
        price: entity?.price ?? 0,
        images: entity?.images ?? [],
        location: entity?.location ?? '',
        name: entity?.name ?? '');
  }
}
