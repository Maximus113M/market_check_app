import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:market_check/config/utils/utils.dart';
import 'package:market_check/config/services/server/server_urls.dart';
import 'package:market_check/config/shared/widgets/loadings/loadings.dart';
import 'package:market_check/features/categories/data/models/categories_model.dart';
import 'package:market_check/config/shared/widgets/loadings/not_found_placeholder.dart';
import 'package:market_check/features/stores/presentation/providers/stores_provider.dart';
import 'package:market_check/features/products/data/models/products_by_category_model.dart';
import 'package:market_check/features/products/presentation/providers/products_provider.dart';
import 'package:market_check/features/categories/presentation/providers/categories_provider.dart';

import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';

class CategoriesScreen extends StatelessWidget {
  final List<CategorieModel> categoriesList;

  const CategoriesScreen({super.key, required this.categoriesList});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: context.watch<ProductsProvider>().isLoading
          ? Loadings.lottieLoading()
          : SizedBox(
              height: ScreenSize.absoluteHeight * 0.6,
              child: categoriesList.isEmpty
                  ? const NotFoundPlaceHolder(
                      text: 'No se encontraron\ncategorias...',
                    )
                  : GridView.builder(
                      shrinkWrap: true,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 5,
                        mainAxisSpacing: 10,
                        childAspectRatio: 10 / 3,
                      ),
                      itemCount: categoriesList.length,
                      itemBuilder: (context, index) {
                        return Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey, width: 1.5),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(18),
                            ),
                          ),
                          child: CategoriesListItem(
                            categorie: categoriesList[index],
                            storeId:
                                context.read<StoresProvider>().currentStore!.id,
                          ),
                        );
                      },
                    ),
            ),
    );
  }
}

class CategoriesListItem extends StatelessWidget {
  final int storeId;
  final CategorieModel categorie;

  const CategoriesListItem({
    super.key,
    required this.categorie,
    required this.storeId,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<CategoriesProvider>().setCurrentCategorie(categorie);
        context.read<ProductsProvider>().getProductsByCategories(
              context,
              ProductsByCategoriesModel(
                  storeId: storeId, categorieId: categorie.id),
            );
        context.push("/products-categories");
      },
      child: Row(
        children: [
          Container(
            width: ScreenSize.width * 0.15,
            height: ScreenSize.absoluteHeight * 0.066,
            decoration: const BoxDecoration(
              color: AppColors.appSecondary,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16),
                bottomLeft: Radius.circular(16),
              ),
            ),
            child: SizedBox(
              child: Image.network(
                '${ServerUrls.currentImagesUrlCategories}${categorie.image}',
              ),
            ),
          ),
          SizedBox(
            width: ScreenSize.width * 0.3,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                categorie.name,
                style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
            ),
          )
        ],
      ),
    );
  }
}
