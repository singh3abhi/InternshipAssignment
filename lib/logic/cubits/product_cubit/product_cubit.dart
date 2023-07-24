import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internship_assignment/data/models/getListings/product_item_model.dart';
import 'package:internship_assignment/data/repositories/product_repository.dart';
import 'package:internship_assignment/logic/cubits/product_cubit/product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  int currentPage = 0;

  ProductCubit() : super(ProductIntialState()) {
    _intialize();
  }

  final ProductRepository _productRepository = ProductRepository();
  void _intialize() async {
    emit(ProductLoadingState(state.products));

    try {
      List<Product> products = await _productRepository.fetchProducts(page: currentPage);
      emit(ProductLoadedState(products));
    } catch (e) {
      emit(ProductErrorState(e.toString(), state.products));
    }
  }

  void loadMoreProducts() async {
    currentPage++;
    emit(ProductLoadingMoreState(state.products));
    try {
      List<Product> existingProdcuts = List.from(state.products);

      List<Product> newProducts = await _productRepository.fetchProducts(page: currentPage);

      existingProdcuts.addAll(newProducts);
      emit(ProductLoadedState(existingProdcuts));
    } catch (e) {
      emit(ProductErrorState(e.toString(), state.products));
    }
  }
}
