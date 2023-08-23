part of 'shop_home_bloc.dart';

abstract class ShopHomeEvent extends Equatable {
  const ShopHomeEvent();
}

class ShowProductsByCategory extends ShopHomeEvent {
  final ProductCategory category;

  const ShowProductsByCategory(this.category);

  @override
  List<Object?> get props => [];
}

class GetAllProducts extends ShopHomeEvent {
  @override
  List<Object?> get props => [];
}
