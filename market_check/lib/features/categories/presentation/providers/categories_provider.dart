import 'package:flutter/material.dart';

import 'package:market_check/config/utils/constans/in_app_notification.dart';
import 'package:market_check/features/categories/data/models/categories_model.dart';
import 'package:market_check/features/stores/presentation/providers/stores_provider.dart';
import 'package:market_check/features/categories/domain/use_cases/get_categories_use_case.dart';

import 'package:provider/provider.dart';

class CategoriesProvider extends ChangeNotifier {
  final GetCategoriesUseCase getCategoriesUseCase;
  List<CategorieModel> categories = [];
  CategorieModel? currentCategories;
  CategoriesProvider({required this.getCategoriesUseCase});

  void getCategories(BuildContext context) async {
    final storeId = context.read<StoresProvider>().currentStore!.id;
    final result = await getCategoriesUseCase(storeId);
    print(result);
    result.fold(
        (l) => InAppNotification.serverFailure(
              context: context,
              message: l.message,
            ),
        (r) => categories = r);
    notifyListeners();
  }
}
