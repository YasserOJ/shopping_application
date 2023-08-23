import 'package:flutter/material.dart';
import 'package:shopping_application/core/utils/navigation_setup/app_router.gr.dart';
import 'package:shopping_application/core/utils/ui_utils/config_setup/config_manager.dart';
import 'package:shopping_application/core/utils/ui_utils/values/app_colors.dart';
import 'package:shopping_application/core/utils/ui_utils/values/styles.dart';
import 'package:shopping_application/generated/l10n.dart';
import 'package:shopping_application/modules/shop/presentation/widgets/shop_home/shop_home_cart_total_widget.dart';

class ShopHomeHeaderWidget extends StatelessWidget {
  const ShopHomeHeaderWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ConfigManager(
      builder: (context, config, router) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: config.getResponsiveItemSize(25),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    Localized.of(context).discover_label,
                    style: boldTextStyle.copyWith(
                      fontSize: config.getResponsiveItemSize(30),
                    ),
                  ),
                  Text(
                    Localized.of(context).home_subtitle_label,
                    style: normalTextStyle.copyWith(
                      fontSize: config.getResponsiveItemSize(15),
                      color: grey969DAA,
                    ),
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: () {
                  router.push(const CartRoute());
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ShopHomeCartTotalWidget(
                      config: config,
                    ),
                    const Icon(Icons.shopping_cart_rounded),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
