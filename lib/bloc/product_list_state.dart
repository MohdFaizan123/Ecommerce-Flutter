part of 'product_list_cubit.dart';

@immutable
abstract class ProductListState {
  const ProductListState();
}

class ProductListStateInitial extends ProductListState {
  const ProductListStateInitial();
}

class ProductListStateLoading extends ProductListState {}

class ProductListStateLoaded extends ProductListState {
  final List<Product> productList;
  final bool isLoading;

  const ProductListStateLoaded(this.productList, {this.isLoading});
}

class ProductListStateError extends ProductListState {
  final String errorMessage;

  const ProductListStateError(this.errorMessage);
}
