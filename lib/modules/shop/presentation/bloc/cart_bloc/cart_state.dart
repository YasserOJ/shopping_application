part of 'cart_bloc.dart';

abstract class CartState extends Equatable {
  const CartState();
}

class CartInitial extends CartState {
  @override
  List<Object> get props => [];
}

class CartLoading extends CartState {
  @override
  List<Object> get props => [];
}

class CartDidRemoveItem extends CartState {
  @override
  List<Object> get props => [];
}

class CartDidUpdateItem extends CartState {
  @override
  List<Object> get props => [];
}
