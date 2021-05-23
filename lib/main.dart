import 'package:ecommerce_app/bloc/cart_item_cubit.dart';
import 'package:ecommerce_app/bloc/product_list_cubit.dart';
import 'package:ecommerce_app/data/repositories/product_list_repository.dart';
import 'package:ecommerce_app/screens/cart_screen.dart';
import 'package:ecommerce_app/screens/product_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'data/database/cart_db.dart';
import 'data/repositories/cart_repository.dart';

final AppDatabase db = AppDatabase();

void main() {
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ecommerce App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: MultiBlocProvider(
        providers: [
          BlocProvider<ProductListCubit>(
            lazy: false,
            create: (context) => ProductListCubit(ProductListApiRepository()),
            child: ProductListScreen(),
          ),
          BlocProvider<CartItemCubit>(
            lazy: false,
            create: (context) => CartItemCubit(DbCartRepository()),
            child: CartScreen(),
          ),
        ],
        child: ProductListScreen(),
      ),
    );
  }
}
