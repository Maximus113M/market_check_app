import 'package:flutter/material.dart';
import 'package:market_check/config/services/remote_service/remote_urls.dart';
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
              child: ListTile(
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
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
                      '${RemoteUrls.currentImagesUrlCategories}${categorie.image!}',
                      width: 40,
                      height: 50,
                    ),
                  ),
                ),
                title: Text(
                  categorie.name,
                  style: const TextStyle(
                      fontSize: 12, fontWeight: FontWeight.w500),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
