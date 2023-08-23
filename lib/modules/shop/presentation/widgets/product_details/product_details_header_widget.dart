import 'package:flutter/material.dart';
import 'package:shopping_application/core/constants/app_constants.dart';
import 'package:shopping_application/core/utils/ui_utils/config_setup/config_manager.dart';
import 'package:shopping_application/core/utils/ui_utils/values/app_colors.dart';
import 'package:shopping_application/core/utils/ui_utils/values/styles.dart';
import 'package:shopping_application/generated/l10n.dart';
import 'package:shopping_application/modules/shop/domain/entity/product_entity.dart';

class ProductDetailsHeaderWidget extends StatelessWidget {
  const ProductDetailsHeaderWidget({
    super.key,
    required this.product,
  });

  final ProductEntity product;

  @override
  Widget build(BuildContext context) {
    return ConfigManager(builder: (context, config, router) {
      return Container(
        height: config.screenHeight * .55,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [greyE7EDFC, whiteFFFFFF],
            stops: [.15, .5],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(config.getResponsiveItemSize(40)),
            bottomRight: Radius.circular(config.getResponsiveItemSize(40)),
          ),
        ),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: EdgeInsets.only(
                  top: config.getResponsiveItemSize(15),
                ),
                child: Text(
                  Localized.of(context).product_details_label,
                  style: boldTextStyle.copyWith(
                    fontSize: config.getResponsiveItemSize(27),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: GestureDetector(
                onTap: () {
                  router.pop();
                },
                child: Padding(
                  padding: EdgeInsets.only(
                    top: config.getResponsiveItemSize(15),
                    left: config.getResponsiveItemSize(5),
                  ),
                  child: Icon(
                    Icons.arrow_back,
                    size: config.getResponsiveItemSize(45),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: double.infinity,
                height: config.screenHeight * .45,
                padding: EdgeInsets.only(
                  bottom: config.getResponsiveItemSize(30),
                  left: config.getResponsiveItemSize(15),
                  right: config.getResponsiveItemSize(15),
                ),
                child: Hero(
                  tag: '$productHeroAnimationKey${product.id}',
                  child: FadeInImage(
                    placeholder: const AssetImage('assets/loading.gif'),
                    image: NetworkImage(product.image),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
