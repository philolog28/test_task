import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:test_task/feature/data/mapper/catalog_mapper/house_mapper.dart';
import 'package:test_task/feature/data/mapper/error_mapper.dart';
import 'package:test_task/feature/data/repository/catalog_repository.dart';
import 'package:test_task/feature/domain/repositories/catalog_repository.dart';

Future<Widget> injection(Widget app) async {
  final houseResponseMapper = HouseResponseMapper();
  final errorMapper = ErrorMapper();
  final catalogRepository = CatalogRepositoryImpl(houseResponseMapper, errorMapper);
  return MultiRepositoryProvider(
    providers: [
      RepositoryProvider<CatalogRepository>(create: (_) => catalogRepository),
    ],
    child: app,
  );
}