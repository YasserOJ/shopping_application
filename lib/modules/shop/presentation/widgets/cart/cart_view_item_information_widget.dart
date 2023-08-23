import 'package:flutter/material.dart';
import 'package:shopping_application/core/enums/product_category.dart';
import 'package:shopping_application/core/utils/extensions/product_category_extension.dart';
import 'package:shopping_application/core/utils/ui_utils/config_setup/config_manager.dart';
import 'package:shopping_application/core/utils/ui_utils/values/app_colors.dart';
import 'package:shopping_application/core/utils/ui_utils/values/styles.dart';

class CartViewItemInformationWidget extends StatelessWidget {
  const CartViewItemInformationWidget({
    super.key,
    required this.title,
    required this.category,
    required this.onItemRemoveClicked,
  });

  final String title;
  final ProductCategory category;
  final Function onItemRemoveClicked;

  @override
  Widget build(BuildContext context) {
    return ConfigManager(builder: (context, config, _) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                child: Text(
                  title,
                  style: boldTextStyle.copyWith(
                    fontSize: config.getResponsiveItemSize(15),
                  ),
                  maxLines: 2,
                ),
              ),
              SizedBox(
                width: config.getResponsiveItemSize(4),
              ),
              GestureDetector(
                onTap: () {
                  onItemRemoveClicked();
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: whiteFFFFFF,
                    borderRadius: BorderRadius.circular(
                      config.getResponsiveItemSize(5),
                    ),
                  ),
                  child: const Icon(
                    Icons.close,
                    color: Colors.red,
                  ),
                ),
              ),
            ],
          ),
          Text(
            category.enumToString(),
            style: normalTextStyle.copyWith(
              color: grey969DAA,
              fontSize: config.getResponsiveItemSize(11),
            ),
          ),
        ],
      );
    });
  }
}
