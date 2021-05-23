// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_db.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class CartItem extends DataClass implements Insertable<CartItem> {
  final int cartItemId;
  final String name;
  final int price;
  final int quantity;
  final int itemTotal;
  final String productImage;
  final int productId;
  CartItem(
      {@required this.cartItemId,
      @required this.name,
      @required this.price,
      @required this.quantity,
      @required this.itemTotal,
      @required this.productImage,
      @required this.productId});
  factory CartItem.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    return CartItem(
      cartItemId: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}cart_item_id']),
      name: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}name']),
      price: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}price']),
      quantity: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}quantity']),
      itemTotal: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}item_total']),
      productImage: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}product_image']),
      productId: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}product_id']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || cartItemId != null) {
      map['cart_item_id'] = Variable<int>(cartItemId);
    }
    if (!nullToAbsent || name != null) {
      map['name'] = Variable<String>(name);
    }
    if (!nullToAbsent || price != null) {
      map['price'] = Variable<int>(price);
    }
    if (!nullToAbsent || quantity != null) {
      map['quantity'] = Variable<int>(quantity);
    }
    if (!nullToAbsent || itemTotal != null) {
      map['item_total'] = Variable<int>(itemTotal);
    }
    if (!nullToAbsent || productImage != null) {
      map['product_image'] = Variable<String>(productImage);
    }
    if (!nullToAbsent || productId != null) {
      map['product_id'] = Variable<int>(productId);
    }
    return map;
  }

  CartItemsCompanion toCompanion(bool nullToAbsent) {
    return CartItemsCompanion(
      cartItemId: cartItemId == null && nullToAbsent
          ? const Value.absent()
          : Value(cartItemId),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      price:
          price == null && nullToAbsent ? const Value.absent() : Value(price),
      quantity: quantity == null && nullToAbsent
          ? const Value.absent()
          : Value(quantity),
      itemTotal: itemTotal == null && nullToAbsent
          ? const Value.absent()
          : Value(itemTotal),
      productImage: productImage == null && nullToAbsent
          ? const Value.absent()
          : Value(productImage),
      productId: productId == null && nullToAbsent
          ? const Value.absent()
          : Value(productId),
    );
  }

  factory CartItem.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return CartItem(
      cartItemId: serializer.fromJson<int>(json['cartItemId']),
      name: serializer.fromJson<String>(json['name']),
      price: serializer.fromJson<int>(json['price']),
      quantity: serializer.fromJson<int>(json['quantity']),
      itemTotal: serializer.fromJson<int>(json['itemTotal']),
      productImage: serializer.fromJson<String>(json['productImage']),
      productId: serializer.fromJson<int>(json['productId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'cartItemId': serializer.toJson<int>(cartItemId),
      'name': serializer.toJson<String>(name),
      'price': serializer.toJson<int>(price),
      'quantity': serializer.toJson<int>(quantity),
      'itemTotal': serializer.toJson<int>(itemTotal),
      'productImage': serializer.toJson<String>(productImage),
      'productId': serializer.toJson<int>(productId),
    };
  }

  CartItem copyWith(
          {int cartItemId,
          String name,
          int price,
          int quantity,
          int itemTotal,
          String productImage,
          int productId}) =>
      CartItem(
        cartItemId: cartItemId ?? this.cartItemId,
        name: name ?? this.name,
        price: price ?? this.price,
        quantity: quantity ?? this.quantity,
        itemTotal: itemTotal ?? this.itemTotal,
        productImage: productImage ?? this.productImage,
        productId: productId ?? this.productId,
      );
  @override
  String toString() {
    return (StringBuffer('CartItem(')
          ..write('cartItemId: $cartItemId, ')
          ..write('name: $name, ')
          ..write('price: $price, ')
          ..write('quantity: $quantity, ')
          ..write('itemTotal: $itemTotal, ')
          ..write('productImage: $productImage, ')
          ..write('productId: $productId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      cartItemId.hashCode,
      $mrjc(
          name.hashCode,
          $mrjc(
              price.hashCode,
              $mrjc(
                  quantity.hashCode,
                  $mrjc(itemTotal.hashCode,
                      $mrjc(productImage.hashCode, productId.hashCode)))))));
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CartItem &&
          other.cartItemId == this.cartItemId &&
          other.name == this.name &&
          other.price == this.price &&
          other.quantity == this.quantity &&
          other.itemTotal == this.itemTotal &&
          other.productImage == this.productImage &&
          other.productId == this.productId);
}

