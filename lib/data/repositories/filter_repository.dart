import 'package:dio/dio.dart';
import 'package:internship_assignment/constants/api.dart';
import 'package:internship_assignment/data/models/getFilters/filter_item_model.dart';

class FilterRepository {
  final _api = Api();

  Future<Filters> fetchFilters() async {
    try {
      Response response = await _api.sendRequest.get('/getFilters?isLimited=true');

      ApiResponse apiResponse = ApiResponse.fromResponse(response, 'filters');

      return Filters.fromJson(apiResponse.data);
    } catch (ex) {
      rethrow;
    }
  }
}
