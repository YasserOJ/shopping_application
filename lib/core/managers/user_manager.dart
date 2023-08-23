import 'package:injectable/injectable.dart';
import 'package:shopping_application/modules/shop/domain/entity/product_entity.dart';

@lazySingleton
class UserManager {
  List<ProductEntity>? allProducts;
  List<ProductEntity> cartItems = [];
  double cartTotal = 0;
}
