import 'package:flutter/material.dart';
import 'package:shopping_application/core/utils/ui_utils/config_setup/config_manager.dart';
import 'package:shopping_application/core/utils/ui_utils/values/app_colors.dart';
import 'package:shopping_application/core/utils/ui_utils/values/styles.dart';
import 'package:shopping_application/generated/l10n.dart';
import 'package:shopping_application/modules/shop/domain/entity/product_entity.dart';

class ProductDetailsAddToCartButton extends StatelessWidget {
  const ProductDetailsAddToCartButton({
    super.key,
    required this.product,
    this.onButtonTapped,
  });

  final ProductEntity product;
  final Function? onButtonTapped;

  @override
  Widget build(BuildContext context) {
    return ConfigManager(builder: (context, config, _) {
      return Container(
        padding: EdgeInsets.symmetric(
          vertical: config.getResponsiveItemSize(10),
        ),
        child: GestureDetector(
          onTap: () {
            if (onButtonTapped != null) {
              onButtonTapped?.call();
            }
          },
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: config.getResponsiveItemSize(15),
              vertical: config.getResponsiveItemSize(20),
            ),
            decoration: BoxDecoration(
              color: blue1C43CB,
              borderRadius: BorderRadius.circular(
                config.getResponsiveItemSize(15),
              ),
            ),
            child: Text(
              '${Localized.of(context).add_to_cart_label} - ${product.price.toStringAsFixed(2)}€',
              style: boldTextStyle.copyWith(
                color: whiteFFFFFF,
                fontSize: config.getResponsiveItemSize(17),
              ),
            ),
          ),
        ),
      );
    });
  }
}
