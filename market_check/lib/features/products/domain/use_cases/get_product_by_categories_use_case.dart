import 'package:dartz/dartz.dart';
import 'package:market_check/config/errors/failures.dart';
import 'package:market_check/config/use_case/use_case.dart';
import 'package:market_check/features/products/data/models/product_model.dart';
import 'package:market_check/features/products/data/models/products_by_category_model.dart';
import 'package:market_check/features/products/domain/repositories/products_repository.dart';

class GetProductsByCategorie extends UseCase<List<ProductModel>, ProductsByCategoriesModel>{
  final ProductsRepository productsRepository;

  GetProductsByCategorie({required this.productsRepository});
  
  @override
  Future<Either<RemoteFailure, List<ProductModel>>> call(ProductsByCategoriesModel params) async{
    return await productsRepository.getProductsByCategorie(params);
  }

  

}