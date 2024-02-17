import 'package:flutter/material.dart';
import 'package:market_check/config/utils/constans/in_app_notification.dart';
import 'package:market_check/features/categories/data/models/categories_model.dart';
import 'package:market_check/features/categories/domain/use_cases/get_categories_use_case.dart';

class CategoriesProvider {
  final GetCategoriesUseCase getCategoriesUseCase;
  List<CategorieModel> categories = [];
  CategoriesProvider({required this.getCategoriesUseCase});

  void getCategories(BuildContext context, int storeId) async {
    final result = await getCategoriesUseCase(storeId);

    result.fold(
        (l) => InAppNotification.serverFailure(
              context: context,
              message: l.message,
            ),
        (r) => categories = r);
  }
}
