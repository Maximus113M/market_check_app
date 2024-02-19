import 'package:dio/dio.dart';
import 'package:market_check/config/errors/exceptions.dart';
import 'package:market_check/config/services/auth/auth_service.dart';
import 'package:market_check/config/services/remote_service/remote_urls.dart';
import 'package:market_check/features/categories/data/models/categories_model.dart';

abstract class CategoriesDataSource {
  Future<List<CategorieModel>> getCategories(int storeId);
}

class CategoriesDataSourceImpl extends CategoriesDataSource {
  final Dio dioGetCategories = Dio(
    BaseOptions(
        baseUrl: "${RemoteUrls.currentUrl}${RemoteUrls.categoriesUrl}",
        headers: AuthService.headers),
  );
  
  @override
  Future<List<CategorieModel>> getCategories(int storeId) async{
    try {
      List<CategorieModel> categories = [];
      if(AuthService.user != null){
        final Response response = await dioGetCategories.get('');
        print(response);
        if(response.statusCode == 200){
          categories = (response.data["categories"] as List).map((categorieJson) => 
          CategorieModel.fromJson(categorieJson)).toList();
          return categories;
        }
      }
      return[];
    } catch (e) {
      print(e);
      throw RemoteException(message: "Ha ocurrido un error al consultar las categorias",
       type: ExceptionType.purchasesException);
    }
  }

  
}
