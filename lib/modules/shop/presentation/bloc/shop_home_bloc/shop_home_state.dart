part of 'shop_home_bloc.dart';

abstract class ShopHomeState extends Equatable {
  const ShopHomeState();
}

class ShopHomeInitial extends ShopHomeState {
  @override
  List<Object> get props => [];
}

class ShopHomeLoading extends ShopHomeState {
  @override
  List<Object> get props => [];
}

class ShopHomeSelectedCategory extends ShopHomeState {
  @override
  List<Object> get props => [];
}

class ShopHomeLoadingProductsSuccess extends ShopHomeState {
  @override
  List<Object> get props => [];
}

class ShopHomeLoadingProductsFailure extends ShopHomeState {
  @override
  List<Object> get props => [];
}
