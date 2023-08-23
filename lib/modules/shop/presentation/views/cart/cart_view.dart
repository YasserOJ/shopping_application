import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_application/core/managers/user_manager.dart';
import 'package:shopping_application/core/utils/dependency_injection/component/app_component.dart';
import 'package:shopping_application/core/utils/ui_utils/config_setup/config_manager.dart';
import 'package:shopping_application/core/utils/ui_utils/values/app_colors.dart';
import 'package:shopping_application/core/utils/ui_utils/values/styles.dart';
import 'package:shopping_application/generated/l10n.dart';
import 'package:shopping_application/modules/shop/presentation/bloc/cart_bloc/cart_bloc.dart';
import 'package:shopping_application/modules/shop/presentation/widgets/cart/cart_product_item_widget.dart';

@RoutePage()
class CartView extends StatefulWidget {
  const CartView({Key? key}) : super(key: key);

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteFFFFFF,
      body: SafeArea(
        top: true,
        child: ConfigManager(
          builder: (context, config, router) {
            return Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [greyE7EDFC, whiteFFFFFF],
                  stops: [.3, .7],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
              child: Column(
                children: [
                  Stack(
                    children: [
                      Align(
                        alignment: Alignment.topCenter,
                        child: Padding(
                          padding: EdgeInsets.only(
                            top: config.getResponsiveItemSize(15),
                          ),
                          child: Text(
                            Localized.of(context).cart_label,
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
                    ],
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: config.screenWidth * .05,
                      ),
                      child: BlocConsumer<CartBloc, CartState>(
                        listener: (context, state) {},
                        builder: (context, state) {
                          return ListView.builder(
                            itemBuilder: (BuildContext context, int index) {
                              return CartProductItemWidget(
                                cartItem:
                                    locator<UserManager>().cartItems[index],
                                itemIndex: index,
                              );
                            },
                            itemCount: locator<UserManager>().cartItems.length,
                          );
                        },
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: config.screenHeight * .2,
                    padding: EdgeInsets.symmetric(
                      horizontal: config.screenWidth * .05,
                      vertical: config.getResponsiveItemSize(20),
                    ),
                    decoration: BoxDecoration(
                      color: whiteFFFFFF,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(
                          config.getResponsiveItemSize(25),
                        ),
                        topRight: Radius.circular(
                          config.getResponsiveItemSize(25),
                        ),
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        BlocConsumer<CartBloc, CartState>(
                          listener: (context, state) {
                            // TODO: implement listener
                          },
                          builder: (context, state) {
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  Localized.of(context).cart_total_items_label(
                                    locator<UserManager>().cartItems.fold(
                                        0,
                                        (sum, element) =>
                                            sum + element.quantity),
                                  ),
                                  style: boldTextStyle.copyWith(
                                    color: grey969DAA,
                                    fontSize: config.getResponsiveItemSize(15),
                                  ),
                                ),
                                Text(
                                  '${locator<UserManager>().cartTotal.toStringAsFixed(2)}€',
                                  style: boldTextStyle.copyWith(
                                    fontSize: config.getResponsiveItemSize(18),
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                        SizedBox(
                          height: config.getResponsiveItemSize(7),
                        ),
                        GestureDetector(
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: blue1C43CB,
                              borderRadius: BorderRadius.circular(
                                config.getResponsiveItemSize(25),
                              ),
                            ),
                            padding: EdgeInsets.symmetric(
                              vertical: config.getResponsiveItemSize(13),
                            ),
                            child: Text(
                              Localized.of(context).check_out_label,
                              textAlign: TextAlign.center,
                              style: boldTextStyle.copyWith(
                                color: whiteFFFFFF,
                                fontSize: config.getResponsiveItemSize(17),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
