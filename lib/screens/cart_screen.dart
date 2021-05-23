import 'package:ecommerce_app/bloc/cart_item_cubit.dart';
import 'package:ecommerce_app/data/database/cart_db.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CartScreenState();
  }
}

class CartScreenState extends State<CartScreen> {
  CartItemCubit _cartItemCubit;

  @override
  void initState() {
    super.initState();
    _cartItemCubit = BlocProvider.of<CartItemCubit>(context);
    _cartItemCubit.getCartItems();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        title: Text(
          "My Cart",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: Container(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          color: Colors.white,
          alignment: Alignment.center,
          child: BlocBuilder<CartItemCubit, CartItemState>(
            builder: (context, state) {
              if (state is CartItemLoaded) {
                return buildCartList(state);
              } else if (state is CartItemError) {
                return buildErrorWidget(state.errorMessage);
              } else {
                return CircularProgressIndicator(
                  strokeWidth: 1.5,
                );
              }
            },
          )),
    );
  }

  Widget buildErrorWidget(String errorMessage) {
    return Text(
      errorMessage,
      style: TextStyle(
        fontSize: 18.0,
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget buildCartList(CartItemLoaded state) {
    if (state.cartItems != null && state.cartItems.length > 0) {
      return OrientationBuilder(
        builder: (context, orientation) {
          return Column(
            children: [
              Expanded(
                  child: orientation == Orientation.portrait
                      ? ListView.builder(
                          itemCount: state.cartItems.length,
                          itemBuilder: (context, index) {
                            CartItem cartItem = state.cartItems[index];
                            return buildCartItem(cartItem, state);
                          },
                        )
                      : GridView.builder(
                          itemCount: state.cartItems.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2, childAspectRatio: 2.5),
                          itemBuilder: (context, index) {
                            CartItem cartItem = state.cartItems[index];
                            return buildCartItem(cartItem, state);
                          },
                        )),
              Row(
                children: [
                  Text(
                    "Cart Total:",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        "\u20B9 ${state.total.toString()}",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 5.0,
              ),
              MaterialButton(
                color: Colors.blue[800],
                minWidth: double.maxFinite,
                onPressed: () {},
                child: Text(
                  "Checkout",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                  ),
                ),
              )
            ],
          );
        },
      );
    } else {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.add_shopping_cart_rounded,
            size: 80.0,
            color: Colors.red,
          ),
          SizedBox(
            height: 12.0,
          ),
          Text(
            "Nothing in Cart.",
            style: TextStyle(
              fontSize: 18.0,
              color: Colors.red,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      );
    }
  }

  Widget buildCartItem(CartItem cartItem, CartItemLoaded state) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 10.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.network(
            cartItem.productImage,
            width: 100,
            height: 100,
            fit: BoxFit.fill,
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  cartItem.name,
                  textAlign: TextAlign.justify,
                  style: TextStyle(),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "\u20B9 ${cartItem.price.toString()}",
                  style: TextStyle(
                    color: Colors.blue[400],
                    fontSize: 20,
                  ),
                ),
                SizedBox(
                  height: 2,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    cartItem.quantity > 1
                        ? IconButton(
                            onPressed: () {
                              _cartItemCubit.removeCartItem(cartItem);
                            },
                            icon: Icon(
                              Icons.remove_circle,
                              color: Colors.red,
                              size: 25.0,
                            ))
                        : SizedBox(
                            width: 25.0,
                            height: 25.0,
                          ),
                    Text(cartItem.quantity.toString(),
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20.0,
                        )),
                    IconButton(
                        onPressed: () {
                          _cartItemCubit.addCartItem(cartItem);
                        },
                        icon: Icon(
                          Icons.add_circle,
                          color: Colors.green,
                          size: 25.0,
                        )),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            width: 3,
          ),
          IconButton(
              onPressed: () {
                _cartItemCubit.deleteCartItem(cartItem);
              },
              icon: Icon(
                Icons.delete,
                color: Colors.red,
                size: 30.0,
              )),
        ],
      ),
    );
  }
}
