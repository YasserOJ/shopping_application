import 'package:shopping_application/core/enums/product_category.dart';

extension ProductCategoryExtension on ProductCategory {
  String enumToString() {
    switch (this) {
      case ProductCategory.menClothing:
        return "Men's clothing";
      case ProductCategory.womenClothing:
        return "Women's clothing";
      case ProductCategory.jewelery:
        return 'Jewelery';
      case ProductCategory.electronics:
        return 'Electronics';
      case ProductCategory.all:
        return 'All';
    }
  }
}
