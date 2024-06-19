part of 'product_bloc.dart';

sealed class ProductEvent {
  const ProductEvent();
}

final class ProductDataLoaded extends ProductEvent {
  final String categoryId;
  const ProductDataLoaded(this.categoryId);
}
