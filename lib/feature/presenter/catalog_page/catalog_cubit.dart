import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:test_task/feature/domain/entities/catalog/house_entity.dart';
import 'package:test_task/feature/domain/repositories/catalog_repository.dart';

abstract class CatalogState extends Equatable {
  const CatalogState();

  @override
  List<Object?> get props => [];
}

class LoadingState extends CatalogState {
  const LoadingState();
}

class CatalogLoadSuccess extends CatalogState {
  const CatalogLoadSuccess( {required this.type,required this.catalog});

  final List<HouseEntity?> catalog;
  final String? type;

  @override
  List<Object?> get props => [catalog];
}

class ErrorState extends CatalogState {}

class CatalogCubit extends Cubit<CatalogState> {
  CatalogCubit({required this.catalogRepository}) : super(const LoadingState());

  final CatalogRepository catalogRepository;
   List<HouseEntity?> fullCatalog = [];


  Future<void> getCatalog(String? type) async {
    emit(const LoadingState());
    final result = await catalogRepository.getCatalog();
    if (result.success ) {
      fullCatalog = result.data!;
      emit(CatalogLoadSuccess(
        catalog: result.data!,
          type: type
      ));
    } else {
      emit(ErrorState());
    }
  }
  void filterCatalog(String? type)  {
    emit(const LoadingState());

    if(type != 'all houses'){
      var  filteredList = List<HouseEntity>.from(fullCatalog.where((element) => element!.type == type).toList());
      emit(CatalogLoadSuccess(catalog: filteredList, type: type));

    }else {
      emit(CatalogLoadSuccess(catalog: fullCatalog,type: type));
    }
  }
}
