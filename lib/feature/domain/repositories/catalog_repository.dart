import 'package:test_task/feature/core/either.dart';

import 'package:test_task/feature/domain/entities/catalog/house_entity.dart';

abstract class CatalogRepository{
  Future<Either<List<HouseEntity?>>> getCatalog();
}