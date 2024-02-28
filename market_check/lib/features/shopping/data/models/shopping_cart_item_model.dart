import 'package:market_check/features/products/data/models/product_model.dart';

class ShoppingCartItemModel {
  final ProductModel product;
  int quanty;
  int totalPrice;

  ShoppingCartItemModel({
    required this.product,
    this.quanty = 1,
    this.totalPrice = 0,
  });

  void incrementQuanty() {
    quanty++;
    total();
  }

  void decrementQuanty() {
    if (quanty == 0) return;
    quanty--;
    total();
  }

  void total() {
    totalPrice = quanty * product.currentPrice;
  }
}
