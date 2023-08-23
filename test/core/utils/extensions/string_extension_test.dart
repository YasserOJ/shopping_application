import 'package:flutter_test/flutter_test.dart';
import 'package:shopping_application/core/enums/product_category.dart';
import 'package:shopping_application/core/utils/extensions/string_extension.dart';

void main() {
  late String testString;
  late String testString2;
  late String testString3;

  setUp(() {
    testString = "men's clothing";
    testString2 = 'jewelery';
    testString3 = 'electronics';
  });

  group('getProductCategoryFromString function', () {
    test(
        'GIVEN user got productCategory string '
        'WHEN toProductCategory() method is called '
        'THEN it return productCategory enum value', () {
      final productCategory = testString.toProductCategory();
      expect(productCategory, ProductCategory.menClothing);
      final productCategory2 = testString2.toProductCategory();
      expect(productCategory2, ProductCategory.jewelery);
      final productCategory3 = testString3.toProductCategory();
      expect(productCategory3, ProductCategory.electronics);
    });
  });
}
