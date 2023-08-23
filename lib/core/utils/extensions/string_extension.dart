import 'package:shopping_application/core/enums/product_category.dart';

extension ProductCategoryStringExtension on String {
  ProductCategory toProductCategory() {
    switch (toLowerCase()) {
      case "men's clothing":
        return ProductCategory.menClothing;
      case "women's clothing":
        return ProductCategory.womenClothing;
      case 'jewelery':
        return ProductCategory.jewelery;
      case 'electronics':
        return ProductCategory.electronics;
      default:
        return ProductCategory.all;
    }
  }
}
