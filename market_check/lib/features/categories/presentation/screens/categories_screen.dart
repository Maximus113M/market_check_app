import 'package:flutter/material.dart';
import 'package:market_check/config/utils/constans/app_colors.dart';
import 'package:market_check/config/utils/screen_size.dart';
import 'package:market_check/features/categories/data/models/categories_model.dart';

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
            crossAxisSpacing: 12,
            mainAxisSpacing: 12), 
            itemCount: categoriesList.length,
          itemBuilder: (context, index) {
            final categorie = categoriesList[index];
            return Container(
              color: AppColors.appSecondary,
              child: Text(categorie.name),
            );
          },
        ),
      ),
    );
  }
}