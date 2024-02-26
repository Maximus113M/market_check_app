import 'package:flutter/material.dart';

import 'package:market_check/config/utils/utils.dart';
import 'package:market_check/config/services/server/server_urls.dart';
import 'package:market_check/features/stores/data/models/store_model.dart';
import 'package:market_check/features/categories/data/models/categories_model.dart';
import 'package:market_check/features/stores/presentation/providers/stores_provider.dart';
import 'package:market_check/features/products/data/models/products_by_category_model.dart';
import 'package:market_check/features/products/presentation/providers/products_provider.dart';

import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';

class CategoriesScreen extends StatelessWidget {
  final List<CategorieModel> categoriesList;

  const CategoriesScreen({super.key, required this.categoriesList});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: ScreenSize.absoluteHeight * 0.1,
        child: GridView.builder(
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 5,
            mainAxisSpacing: 10,
            childAspectRatio: 10 / 3,
          ),
          itemCount: categoriesList.length,
          itemBuilder: (context, index) {
            final categorie = categoriesList[index];
            return Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                //color: Colors.grey,
                borderRadius: const BorderRadius.all(
                  Radius.circular(18),
                ),
              ),
              child: CategoriesListTile(categorie: categorie),
            );
          },
        ),
      ),
    );
  }
}

class CategoriesListTile extends StatelessWidget {
  const CategoriesListTile({
    super.key,
    required this.categorie,
  });

  final CategorieModel categorie;

  @override
  Widget build(BuildContext context) {
    final StoreModel store = context.read<StoresProvider>().currentStore!;
    final int storeId = store.id;
    final ProductsByCategoriesModel categoriesModel =
        ProductsByCategoriesModel(storeId: storeId, categorieId: categorie.id);

    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
      leading: Container(
        width: 60,
        height: 200,
        decoration: const BoxDecoration(
          color: Colors.indigo,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12),
            bottomLeft: Radius.circular(12),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.network(
            '${ServerUrls.currentImagesUrlCategories}${categorie.image}',
            width: 40,
            height: 50,
          ),
        ),
      ),
      title: Text(
        categorie.name,
        style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
      ),
      onTap: () {
        context
            .read<ProductsProvider>()
            .getProductsByCategories(context, categoriesModel);
        context.push("/products-categories");
      },
    );
  }
}
