import 'package:market_check/config/errors/failures.dart';
import 'package:market_check/features/stores/data/models/store_model.dart';
import 'package:market_check/features/products/data/models/product_model.dart';
import 'package:market_check/features/profile_cards/data/models/purchase_model.dart';
import 'package:market_check/features/profile_cards/data/models/registered_purchase_item.dart';

import 'package:dartz/dartz.dart';

abstract class ProfileCardsRepository {
  Future<Either<RemoteFailure, List<PurchaseModel>>> getShoppingHistory();

  Future<Either<RemoteFailure, List<RegisteredPurchaseItemModel>>>
      getShoppingProducts(int purchaseId);

  Future<Either<RemoteFailure, List<StoreModel>>> getStoresVisited();

  Future<Either<RemoteFailure, List<ProductModel>>> getFavoriteProducts(
      int userId);
}
