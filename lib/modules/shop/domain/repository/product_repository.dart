import 'package:shopping_application/core/common_models/api_result_model.dart';
import 'package:shopping_application/modules/shop/domain/entity/product_entity.dart';

abstract class ProductRepository {
  Future<ApiResultModel<List<ProductEntity>>> getAllProducts();
}
