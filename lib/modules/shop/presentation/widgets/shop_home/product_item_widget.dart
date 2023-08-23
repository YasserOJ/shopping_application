import 'package:flutter/material.dart';
import 'package:shopping_application/core/constants/app_constants.dart';
import 'package:shopping_application/core/utils/navigation_setup/app_router.gr.dart';
import 'package:shopping_application/core/utils/ui_utils/config_setup/config_manager.dart';
import 'package:shopping_application/core/utils/ui_utils/values/app_colors.dart';
import 'package:shopping_application/core/utils/ui_utils/values/styles.dart';
import 'package:shopping_application/modules/shop/domain/entity/product_entity.dart';

class ProductItemWidget extends StatelessWidget {
  final ProductEntity productEntity;

  const ProductItemWidget({
    super.key,
    required this.productEntity,
  });

  @override
  Widget build(BuildContext context) {
    return ConfigManager(builder: (context, config, router) {
      return GestureDetector(
        onTap: () {
          router.push(
            ProductDetailsRoute(product: productEntity),
          );
        },
        child: Card(
          child: Padding(
            padding: EdgeInsets.all(
              config.getResponsiveItemSize(7),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Hero(
                  tag: '$productHeroAnimationKey${productEntity.id}',
                  child: Container(
                    decoration: BoxDecoration(
                      color: whiteFFFFFF,
                      borderRadius: BorderRadius.circular(
                        config.getResponsiveItemSize(10),
                      ),
                    ),
                    height: config.getHeightResponsiveItemSize(150),
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(
                      horizontal: config.getResponsiveItemSize(3),
                    ),
                    child: FadeInImage(
                      placeholder: const AssetImage('assets/loading.gif'),
                      image: NetworkImage(productEntity.image),
                    ),
                  ),
                ),
                SizedBox(
                  height: config.getResponsiveItemSize(8),
                ),
                Text(
                  productEntity.title,
                  style: boldTextStyle.copyWith(
                    fontSize: config.getResponsiveItemSize(13),
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(
                  height: config.getResponsiveItemSize(8),
                ),
                Text(
                  productEntity.description,
                  style: normalTextStyle.copyWith(
                      fontSize: config.getResponsiveItemSize(12),
                      color: grey969DAA),
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(
                  height: config.getResponsiveItemSize(8),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Spacer(),
                    Flexible(
                      child: Text(
                        '${productEntity.price.toStringAsFixed(2)}€',
                        style: boldTextStyle.copyWith(
                          fontSize: config.getResponsiveItemSize(15),
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
