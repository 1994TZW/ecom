part of 'product_bloc.dart';

sealed class ProductState {
  const ProductState();
}

final class ProductLoading extends ProductState {}

final class ProductLoaded extends ProductState {
  const ProductLoaded({this.products = const []});
  final List<Product> products;
}

final class ProductError extends ProductState {}
