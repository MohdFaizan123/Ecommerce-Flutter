import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/data/database/cart_db.dart';
import 'package:ecommerce_app/data/repositories/cart_repository.dart';
import 'package:ecommerce_app/data/repositories/exceptions.dart';
import 'package:meta/meta.dart';

part 'cart_item_state.dart';

class CartItemCubit extends Cubit<CartItemState> {
  final CartRepository _cartRepository;

  CartItemCubit(this._cartRepository) : super(CartItemInitial());

  Future<void> getCartItems() async {
    try {
      emit(CartItemLoading());
      List<CartItem> cariItems = await _cartRepository.getCartItems();
      int total = await _cartRepository.getTotal();
      emit(CartItemLoaded(cariItems, total));
    } on SomeProblemOccurException {
      emit(CartItemError("Some problem in getting data from database."));
    }
  }

  Future<void> addCartItem(CartItem cartItem) async {
    try {
      emit(CartItemLoading());
      int newQuantity = cartItem.quantity + 1;
      updateCartItem(cartItem.copyWith(
          quantity: newQuantity, itemTotal: cartItem.price * newQuantity));
    } on Exception catch (e) {
      emit(CartItemError(e.toString()));
    }
  }

  Future<void> removeCartItem(CartItem cartItem) async {
    try {
      emit(CartItemLoading());
      int newQuantity = cartItem.quantity - 1;
      updateCartItem(cartItem.copyWith(
          quantity: newQuantity, itemTotal: cartItem.price * newQuantity));
    } on Exception catch (e) {
      emit(CartItemError(e.toString()));
    }
  }

  Future<void> updateCartItem(CartItem cartItem) async {
    try {
      emit(CartItemLoading());
      List<CartItem> cariItems = await _cartRepository.updateCardItem(cartItem);
      int total = await _cartRepository.getTotal();
      emit(CartItemLoaded(cariItems, total));
    } on Exception catch (e) {
      emit(CartItemError(e.toString()));
    }
  }

  Future<void> deleteCartItem(CartItem cartItem) async {
    try {
      emit(CartItemLoading());
      List<CartItem> cariItems = await _cartRepository.deleteCardItem(cartItem);
      int total = await _cartRepository.getTotal();
      emit(CartItemLoaded(cariItems, total));
    } on Exception catch (e) {
      emit(CartItemError(e.toString()));
    }
  }
}
