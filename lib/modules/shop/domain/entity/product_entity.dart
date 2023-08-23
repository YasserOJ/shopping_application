import 'package:shopping_application/core/enums/product_category.dart';
import 'package:shopping_application/modules/shop/data/models/product_response_model.dart';

class ProductEntity {
  final int id;
  final String title;
  final double price;
  final String description;
  final ProductCategory category;
  final String image;
  final Rating rating;
  int quantity;
  double totalPrice;

  ProductEntity({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    required this.rating,
    this.quantity = 0,
    this.totalPrice = 0,
  });
}
