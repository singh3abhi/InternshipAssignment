import 'package:internship_assignment/data/models/getListings/product_item_model.dart';

abstract class ProductState {
  final List<Product> products;
  ProductState(this.products);
}

class ProductIntialState extends ProductState {
  ProductIntialState() : super([]);
}

class ProductLoadingState extends ProductState {
  ProductLoadingState(super.products);
}

class ProductLoadedState extends ProductState {
  ProductLoadedState(super.products);
}

class ProductLoadingMoreState extends ProductState {
  ProductLoadingMoreState(super.products);
}

class ProductErrorState extends ProductState {
  final String message;
  ProductErrorState(this.message, super.products);
}
