import 'package:flutter/material.dart';
import 'package:shopping_application/core/utils/ui_utils/config_setup/config_manager.dart';
import 'package:shopping_application/core/utils/ui_utils/values/styles.dart';
import 'package:shopping_application/modules/shop/domain/entity/product_entity.dart';

class ProductDetailsDescriptionWidget extends StatelessWidget {
  const ProductDetailsDescriptionWidget({
    super.key,
    required this.product,
  });

  final ProductEntity product;

  @override
  Widget build(BuildContext context) {
    return ConfigManager(builder: (context, config, _) {
      return Expanded(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: config.getResponsiveItemSize(10),
            ),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: config.getResponsiveItemSize(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Flexible(
                        child: Text(
                          product.title,
                          style: boldTextStyle.copyWith(
                            fontSize: config.getResponsiveItemSize(18),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: config.getResponsiveItemSize(5),
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.star,
                            color: Colors.yellow,
                          ),
                          Text(
                            '${product.rating.rate ?? 0}',
                            style: normalTextStyle.copyWith(
                              fontSize: config.getResponsiveItemSize(14),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Text(
                  product.description,
                  style: normalTextStyle.copyWith(
                    color: Colors.black54,
                    fontSize: config.getResponsiveItemSize(13),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
