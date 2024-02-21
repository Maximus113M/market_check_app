class ProductsByCategoriesModel{
  final int storeId;
  final int categorieId;

  ProductsByCategoriesModel({required this.storeId, required this.categorieId});

  Map<String, dynamic> dataToJson(){
    return {'store_id': storeId, 'categorie_id': categorieId};
  }
}