part of 'product_bloc.dart';

sealed class ProductState {
  const ProductState();
}

final class ProductLoading extends ProductState {}

final class ProductLoaded extends ProductState {
  final List<Product> products;
  const ProductLoaded({this.products = const []});
}

final class ProductError extends ProductState {}
