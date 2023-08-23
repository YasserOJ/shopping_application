import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:shopping_application/core/managers/user_manager.dart';
import 'package:shopping_application/core/utils/app_shared_preferences/app_shared_prefs.dart';
import 'package:shopping_application/modules/shop/domain/entity/product_entity.dart';

part 'product_details_event.dart';
part 'product_details_state.dart';

@injectable
class ProductDetailsBloc
    extends Bloc<ProductDetailsEvent, ProductDetailsState> {
  final UserManager userManager;
  final AppSharedPrefs appSharedPrefs;

  ProductDetailsBloc(this.userManager, this.appSharedPrefs)
      : super(ProductDetailsInitial()) {
    on<ProductDetailsEvent>((event, emit) {
      if (event is AddProductToCart) {
        List<ProductEntity> cart = userManager.cartItems;
        if (cart.isEmpty) {
          event.product.quantity = 1;
          cart.add(event.product);
        } else {
          final int indexOfProductInCart =
              cart.indexWhere((element) => element.id == event.product.id);
          if (indexOfProductInCart == -1) {
            event.product.quantity = 1;
            cart.add(event.product);
          } else {
            cart[indexOfProductInCart].quantity++;
          }
        }
        appSharedPrefs.saveUserCartItems(cart);
        appSharedPrefs.saveCartTotal(
          cart.fold(
            0,
            (sum, element) => sum + (element.price * element.quantity),
          ),
        );
        userManager.cartItems = cart;
        userManager.cartTotal = cart.fold(
          0,
          (sum, element) => sum + (element.price * element.quantity),
        );
        emit(ProductDetailsDidAddProductToCart());
        emit(ProductDetailsInitial());
      }
    });
  }
}
