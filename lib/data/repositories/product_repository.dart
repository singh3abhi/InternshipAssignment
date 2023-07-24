import 'package:dio/dio.dart';
import 'package:internship_assignment/constants/api.dart';
import 'package:internship_assignment/data/models/getListings/product_item_model.dart';

class ProductRepository {
  final _api = Api();

  Future<List<Product>> fetchProducts({required int page}) async {
    try {
      Response response = await _api.sendRequest.get('/getListings?page=$page&limit=10');

      ApiResponse apiResponse = ApiResponse.fromResponse(response, 'listings');

      return (apiResponse.data as List<dynamic>).map((json) => Product.fromJson(json)).toList();
    } catch (ex) {
      rethrow;
    }
  }
}
