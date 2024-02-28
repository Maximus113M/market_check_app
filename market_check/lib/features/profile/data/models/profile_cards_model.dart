import 'package:market_check/config/utils/constans/app_assets.dart';

class ProfileCardsModel {
  final String title;
  final String imagePath;
  final String route;

  ProfileCardsModel({
    required this.title,
    required this.imagePath,
    required this.route,
  });

  static List<ProfileCardsModel> profileCardsMenu = [
    ProfileCardsModel(
        title: 'Historial\nDe Compra',
        imagePath: AppAssets.shopping,
        route: '/shopping-history'),
    ProfileCardsModel(
        title: 'Tiendas Visitadas', imagePath: AppAssets.stores, route: ''),
    ProfileCardsModel(
        title: 'Productos Favoritos',
        imagePath: AppAssets.favoritesProducts,
        route: ''),
  ];
}
