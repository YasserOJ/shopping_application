import 'package:flutter/material.dart';
import 'package:shopping_application/core/enums/product_category.dart';
import 'package:shopping_application/core/utils/extensions/product_category_extension.dart';
import 'package:shopping_application/core/utils/ui_utils/config_setup/config_manager.dart';
import 'package:shopping_application/core/utils/ui_utils/values/app_colors.dart';
import 'package:shopping_application/core/utils/ui_utils/values/styles.dart';

class ShopHomeCategoriesSelectionWidget extends StatefulWidget {
  final Function(ProductCategory)? onChipSelected;

  const ShopHomeCategoriesSelectionWidget({
    super.key,
    this.onChipSelected,
  });

  @override
  State<ShopHomeCategoriesSelectionWidget> createState() =>
      _ShopHomeCategoriesSelectionWidgetState();
}

class _ShopHomeCategoriesSelectionWidgetState
    extends State<ShopHomeCategoriesSelectionWidget> {
  ProductCategory selectedProductCategory = ProductCategory.all;

  @override
  Widget build(BuildContext context) {
    return ConfigManager(
      builder: (context, config, _) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: config.getResponsiveItemSize(15),
          ),
          child: Wrap(
            spacing: config.getResponsiveItemSize(5),
            children: List<Widget>.generate(
              ProductCategory.values.length,
              (index) {
                final ProductCategory category = ProductCategory.values[index];
                final String chipName = category.enumToString();
                return ChoiceChip(
                  label: Text(
                    chipName,
                    style: normalTextStyle.copyWith(
                      color: category == selectedProductCategory
                          ? whiteFFFFFF
                          : black000000,
                      fontSize: config.getResponsiveItemSize(15),
                    ),
                  ),
                  selected: category == selectedProductCategory,
                  backgroundColor: whiteFFFFFF,
                  showCheckmark: false,
                  selectedColor: blue1C43CB,
                  onSelected: (selected) {
                    if (selected) {
                      setState(
                        () {
                          selectedProductCategory = category;
                          if (widget.onChipSelected != null) {
                            widget.onChipSelected?.call(category);
                          }
                        },
                      );
                    }
                  },
                );
              },
            ).toList(),
          ),
        );
      },
    );
  }
}
