import 'package:flutter/material.dart';
import 'package:shopping_application/core/utils/ui_utils/config_setup/config_manager.dart';
import 'package:shopping_application/core/utils/ui_utils/values/styles.dart';

class ShopHomeNoItemsWidget extends StatelessWidget {
  const ShopHomeNoItemsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ConfigManager(builder: (context, config, _) {
      return SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            return Center(
              child: Text(
                'It appears that there are no product.\nPlease pull to refesh our page.',
                style: boldTextStyle.copyWith(
                  color: Colors.black54,
                  fontSize: config.getResponsiveItemSize(20),
                ),
                textAlign: TextAlign.center,
              ),
            );
          },
          childCount: 1,
        ),
      );
    });
  }
}
