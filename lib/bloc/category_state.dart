part of 'category_bloc.dart';

sealed class CategoryState {
  const CategoryState();
}

final class CategoryLoading extends CategoryState {}

final class CategoryLoaded extends CategoryState {
  const CategoryLoaded(this.categories);
  final List<Category> categories;
}

final class CatalogError extends CategoryState {}
