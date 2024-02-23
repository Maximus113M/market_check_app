import 'package:flutter/material.dart';
import 'package:market_check/config/utils/screen_size.dart';
import 'package:market_check/features/categories/data/models/categories_model.dart';
import 'package:market_check/features/categories/presentation/widgets/categories_listile.dart';


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

