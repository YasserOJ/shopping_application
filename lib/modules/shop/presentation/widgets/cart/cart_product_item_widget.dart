import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_application/core/utils/ui_utils/config_setup/config_manager.dart';
import 'package:shopping_application/modules/shop/domain/entity/product_entity.dart';
import 'package:shopping_application/modules/shop/presentation/bloc/cart_bloc/cart_bloc.dart';
import 'package:shopping_application/modules/shop/presentation/widgets/cart/cart_view_item_image_widget.dart';
import 'package:shopping_application/modules/shop/presentation/widgets/cart/cart_view_item_information_widget.dart';
import 'package:shopping_application/modules/shop/presentation/widgets/cart/cart_view_item_price_and_quantity_widget.dart';

class CartProductItemWidget extends StatelessWidget {
  const CartProductItemWidget({
    super.key,
    required this.cartItem,
    required this.itemIndex,
  });

  final ProductEntity cartItem;
  final int itemIndex;

  @override
  Widget build(BuildContext context) {
    return ConfigManager(builder: (context, config, _) {
      return Card(
        child: Padding(
          padding: EdgeInsets.all(
            config.getResponsiveItemSize(10),
          ),
          child: Row(
            children: [
              CartViewItemImageWidget(
                productImage: cartItem.image,
              ),
              SizedBox(
                width: config.getResponsiveItemSize(10),
              ),
              Expanded(
                child: SizedBox(
                  height: config.getResponsiveItemSize(130),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CartViewItemInformationWidget(
                        title: cartItem.title,
                        category: cartItem.category,
                        onItemRemoveClicked: () {
                          context.read<CartBloc>().add(RemoveItem(itemIndex));
                        },
                      ),
                      CartViewItemPriceAndQuantityWidget(
                        price: cartItem.price,
                        quantity: cartItem.quantity,
                        onChangeQuantity: (int newQuantity) {
                          context.read<CartBloc>().add(
                                UpdateCartItem(
                                  cartItem.id,
                                  newQuantity,
                                ),
                              );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
