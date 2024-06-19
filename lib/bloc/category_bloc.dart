import 'package:flutter_bloc/flutter_bloc.dart';

import '../model/category_model.dart';
import '../vo/category.dart';
part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final CategoryModel categoryModel;

  CategoryBloc({required this.categoryModel}) : super(CategoryLoading()) {
    on<CategoryStarted>(_onStarted);
  }

  Future<void> _onStarted(
      CategoryStarted event, Emitter<CategoryState> emit) async {
    emit(CategoryLoading());
    
    try {
      final catalog = await categoryModel.getCategories();
      emit(CategoryLoaded(catalog));
    } catch (_) {
      emit(CatalogError());
    }
  }
}
