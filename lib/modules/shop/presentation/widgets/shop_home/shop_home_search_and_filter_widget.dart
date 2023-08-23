import 'package:flutter/material.dart';
import 'package:shopping_application/core/utils/ui_utils/config_setup/config_manager.dart';
import 'package:shopping_application/core/utils/ui_utils/values/app_colors.dart';
import 'package:shopping_application/generated/l10n.dart';

class ShopHomeSearchAndFilterWidget extends StatelessWidget {
  const ShopHomeSearchAndFilterWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ConfigManager(
      builder: (context, config, _) {
        return Container(
          width: config.screenWidth * .9,
          padding: EdgeInsets.only(bottom: config.getResponsiveItemSize(15)),
          child: Padding(
            padding: EdgeInsets.only(
              left: config.getResponsiveItemSize(7),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: Container(
                    height: config.getResponsiveItemSize(50),
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: black000000.withOpacity(.3),
                          blurRadius: 10,
                          offset: const Offset(0, 1),
                        ),
                      ],
                    ),
                    child: TextField(
                      controller: TextEditingController(),
                      decoration: InputDecoration(
                        hintText: Localized.of(context)
                            .search_for_products_hint_label,
                        border: buildOutlineInputBorder(),
                        focusedBorder: buildOutlineInputBorder(),
                        enabledBorder: buildOutlineInputBorder(),
                        filled: true,
                        fillColor: whiteFFFFFF,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: config.getResponsiveItemSize(10),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: const Icon(Icons.tune),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  OutlineInputBorder buildOutlineInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(
        color: whiteFFFFFF,
        width: 3,
      ),
    );
  }
}
