import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:shopping_application/core/common_models/api_result_model.dart';
import 'package:shopping_application/core/enums/product_category.dart';
import 'package:shopping_application/core/managers/user_manager.dart';
import 'package:shopping_application/core/usecase/generic_usecase.dart';
import 'package:shopping_application/modules/shop/domain/entity/product_entity.dart';
import 'package:shopping_application/modules/shop/domain/use_case/get_all_products_use_case.dart';

part 'shop_home_event.dart';

part 'shop_home_state.dart';

@injectable
class ShopHomeBloc extends Bloc<ShopHomeEvent, ShopHomeState> {
  final GetAllProductsUseCase getAllProductsUseCase;
  final UserManager userManager;

  List<ProductEntity> loadedProducts = [];
  ProductCategory _selectedProductCategory = ProductCategory.all;

  ShopHomeBloc(this.getAllProductsUseCase, this.userManager)
      : super(ShopHomeInitial()) {
    loadedProducts = userManager.allProducts ?? [];
    on<ShopHomeEvent>((event, emit) async {
      if (event is ShowProductsByCategory) {
        emit(ShopHomeLoading());
        final List<ProductEntity> products = userManager.allProducts ?? [];
        if (products.isNotEmpty) {
          ProductCategory categoryToSelect = ProductCategory.all;
          switch (event.category) {
            case ProductCategory.all:
              categoryToSelect = ProductCategory.all;
              loadedProducts = products;
              break;
            case ProductCategory.menClothing:
              categoryToSelect = ProductCategory.menClothing;
              break;
            case ProductCategory.womenClothing:
              categoryToSelect = ProductCategory.womenClothing;
              break;
            case ProductCategory.jewelery:
              categoryToSelect = ProductCategory.jewelery;
              break;
            case ProductCategory.electronics:
              categoryToSelect = ProductCategory.electronics;
              break;
          }
          if (categoryToSelect != ProductCategory.all) {
            loadedProducts = products
                .where((element) => element.category == categoryToSelect)
                .toList();
          }
        }

        emit(ShopHomeSelectedCategory());
      }
      if (event is GetAllProducts) {
        emit(ShopHomeLoading());
        final result = await getAllProductsUseCase(NoParams());
        switch (result) {
          case Success(data: final data):
            userManager.allProducts = data;
            add(
              ShowProductsByCategory(_selectedProductCategory),
            );
            emit(ShopHomeLoadingProductsSuccess());
          case Failure(errorModel: _):
            emit(ShopHomeLoadingProductsFailure());
        }
      }
    });
  }

  void setSelectedProductCategory(ProductCategory productCategory) {
    _selectedProductCategory = productCategory;
  }
}
