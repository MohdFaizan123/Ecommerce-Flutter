import 'package:ecommerce_app/bloc/cart_item_cubit.dart';
import 'package:ecommerce_app/bloc/product_list_cubit.dart';
import 'package:ecommerce_app/data/models/product.dart';
import 'package:ecommerce_app/screens/cart_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductListScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ProductListScreenState();
  }
}

class ProductListScreenState extends State<ProductListScreen> {
  final _scrollController = ScrollController();
  ProductListCubit _productListBloc;

  @override
  void initState() {
    super.initState();
    _productListBloc = BlocProvider.of<ProductListCubit>(context);
    _productListBloc.getProductList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "Our Products",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        actions: [
          IconButton(
              icon: Icon(
                Icons.shopping_cart,
                color: Colors.blue[800],
              ),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                  return BlocProvider.value(
                    value: BlocProvider.of<CartItemCubit>(context),
                    child: CartScreen(),
                  );
                }));
              })
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        color: Colors.white,
        alignment: Alignment.center,
        child: BlocBuilder<ProductListCubit, ProductListState>(
          builder: (context, state) {
            if (state is ProductListStateLoaded) {
              return buildProductList(state);
            } else if (state is ProductListStateError) {
              return buildErrorWidget(state.errorMessage);
            } else {
              return CircularProgressIndicator(
                strokeWidth: 1.5,
              );
            }
          },
        ),
      ),
    );
  }

  Widget buildProductList(ProductListStateLoaded state) {
    return NotificationListener<ScrollNotification>(
        onNotification: _handleScrollNotification,
        child: OrientationBuilder(
          builder: (context, orientation) {
            return Column(
              children: [
                Expanded(
                  child: orientation == Orientation.portrait
                      ? ListView.builder(
                          controller: _scrollController,
                          itemCount: state.productList.length,
                          itemBuilder: (context, index) {
                            Product product;
                            product = state.productList[index];
                            return buildProductItem(product, state);
                          })
                      : GridView.builder(
                          controller: _scrollController,
                          itemCount: state.productList.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2, childAspectRatio: 2.1),
                          itemBuilder: (context, index) {
                            Product product;
                            product = state.productList[index];
                            return buildProductItem(product, state);
                          }),
                ),
                state.isLoading
                    ? SizedBox(
                        width: 33,
                        height: 33,
                        child: CircularProgressIndicator(
                          strokeWidth: 1.5,
                        ),
                      )
                    : Container()
              ],
            );
          },
        ));
  }

  bool _handleScrollNotification(ScrollNotification notification) {
    if (notification is ScrollEndNotification &&
        _scrollController.position.extentAfter == 0) {
      _productListBloc.getProductList();
    }

    return false;
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

  Widget buildProductItem(Product product, ProductListStateLoaded state) {
    return Padding(
        padding: EdgeInsets.symmetric(
          vertical: 10.0,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.network(
              product.featuredImage,
              width: 150,
              height: 150,
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
                    product.title,
                    textAlign: TextAlign.justify,
                    style: TextStyle(),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "\u20B9 ${product.price.toString()}",
                    style: TextStyle(
                      color: Colors.blue[400],
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  MaterialButton(
                    onPressed: () {
                      _productListBloc.addToCart(product);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.add_shopping_cart,
                          color: Colors.white,
                          size: 20.0,
                        ),
                        SizedBox(
                          width: 5.0,
                        ),
                        Text(
                          "Add to cart",
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                    color: Colors.blue[800],
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 5,
            ),
          ],
        ));
  }
}
