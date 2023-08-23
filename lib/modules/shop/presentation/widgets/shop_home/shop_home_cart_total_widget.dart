import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_application/core/managers/user_manager.dart';
import 'package:shopping_application/core/utils/dependency_injection/component/app_component.dart';
import 'package:shopping_application/core/utils/ui_utils/config_setup/config.dart';
import 'package:shopping_application/core/utils/ui_utils/values/styles.dart';
import 'package:shopping_application/modules/shop/presentation/bloc/cart_bloc/cart_bloc.dart';
import 'package:shopping_application/modules/shop/presentation/bloc/product_details_bloc/product_details_bloc.dart';

class ShopHomeCartTotalWidget extends StatelessWidget {
  const ShopHomeCartTotalWidget({
    super.key,
    required this.config,
  });

  final Config config;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CartBloc, CartState>(
      listener: (context, state) {},
      builder: (context, state) {
        return BlocConsumer<ProductDetailsBloc, ProductDetailsState>(
          listener: (context, state) {},
          builder: (context, state) {
            return Text(
              '${locator<UserManager>().cartTotal.toStringAsFixed(2)}€',
              style: boldTextStyle.copyWith(
                fontSize: config.getResponsiveItemSize(15),
              ),
            );
          },
        );
      },
    );
  }
}
