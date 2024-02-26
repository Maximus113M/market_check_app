import 'package:market_check/config/errors/failures.dart';
import 'package:market_check/features/shopping/data/models/shopping_cart_item_model.dart';

import 'package:dartz/dartz.dart';

abstract class ShoppingRepository {
  Future<Either<RemoteFailure, bool>> createNewPurchase(
      List<ShoppingCartItemModel> purchaseItems);
}
