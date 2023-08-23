part of 'product_details_bloc.dart';

abstract class ProductDetailsEvent extends Equatable {
  const ProductDetailsEvent();
}

class AddProductToCart extends ProductDetailsEvent {
  final ProductEntity product;

  const AddProductToCart(this.product);

  @override
  List<Object?> get props => [];
}
