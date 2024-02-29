import 'package:isar/isar.dart';

part 'shopping_lists_model_to_local.g.dart';

@collection
class ShoppingListModelToLocal {
  Id? id;
  int userId;
  String nameList;
  int totalProductsCounter;
  List<String> products;

  ShoppingListModelToLocal(
      {required this.nameList,
      required this.products,
      required this.userId,
      required this.totalProductsCounter});
}
