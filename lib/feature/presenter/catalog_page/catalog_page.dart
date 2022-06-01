import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_task/feature/domain/repositories/catalog_repository.dart';
import 'package:test_task/feature/presenter/catalog_page/catalog_cubit.dart';
import 'package:test_task/feature/presenter/house_page/house_page.dart';
import 'package:test_task/feature/presenter/widgets/house_card_widget.dart';
import 'package:test_task/feature/ui/colors.dart';

class CatalogPage extends StatelessWidget {
  const CatalogPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          CatalogCubit(catalogRepository: context.read<CatalogRepository>()),
      child: const _CatalogPageView(),
    );
  }
}

class _CatalogPageView extends StatefulWidget {
  const _CatalogPageView({
    Key? key,
  }) : super(key: key);

  @override
  State<_CatalogPageView> createState() => _CatalogPageViewState();
}

class _CatalogPageViewState extends State<_CatalogPageView> {
  @override
  void initState() {
    context.read<CatalogCubit>().getCatalog('all houses');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CatalogCubit, CatalogState>(builder: (context, state) {
      if (state is CatalogLoadSuccess) {
        buttonsRow() {
          return Container(
            padding: const EdgeInsets.only(left: 16, top: 4, bottom: 16),
            height: 52,
            child: Row(
              children: [
                CupertinoButton(
                    color: state.type == 'all houses'
                        ? UIColors.purple
                        : UIColors.grey,
                    borderRadius: const BorderRadius.all(Radius.circular(16)),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Text(
                      'все дома',
                      style: TextStyle(
                          color: state.type == 'all houses'
                              ? UIColors.white
                              : UIColors.black,
                          fontSize: 14),
                    ),
                    onPressed: () => context
                        .read<CatalogCubit>()
                        .filterCatalog('all houses')),
                const SizedBox(
                  width: 16,
                ),
                CupertinoButton(
                    color: state.type == 'a-frame'
                        ? UIColors.purple
                        : UIColors.grey,
                    borderRadius: const BorderRadius.all(Radius.circular(16)),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Text(
                      'A-frame',
                      style: TextStyle(
                          color: state.type == 'a-frame'
                              ? UIColors.white
                              : UIColors.black,
                          fontSize: 14),
                    ),
                    onPressed: () =>
                        context.read<CatalogCubit>().filterCatalog('a-frame')),
                const SizedBox(
                  width: 16,
                ),
                CupertinoButton(
                    color: state.type == 'o-frame'
                        ? UIColors.purple
                        : UIColors.grey,
                    borderRadius: const BorderRadius.all(Radius.circular(16)),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Text(
                      'O-frame',
                      style: TextStyle(
                          color: state.type == 'o-frame'
                              ? UIColors.white
                              : UIColors.black,
                          fontSize: 14),
                    ),
                    onPressed: () =>
                        context.read<CatalogCubit>().filterCatalog('o-frame')),
              ],
            ),
          );
        }

        return Scaffold(
          backgroundColor: UIColors.scaffoldColor,
          appBar: AppBar(
            title: buttonsRow(),
            backgroundColor: UIColors.scaffoldColor,
            toolbarHeight: 52,
            elevation: 0,
          ),
          body: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: state.catalog.length,
              itemBuilder: (context, index) {
                return HouseCard(
                  id: state.catalog[index]?.id,
                  name: state.catalog[index]?.name,
                  image: state.catalog[index]?.images,
                  price: state.catalog[index]?.price,
                  routeToHouseCard: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => HousePage(
                                price: state.catalog[index]!.price,
                                location: state.catalog[index]!.location,
                                description: state.catalog[index]!.description,
                                images: state.catalog[index]!.images,
                                name: state.catalog[index]!.name,
                              ))),
                  location: state.catalog[index]?.location,
                  rating: state.catalog[index]?.rating,
                  reviewCount: state.catalog[index]?.reviewCount,
                );
              }, separatorBuilder: (BuildContext context, int index) { return const SizedBox(height: 16); },),
        );
      }
      return Container(
        color: UIColors.white,
        child: const Center(
          child: CircularProgressIndicator(),
        ),
      );
    });
  }
}
