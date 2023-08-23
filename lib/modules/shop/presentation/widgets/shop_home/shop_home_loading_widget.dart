import 'package:flutter/material.dart';
import 'package:shopping_application/core/utils/ui_utils/config_setup/config_manager.dart';
import 'package:shopping_application/core/utils/ui_utils/values/app_colors.dart';

class ShopHomeLoadingWidget extends StatelessWidget {
  const ShopHomeLoadingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ConfigManager(builder: (context, config, _) {
      return Container(
        color: Colors.black38,
        child: Center(
          child: Container(
            width: config.screenWidth * .2,
            height: config.screenWidth * .2,
            decoration: BoxDecoration(
              color: whiteFFFFFF,
              borderRadius: BorderRadius.circular(
                config.getResponsiveItemSize(15),
              ),
            ),
            child: const Center(
              child: CircularProgressIndicator(),
            ),
          ),
        ),
      );
    });
  }
}
