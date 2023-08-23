part of 'cart_bloc.dart';

abstract class CartEvent extends Equatable {
  const CartEvent();
}

class RemoveItem extends CartEvent {
  final int itemIndex;

  const RemoveItem(this.itemIndex);

  @override
  List<Object?> get props => [];
}

class UpdateCartItem extends CartEvent {
  final int itemId;
  final int itemQuantity;

  const UpdateCartItem(this.itemId, this.itemQuantity);

  @override
  List<Object?> get props => [];
}
