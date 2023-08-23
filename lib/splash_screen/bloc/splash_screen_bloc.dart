import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:shopping_application/core/common_models/api_result_model.dart';
import 'package:shopping_application/core/managers/user_manager.dart';
import 'package:shopping_application/core/usecase/generic_usecase.dart';
import 'package:shopping_application/core/utils/app_shared_preferences/app_shared_prefs.dart';
import 'package:shopping_application/core/utils/dependency_injection/component/app_component.dart';
import 'package:shopping_application/modules/shop/domain/use_case/get_all_products_use_case.dart';

part 'splash_screen_event.dart';

part 'splash_screen_state.dart';

@injectable
class SplashScreenBloc extends Bloc<SplashScreenEvent, SplashScreenState> {
  final GetAllProductsUseCase getAllProductsUseCase;

  SplashScreenBloc(
    this.getAllProductsUseCase,
  ) : super(SplashScreenInitial()) {
    on<SplashScreenEvent>((event, emit) async {
      if (event is GetAllProducts) {
        emit(SplashScreenLoading());
        final result = await getAllProductsUseCase(NoParams());
        switch (result) {
          case Success(data: final data):
            locator<UserManager>().allProducts = data;
            _getCartAndSaveInUserManager();
            emit(SplashScreenLoadingProductsSuccess());
          case Failure(errorModel: _):
            emit(SplashScreenLoadingProductsFailure());
        }
      }
    });
  }

  void _getCartAndSaveInUserManager() {
    _getSavedCartItems();
    _getSavedCartTotal();
  }

  void _getSavedCartItems() {
    final allProducts = locator<UserManager>().allProducts;
    final cartItems =
        locator<AppSharedPrefs>().getUserCartItems(allProducts ?? []);
    locator<UserManager>().cartItems = cartItems;
  }

  void _getSavedCartTotal() {
    final cartTotal = locator<AppSharedPrefs>().getSavedCartTotal();
    locator<UserManager>().cartTotal = cartTotal;
  }
}
