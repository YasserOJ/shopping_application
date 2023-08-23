import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_application/core/utils/ui_utils/values/app_colors.dart';
import 'package:shopping_application/modules/shop/domain/entity/product_entity.dart';
import 'package:shopping_application/modules/shop/presentation/bloc/product_details_bloc/product_details_bloc.dart';
import 'package:shopping_application/modules/shop/presentation/widgets/product_details/product_details_add_to_cart_button.dart';
import 'package:shopping_application/modules/shop/presentation/widgets/product_details/product_details_description_widget.dart';
import 'package:shopping_application/modules/shop/presentation/widgets/product_details/product_details_header_widget.dart';

@RoutePage()
class ProductDetailsView extends StatefulWidget {
  final ProductEntity product;

  const ProductDetailsView({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  State<ProductDetailsView> createState() => _ProductDetailsViewState();
}

class _ProductDetailsViewState extends State<ProductDetailsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteFFFFFF,
      body: SafeArea(
        top: true,
        child: Column(
          children: [
            ProductDetailsHeaderWidget(product: widget.product),
            ProductDetailsDescriptionWidget(product: widget.product),
            BlocListener<ProductDetailsBloc, ProductDetailsState>(
              listener: (context, state) {
                if (state is ProductDetailsDidAddProductToCart) {
                  context.router.pop();
                }
              },
              child: ProductDetailsAddToCartButton(
                product: widget.product,
                onButtonTapped: () {
                  setState(() {
                    context.read<ProductDetailsBloc>().add(
                          AddProductToCart(widget.product),
                        );
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
