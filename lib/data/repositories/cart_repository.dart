import 'package:ecommerce_app/data/database/cart_db.dart';

import '../../main.dart';

abstract class CartRepository {
  Future<List<CartItem>> getCartItems();

  Future<List<CartItem>> updateCardItem(CartItem cartItem);

  Future<List<CartItem>> deleteCardItem(CartItem cartItem);

  Future<int> getTotal();
}

class DbCartRepository extends CartRepository {
  @override
  Future<List<CartItem>> getCartItems() async {
    List<CartItem> cartItems = await db.getAllCartItems();
    return cartItems;
  }

  Future<List<CartItem>> updateCardItem(CartItem cartItem) async {
    await db.updateCartItem(cartItem);
    return await getCartItems();
  }

  Future<List<CartItem>> deleteCardItem(CartItem cartItem) async {
    await db.deleteCartItem(cartItem);
    return await getCartItems();
  }

  @override
  Future<int> getTotal() async {
    int total = await db.getTotalAmount();
    return total;
  }
}
