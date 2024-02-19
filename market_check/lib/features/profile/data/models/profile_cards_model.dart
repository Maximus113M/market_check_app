import 'package:market_check/config/utils/constans/app_assets.dart';

class ProfileCardsModel {
  final String title;
  final String imagePath;

  ProfileCardsModel({
    required this.title,
    required this.imagePath,
  });

  static List<ProfileCardsModel> profileCardsMenu = [
    ProfileCardsModel(title: 'Historial\nDe Compra', imagePath: AppAssets.shopping),
    ProfileCardsModel(
        title: 'Tiendas Visitadas', imagePath: AppAssets.stores),
    ProfileCardsModel(
        title: 'Productos Favoritos', imagePath: AppAssets.favoritesProducts),
  ];
}
