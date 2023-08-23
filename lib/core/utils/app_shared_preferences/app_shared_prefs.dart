import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopping_application/core/constants/app_constants.dart';
import 'package:shopping_application/modules/shop/domain/entity/product_entity.dart';

@lazySingleton
class AppSharedPrefs {
  final SharedPreferences? sharedPreferences;

  AppSharedPrefs(this.sharedPreferences);

  List<ProductEntity> getUserCartItems(List<ProductEntity> allProducts) {
    final String? cartStringItems =
        sharedPreferences?.getString(userCartItemsKey);
    if (cartStringItems != null) {
      List<CartItem> cartItems = _cartItemFromMap(cartStringItems);
      if (cartItems.isEmpty) {
        return [];
      }
      List<ProductEntity> products = [];
      for (var cartItem in cartItems) {
        ProductEntity productToAdd = allProducts
            .firstWhere((product) => product.id == cartItem.productId);
        productToAdd.quantity = cartItem.quantity;
        products.add(productToAdd);
      }
      return products;
    } else {
      return [];
    }
  }

  Future<void> saveUserCartItems(List<ProductEntity> cartItems) async {
    final List<CartItem> products = List<CartItem>.from(
      cartItems.map(
        (x) => CartItem(productId: x.id, quantity: x.quantity),
      ),
    );
    await sharedPreferences?.setString(
        userCartItemsKey, _cartItemToMap(products));
  }

  double getSavedCartTotal() {
    double? cartTotal = sharedPreferences?.getDouble(userCartTotalKey);
    return cartTotal ?? 0;
  }

  Future<void> saveCartTotal(double cartTotal) async {
    await sharedPreferences?.setDouble(userCartTotalKey, cartTotal);
  }
}

class CartItem {
  final int productId;
  final int quantity;

  CartItem({
    required this.productId,
    required this.quantity,
  });

  factory CartItem.fromMap(Map<String, dynamic> json) => CartItem(
        productId: json["productId"],
        quantity: json["quantity"],
      );

  Map<String, dynamic> toMap() => {
        "productId": productId,
        "quantity": quantity,
      };
}

List<CartItem> _cartItemFromMap(String str) =>
    List<CartItem>.from(json.decode(str).map((x) => CartItem.fromMap(x)));

String _cartItemToMap(List<CartItem> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toMap())));
