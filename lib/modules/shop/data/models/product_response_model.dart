import 'package:shopping_application/core/enums/product_category.dart';
import 'package:shopping_application/core/utils/extensions/string_extension.dart';
import 'package:shopping_application/core/utils/mapper/data_mapper.dart';
import 'package:shopping_application/modules/shop/domain/entity/product_entity.dart';

class ProductResponseModel implements DataMapper<ProductEntity> {
  final int? id;
  final String? title;
  final double? price;
  final String? description;
  final String? category;
  final String? image;
  final Rating? rating;
  final int? quantity;
  final double? totalPrice;

  ProductResponseModel({
    this.id,
    this.title,
    this.price,
    this.description,
    this.category,
    this.image,
    this.rating,
    this.quantity,
    this.totalPrice,
  });

  factory ProductResponseModel.fromMap(Map<String, dynamic> json) =>
      ProductResponseModel(
        id: json["id"],
        title: json["title"],
        price: json["price"]?.toDouble(),
        description: json["description"],
        category: json["category"],
        image: json["image"],
        rating: json["rating"] == null ? null : Rating.fromMap(json["rating"]),
        quantity: json["quantity"],
        totalPrice: json["totalPrice"]?.toDouble(),
      );

  @override
  ProductEntity mapToEntity() {
    return ProductEntity(
      id: id ?? 0,
      title: title ?? '',
      price: price ?? 0,
      category: category?.toProductCategory() ?? ProductCategory.all,
      image: image ?? '',
      description: description ?? '',
      rating: rating ?? Rating(),
    );
  }
}

class Rating {
  final double? rate;
  final int? count;

  Rating({
    this.rate,
    this.count,
  });

  factory Rating.fromMap(Map<String, dynamic> json) => Rating(
        rate: json["rate"]?.toDouble(),
        count: json["count"],
      );
}
