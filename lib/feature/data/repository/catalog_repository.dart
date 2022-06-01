import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:test_task/feature/core/either.dart';
import 'package:test_task/feature/data/mapper/catalog_mapper/house_mapper.dart';
import 'package:test_task/feature/data/mapper/error_mapper.dart';
import 'package:test_task/feature/data/model/house_model.dart';
import 'package:test_task/feature/domain/entities/catalog/house_entity.dart';
import 'package:test_task/feature/domain/repositories/catalog_repository.dart';

class CatalogRepositoryImpl implements CatalogRepository {
  const CatalogRepositoryImpl(
    this._catalogResponseMapper,
    this._errorMapper,
  );

  final HouseResponseMapper _catalogResponseMapper;
  final ErrorMapper _errorMapper;

  @override
  Future<Either<List<HouseEntity?>>> getCatalog() async {
    final completer = Completer<Either<List<HouseEntity?>>>();
    try {
      final getCatalogRequest = Uri.parse('https://elki.rent/test/house.json');
      final getCatalogResponse = await http.get(getCatalogRequest);
      final result = (json.decode(getCatalogResponse.body) as List)
          .map((e) => HouseModel.fromJson(e))
          .toList().map((e) => _catalogResponseMapper.map(e)).toList();

      completer.complete(Either.success(result));
    } on Exception catch (e) {
      completer.complete(Either.error(_errorMapper.map(e)));
    }
    return completer.future;
  }
}