class CartItemsCompanion extends UpdateCompanion<CartItem> {
  final Value<int> cartItemId;
  final Value<String> name;
  final Value<int> price;
  final Value<int> quantity;
  final Value<int> itemTotal;
  final Value<String> productImage;
  final Value<int> productId;
  const CartItemsCompanion({
    this.cartItemId = const Value.absent(),
    this.name = const Value.absent(),
    this.price = const Value.absent(),
    this.quantity = const Value.absent(),
    this.itemTotal = const Value.absent(),
    this.productImage = const Value.absent(),
    this.productId = const Value.absent(),
  });
  CartItemsCompanion.insert({
    this.cartItemId = const Value.absent(),
    @required String name,
    @required int price,
    @required int quantity,
    @required int itemTotal,
    @required String productImage,
    @required int productId,
  })  : name = Value(name),
        price = Value(price),
        quantity = Value(quantity),
        itemTotal = Value(itemTotal),
        productImage = Value(productImage),
        productId = Value(productId);
  static Insertable<CartItem> custom({
    Expression<int> cartItemId,
    Expression<String> name,
    Expression<int> price,
    Expression<int> quantity,
    Expression<int> itemTotal,
    Expression<String> productImage,
    Expression<int> productId,
  }) {
    return RawValuesInsertable({
      if (cartItemId != null) 'cart_item_id': cartItemId,
      if (name != null) 'name': name,
      if (price != null) 'price': price,
      if (quantity != null) 'quantity': quantity,
      if (itemTotal != null) 'item_total': itemTotal,
      if (productImage != null) 'product_image': productImage,
      if (productId != null) 'product_id': productId,
    });
  }

