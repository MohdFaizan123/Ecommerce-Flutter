import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/data/models/product.dart';
import 'package:ecommerce_app/data/repositories/exceptions.dart';
import 'package:ecommerce_app/data/repositories/product_list_repository.dart';
import 'package:meta/meta.dart';

part 'product_list_state.dart';

class ProductListCubit extends Cubit<ProductListState> {
  final ProductListRepository _productListRepository;
  List<Product> productList = [];

  ProductListCubit(this._productListRepository)
      : super(ProductListStateInitial());

  Future<void> getProductList() async {
    try {
      if (productList.isEmpty)
        emit(ProductListStateLoading());
      else
        emit(ProductListStateLoaded(productList, isLoading: true));
      final tempProductList = await _productListRepository.fetchProductList();
      if (productList.isEmpty)
        productList.addAll(tempProductList);
      else
        productList.insertAll(
          productList.length,
          tempProductList,
        );
      emit(ProductListStateLoaded(productList, isLoading: false));
    } on ProblemConnectingException {
      emit(ProductListStateError(
          "Error connecting to server, please try again later."));
    } on SomeProblemOccurException {
      emit(
          ProductListStateError("Some problem occur, please try again later."));
    }
  }

  Future addToCart(Product product) async {
    await _productListRepository.addToCart(product);
  }
}
