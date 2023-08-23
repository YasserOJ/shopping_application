import 'package:flutter/material.dart';
import 'package:shopping_application/core/utils/ui_utils/config_setup/config.dart';
import 'package:shopping_application/core/utils/ui_utils/values/app_colors.dart';

class CartIconButton extends StatelessWidget {
  const CartIconButton({
    Key? key,
    required this.icon,
    required this.onButtonClicked,
    required this.config,
  }) : super(key: key);

  final IconData icon;
  final Function() onButtonClicked;
  final Config config;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onButtonClicked();
      },
      child: Container(
        decoration: BoxDecoration(
          color: whiteFFFFFF,
          borderRadius: BorderRadius.circular(
            config.getResponsiveItemSize(5),
          ),
        ),
        child: Icon(icon),
      ),
    );
  }
}
