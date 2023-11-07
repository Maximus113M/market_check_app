import 'package:market_check/config/utils/constans/app_assets.dart';

class ShoppingItemEntity {
  final String name;
  final String image;
  final int? stock;
  int quanty;
  final double price;
  double totalPrice;

  ShoppingItemEntity({
    required this.name,
    required this.image,
    this.stock,
    this.quanty = 1,
    required this.price,
    this.totalPrice = 0,
  });

  void incrementQuanty() {
    quanty++;
    total();
  }

  void decrementQuanty() {
    quanty--;
    total();
  }

  void total() {
    totalPrice = quanty * price;
  }
}

final shoppingItems = <ShoppingItemEntity>[
  ShoppingItemEntity(
      name: 'Cafe Colombiano',
      image: AppAssets.productReference,
      price: 15000,
      totalPrice: 15000),
  ShoppingItemEntity(
      name: 'Carne de Res 500g Supreme Quality',
      image: AppAssets.productReference2,
      price: 16000,
      totalPrice: 16000),
  ShoppingItemEntity(
      name: 'Chatas 500g',
      image: AppAssets.productReference2,
      price: 18000,
      totalPrice: 18000),
  ShoppingItemEntity(
      name: 'Cafe Peruano',
      image: AppAssets.productReference,
      price: 12000,
      totalPrice: 12000),
];
