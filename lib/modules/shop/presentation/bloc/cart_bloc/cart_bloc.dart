import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:shopping_application/core/managers/user_manager.dart';
import 'package:shopping_application/core/utils/app_shared_preferences/app_shared_prefs.dart';

part 'cart_event.dart';
part 'cart_state.dart';

@injectable
class CartBloc extends Bloc<CartEvent, CartState> {
  final UserManager userManager;
  final AppSharedPrefs appSharedPrefs;

  CartBloc(this.userManager, this.appSharedPrefs) : super(CartInitial()) {
    on<CartEvent>((event, emit) {
      if (event is RemoveItem) {
        emit(CartLoading());
        userManager.cartItems.removeAt(event.itemIndex);
        appSharedPrefs.saveUserCartItems(userManager.cartItems);
        userManager.cartTotal = userManager.cartItems.fold(
          0,
          (sum, element) => sum + (element.quantity * element.price),
        );
        appSharedPrefs.saveCartTotal(userManager.cartTotal);
        emit(CartDidRemoveItem());
        emit(CartInitial());
      }

      if (event is UpdateCartItem) {
        emit(CartLoading());
        final int itemIndex = userManager.cartItems
            .indexWhere((element) => event.itemId == element.id);
        userManager.cartItems[itemIndex].quantity = event.itemQuantity;
        appSharedPrefs.saveUserCartItems(userManager.cartItems);
        userManager.cartTotal = userManager.cartItems.fold(
          0,
          (sum, element) => sum + (element.quantity * element.price),
        );
        appSharedPrefs.saveCartTotal(userManager.cartTotal);
        emit(CartDidUpdateItem());
        emit(CartInitial());
      }
    });
  }
}
