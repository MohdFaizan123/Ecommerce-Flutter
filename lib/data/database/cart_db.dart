import 'package:moor_flutter/moor_flutter.dart';

part 'cart_db.g.dart';

class CartItems extends Table {
  IntColumn get cartItemId => integer().autoIncrement()();

  TextColumn get name => text().withLength(min: 0, max: 150)();

  IntColumn get price => integer()();

  IntColumn get quantity => integer()();

  IntColumn get itemTotal => integer()();

  TextColumn get productImage => text()();

  IntColumn get productId => integer()();
}

@UseMoor(tables: [CartItems])
class AppDatabase extends _$AppDatabase {
  AppDatabase()
      : super(FlutterQueryExecutor.inDatabaseFolder(
          path: 'db.sqlite',
          logStatements: true,
        ));

  @override
  int get schemaVersion => 1;

  Future<List<CartItem>> getAllCartItems() => select(cartItems).get();

  Future<List<CartItem>> getCartItemHavingProductID(int productID) =>
      (select(cartItems)..where((tbl) => tbl.productId.equals(productID)))
          .get();

  Future insertCartItem(CartItem cartItem) => into(cartItems).insert(cartItem);

  Future updateCartItem(CartItem cartItem) =>
      update(cartItems).replace(cartItem);

  Future deleteCartItem(CartItem cartItem) =>
      delete(cartItems).delete(cartItem);

  Future<int> getTotalAmount() {
    final sum = cartItems.itemTotal.sum();
    final query = selectOnly(cartItems)..addColumns([sum]);
    return query.map((row) => row.read(sum)).getSingle();
  }
}