  CartItemsCompanion copyWith(
      {Value<int> cartItemId,
      Value<String> name,
      Value<int> price,
      Value<int> quantity,
      Value<int> itemTotal,
      Value<String> productImage,
      Value<int> productId}) {
    return CartItemsCompanion(
      cartItemId: cartItemId ?? this.cartItemId,
      name: name ?? this.name,
      price: price ?? this.price,
      quantity: quantity ?? this.quantity,
      itemTotal: itemTotal ?? this.itemTotal,
      productImage: productImage ?? this.productImage,
      productId: productId ?? this.productId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (cartItemId.present) {
      map['cart_item_id'] = Variable<int>(cartItemId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (price.present) {
      map['price'] = Variable<int>(price.value);
    }
    if (quantity.present) {
      map['quantity'] = Variable<int>(quantity.value);
    }
    if (itemTotal.present) {
      map['item_total'] = Variable<int>(itemTotal.value);
    }
    if (productImage.present) {
      map['product_image'] = Variable<String>(productImage.value);
    }
    if (productId.present) {
      map['product_id'] = Variable<int>(productId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CartItemsCompanion(')
          ..write('cartItemId: $cartItemId, ')
          ..write('name: $name, ')
          ..write('price: $price, ')
          ..write('quantity: $quantity, ')
          ..write('itemTotal: $itemTotal, ')
          ..write('productImage: $productImage, ')
          ..write('productId: $productId')
          ..write(')'))
        .toString();
  }
}

class $CartItemsTable extends CartItems
    with TableInfo<$CartItemsTable, CartItem> {
  final GeneratedDatabase _db;
  final String _alias;
  $CartItemsTable(this._db, [this._alias]);
  final VerificationMeta _cartItemIdMeta = const VerificationMeta('cartItemId');
  GeneratedIntColumn _cartItemId;
  @override
  GeneratedIntColumn get cartItemId => _cartItemId ??= _constructCartItemId();
  GeneratedIntColumn _constructCartItemId() {
    return GeneratedIntColumn('cart_item_id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _nameMeta = const VerificationMeta('name');
  GeneratedTextColumn _name;
  @override
  GeneratedTextColumn get name => _name ??= _constructName();
  GeneratedTextColumn _constructName() {
    return GeneratedTextColumn('name', $tableName, false,
        minTextLength: 0, maxTextLength: 150);
  }

  final VerificationMeta _priceMeta = const VerificationMeta('price');
  GeneratedIntColumn _price;
  @override
  GeneratedIntColumn get price => _price ??= _constructPrice();
  GeneratedIntColumn _constructPrice() {
    return GeneratedIntColumn(
      'price',
      $tableName,
      false,
    );
  }

  final VerificationMeta _quantityMeta = const VerificationMeta('quantity');
  GeneratedIntColumn _quantity;
  @override
  GeneratedIntColumn get quantity => _quantity ??= _constructQuantity();
  GeneratedIntColumn _constructQuantity() {
    return GeneratedIntColumn(
      'quantity',
      $tableName,
      false,
    );
  }

  final VerificationMeta _itemTotalMeta = const VerificationMeta('itemTotal');
  GeneratedIntColumn _itemTotal;
  @override
  GeneratedIntColumn get itemTotal => _itemTotal ??= _constructItemTotal();
  GeneratedIntColumn _constructItemTotal() {
    return GeneratedIntColumn(
      'item_total',
      $tableName,
      false,
    );
  }

  final VerificationMeta _productImageMeta =
      const VerificationMeta('productImage');
  GeneratedTextColumn _productImage;
  @override
  GeneratedTextColumn get productImage =>
      _productImage ??= _constructProductImage();
  GeneratedTextColumn _constructProductImage() {
    return GeneratedTextColumn(
      'product_image',
      $tableName,
      false,
    );
  }

  final VerificationMeta _productIdMeta = const VerificationMeta('productId');
  GeneratedIntColumn _productId;
  @override
  GeneratedIntColumn get productId => _productId ??= _constructProductId();
  GeneratedIntColumn _constructProductId() {
    return GeneratedIntColumn(
      'product_id',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns =>
      [cartItemId, name, price, quantity, itemTotal, productImage, productId];
  @override
  $CartItemsTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'cart_items';
  @override
  final String actualTableName = 'cart_items';
  @override
  VerificationContext validateIntegrity(Insertable<CartItem> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('cart_item_id')) {
      context.handle(
          _cartItemIdMeta,
          cartItemId.isAcceptableOrUnknown(
              data['cart_item_id'], _cartItemIdMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name'], _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('price')) {
      context.handle(
          _priceMeta, price.isAcceptableOrUnknown(data['price'], _priceMeta));
    } else if (isInserting) {
      context.missing(_priceMeta);
    }
    if (data.containsKey('quantity')) {
      context.handle(_quantityMeta,
          quantity.isAcceptableOrUnknown(data['quantity'], _quantityMeta));
    } else if (isInserting) {
      context.missing(_quantityMeta);
    }
    if (data.containsKey('item_total')) {
      context.handle(_itemTotalMeta,
          itemTotal.isAcceptableOrUnknown(data['item_total'], _itemTotalMeta));
    } else if (isInserting) {
      context.missing(_itemTotalMeta);
    }
    if (data.containsKey('product_image')) {
      context.handle(
          _productImageMeta,
          productImage.isAcceptableOrUnknown(
              data['product_image'], _productImageMeta));
    } else if (isInserting) {
      context.missing(_productImageMeta);
    }
    if (data.containsKey('product_id')) {
      context.handle(_productIdMeta,
          productId.isAcceptableOrUnknown(data['product_id'], _productIdMeta));
    } else if (isInserting) {
      context.missing(_productIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {cartItemId};
  @override
  CartItem map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return CartItem.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $CartItemsTable createAlias(String alias) {
    return $CartItemsTable(_db, alias);
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  $CartItemsTable _cartItems;
  $CartItemsTable get cartItems => _cartItems ??= $CartItemsTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [cartItems];
}
