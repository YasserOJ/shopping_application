import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_application/core/enums/product_category.dart';
import 'package:shopping_application/core/utils/ui_utils/config_setup/config_manager.dart';
import 'package:shopping_application/core/utils/ui_utils/values/app_colors.dart';
import 'package:shopping_application/modules/shop/presentation/bloc/shop_home_bloc/shop_home_bloc.dart';
import 'package:shopping_application/modules/shop/presentation/widgets/shop_home/shop_home_loading_widget.dart';
import 'package:shopping_application/modules/shop/presentation/widgets/shop_home/shop_home_no_items_widget.dart';
import 'package:shopping_application/modules/shop/presentation/widgets/shop_home/product_item_widget.dart';
import 'package:shopping_application/modules/shop/presentation/widgets/shop_home/shop_home_categories_selection_widget.dart';
import 'package:shopping_application/modules/shop/presentation/widgets/shop_home/shop_home_header_widget.dart';
import 'package:shopping_application/modules/shop/presentation/widgets/shop_home/shop_home_search_and_filter_widget.dart';

@RoutePage()
class ShopHomeView extends StatefulWidget {
  const ShopHomeView({Key? key}) : super(key: key);

  @override
  State<ShopHomeView> createState() => _ShopHomeViewState();
}

class _ShopHomeViewState extends State<ShopHomeView> {
  bool isRefreshingView = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: true,
        child: ConfigManager(
          builder: (context, config, _) {
            return BlocListener<ShopHomeBloc, ShopHomeState>(
              listener: (context, state) {
                setState(() {
                  if (state is ShopHomeLoading) {
                    isRefreshingView = true;
                  } else {
                    isRefreshingView = false;
                  }
                });
              },
              child: Stack(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      left: config.screenWidth * .05,
                      right: config.screenWidth * .05,
                      top: config.screenHeight * .02,
                    ),
                    child: RefreshIndicator(
                      onRefresh: () async {
                        context.read<ShopHomeBloc>().add(GetAllProducts());
                      },
                      child: CustomScrollView(
                        slivers: [
                          SliverList(
                            delegate: SliverChildBuilderDelegate(
                              (context, index) {
                                switch (index) {
                                  case 0:
                                    return const ShopHomeHeaderWidget();
                                  case 1:
                                    //TODO(Yasser): this are just placeholder and does not work for design purpose only
                                    return const ShopHomeSearchAndFilterWidget();
                                  case 2:
                                    return ShopHomeCategoriesSelectionWidget(
                                      onChipSelected:
                                          (ProductCategory category) {
                                        context.read<ShopHomeBloc>().add(
                                              ShowProductsByCategory(
                                                category,
                                              ),
                                            );
                                        context
                                            .read<ShopHomeBloc>()
                                            .setSelectedProductCategory(
                                                category);
                                      },
                                    );
                                  default:
                                    return Container();
                                }
                              },
                              childCount: 3,
                            ),
                          ),
                          BlocBuilder<ShopHomeBloc, ShopHomeState>(
                            builder: (context, state) {
                              if (context
                                      .read<ShopHomeBloc>()
                                      .userManager
                                      .allProducts !=
                                  null) {
                                return SliverGrid.builder(
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    childAspectRatio: .52,
                                  ),
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return ProductItemWidget(
                                      productEntity: context
                                          .read<ShopHomeBloc>()
                                          .loadedProducts[index],
                                    );
                                  },
                                  itemCount: context
                                      .read<ShopHomeBloc>()
                                      .loadedProducts
                                      .length,
                                );
                              } else {
                                return const ShopHomeNoItemsWidget();
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  if (isRefreshingView) const ShopHomeLoadingWidget(),
                ],
              ),
            );
          },
        ),
      ),
      backgroundColor: whiteFFFFFF,
    );
  }
}
