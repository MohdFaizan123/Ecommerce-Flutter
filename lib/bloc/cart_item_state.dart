part of 'cart_item_cubit.dart';

@immutable
abstract class CartItemState {
  const CartItemState();
}

class CartItemInitial extends CartItemState {
  const CartItemInitial();
}

class CartItemLoading extends CartItemState {
  const CartItemLoading();
}

class CartItemLoaded extends CartItemState {
  final List<CartItem> cartItems;
  final int total;

  const CartItemLoaded(this.cartItems, this.total);
}

class CartItemError extends CartItemState {
  final String errorMessage;

  const CartItemError(this.errorMessage);
}
