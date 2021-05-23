import 'dart:convert';

import 'package:ecommerce_app/data/api/api_helper.dart';
import 'package:ecommerce_app/data/database/cart_db.dart';
import 'package:ecommerce_app/data/models/product.dart';
import 'package:ecommerce_app/main.dart';
import 'package:http/http.dart';

import 'exceptions.dart';

abstract class ProductListRepository {
  Future<List<Product>> fetchProductList();

  Future<bool> addToCart(Product product);
}

class ProductListApiRepository extends ProductListRepository {
  int page = 0, perPage = 0;

  @override
  Future<List<Product>> fetchProductList() async {
    page = page++;
    perPage = perPage + 20;
    ApiHelper apiHelper = ApiHelper();
    Response response = await apiHelper.callApiWithPostMethod(
      url: apiHelper.baseUrl + "product_list",
      headers: {
        "token":
            "eyJhdWQiOiI1IiwianRpIjoiMDg4MmFiYjlmNGU1MjIyY2MyNjc4Y2FiYTQwOGY2MjU4Yzk5YTllN2ZkYzI0NWQ4NDMxMTQ4ZWMz",
      },
      body: {"page": page.toString(), "perPage": perPage.toString()},
    );
    print("Product list response - ${response.body}");
    if (response.statusCode != 200) throw ProblemConnectingException();
    final jsonResponse = json.decode(response.body);
    if (jsonResponse['message'] != "success") throw SomeProblemOccurException();
    List<Product> productList = productListFromJson(jsonResponse['data']);
    return productList;
  }

  @override
  Future<bool> addToCart(Product product) async {
    try {
      List<CartItem> cartItemsMatchingProductID =
          await db.getCartItemHavingProductID(product.id);
      if (cartItemsMatchingProductID.length == 0) {
        await db.insertCartItem(CartItem(
          name: product.title,
          price: product.price,
          quantity: 1,
          productImage: product.featuredImage,
          productId: product.id,
          itemTotal: product.price,
        ));
      } else {
        await db.updateCartItem(CartItem(
            cartItemId: cartItemsMatchingProductID[0].cartItemId,
            name: product.title,
            price: product.price,
            quantity: cartItemsMatchingProductID[0].quantity + 1,
            productImage: product.featuredImage,
            productId: product.id,
            itemTotal: product.price * cartItemsMatchingProductID[0].quantity));
      }
      return true;
    } on Exception catch (e) {
      print("Some exception occur while inserting to database :");
      print(e.toString());
      return false;
    }
  }
}
