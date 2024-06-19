import 'package:ecom/model/product_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../vo/product.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc({required this.productModel}) : super(ProductLoading()) {
    on<ProductDataLoaded>(_onLoadProduct);
  }

  final ProductModel productModel;

  Future<void> _onLoadProduct(
      ProductDataLoaded event, Emitter<ProductState> emit) async {
    emit(ProductLoading());
    try {
      final items = await productModel.getProducts(event.categoryId);
      emit(ProductLoaded(products: items));
    } catch (_) {
      emit(ProductError());
    }
  }
}
