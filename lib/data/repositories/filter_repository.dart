import 'package:dio/dio.dart';
import 'package:internship_assignment/constants/api.dart';
import 'package:internship_assignment/data/models/getFilters/filter_item_model.dart';

class FilterRepository {
  final _api = Api();

  Future<FiltersModel> fetchFilters() async {
    try {
      Response response = await _api.sendRequest.get('/getFilters?isLimited=true');

      ApiResponse apiResponse = ApiResponse.fromResponse(response, 'filters');

      return FiltersModel.fromJson(apiResponse.data);
    } catch (ex) {
      rethrow;
    }
  }
}
