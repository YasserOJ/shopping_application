import 'package:shopping_application/modules/shop/data/models/product_response_model.dart';

abstract class ProductsRemoteDataSource {
  Future<List<ProductResponseModel>> getProductsList();
}
