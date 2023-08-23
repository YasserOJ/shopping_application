import 'package:flutter/material.dart';
import 'package:shopping_application/core/utils/ui_utils/config_setup/config_manager.dart';
import 'package:shopping_application/core/utils/ui_utils/values/app_colors.dart';

class CartViewItemImageWidget extends StatelessWidget {
  const CartViewItemImageWidget({
    super.key,
    required this.productImage,
  });

  final String productImage;

  @override
  Widget build(BuildContext context) {
    return ConfigManager(builder: (context, config, _) {
      return Container(
        decoration: BoxDecoration(
          color: whiteFFFFFF,
          borderRadius: BorderRadius.circular(
            config.getResponsiveItemSize(10),
          ),
        ),
        width: config.getHeightResponsiveItemSize(150),
        height: config.getHeightResponsiveItemSize(150),
        padding: EdgeInsets.symmetric(
          horizontal: config.getResponsiveItemSize(3),
        ),
        child: FadeInImage(
          placeholder: const AssetImage('assets/loading.gif'),
          image: NetworkImage(productImage),
        ),
      );
    });
  }
}
