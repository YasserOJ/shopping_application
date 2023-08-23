import 'package:flutter/material.dart';
import 'package:shopping_application/core/utils/ui_utils/config_setup/config_manager.dart';
import 'package:shopping_application/core/utils/ui_utils/values/styles.dart';
import 'package:shopping_application/modules/shop/presentation/widgets/cart/cart_icon_button.dart';

class CartViewItemPriceAndQuantityWidget extends StatefulWidget {
  const CartViewItemPriceAndQuantityWidget({
    super.key,
    required this.price,
    required this.quantity,
    required this.onChangeQuantity,
  });

  final double price;
  final int quantity;
  final Function(int) onChangeQuantity;

  @override
  State<CartViewItemPriceAndQuantityWidget> createState() =>
      _CartViewItemPriceAndQuantityWidgetState();
}

class _CartViewItemPriceAndQuantityWidgetState
    extends State<CartViewItemPriceAndQuantityWidget> {
  late int productQuantity;

  @override
  void initState() {
    super.initState();
    productQuantity = widget.quantity;
  }

  @override
  Widget build(BuildContext context) {
    return ConfigManager(
      builder: (context, config, _) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '${widget.price.toStringAsFixed(2)}€',
              style: boldTextStyle.copyWith(
                fontSize: config.getResponsiveItemSize(14),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.black12,
                borderRadius: BorderRadius.circular(
                  config.getResponsiveItemSize(5),
                ),
              ),
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.all(
                      config.getResponsiveItemSize(3),
                    ),
                    child: CartIconButton(
                      icon: Icons.remove,
                      config: config,
                      onButtonClicked: () {
                        if (productQuantity > 1) {
                          setState(() {
                            productQuantity--;
                          });
                          widget.onChangeQuantity(productQuantity);
                        }
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: config.getResponsiveItemSize(5),
                    ),
                    child: Text(
                      productQuantity.toString(),
                      style: boldTextStyle.copyWith(
                        fontSize: config.getResponsiveItemSize(15),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(
                      config.getResponsiveItemSize(3),
                    ),
                    child: CartIconButton(
                      icon: Icons.add,
                      config: config,
                      onButtonClicked: () {
                        if (productQuantity < 9) {
                          setState(() {
                            productQuantity++;
                          });
                          widget.onChangeQuantity(productQuantity);
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
