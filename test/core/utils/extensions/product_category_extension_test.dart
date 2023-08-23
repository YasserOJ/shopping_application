import 'package:flutter_test/flutter_test.dart';
import 'package:shopping_application/core/enums/product_category.dart';
import 'package:shopping_application/core/utils/extensions/product_category_extension.dart';
import 'package:shopping_application/core/utils/extensions/string_extension.dart';

void main() {
  late ProductCategory testString;
  late ProductCategory testString2;
  late ProductCategory testString3;
  late ProductCategory testString4;

  setUp(() {
    testString = ProductCategory.menClothing;
    testString2 = ProductCategory.jewelery;
    testString3 = ProductCategory.electronics;
    testString4 = ProductCategory.all;
  });

  group('getStringFromProductCategory function', () {
    test(
        'GIVEN user got productCategory'
        'WHEN enumToString() method is called '
        'THEN it return productCategory string value', () {
      final productCategory = testString.enumToString();
      expect(productCategory, "Men's clothing");
      final productCategory2 = testString2.enumToString();
      expect(productCategory2, 'Jewelery');
      final productCategory3 = testString3.enumToString();
      expect(productCategory3, 'Electronics');
      final productCategory4 = testString4.enumToString();
      expect(productCategory4, 'All');
    });
  });
}
