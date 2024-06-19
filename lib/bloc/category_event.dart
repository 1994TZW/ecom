part of 'category_bloc.dart';

sealed class CategoryEvent {
  const CategoryEvent();
}

final class CategoryStarted extends CategoryEvent {}
