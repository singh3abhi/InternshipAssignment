import 'package:dio/dio.dart';
import 'package:internship_assignment/constants/api.dart';
import 'package:internship_assignment/data/models/searchModel/search_model.dart';

class SearchModelRepository {
  final _api = Api();

  Future<SearchModel> fetchSearchModels(String modelName) async {
    try {
      Map<String, dynamic> requestBody = {
        "searchModel": modelName,
      };

      Response response = await _api.sendRequest.post('/searchModel', data: requestBody);

      ApiResponse apiResponse = ApiResponse.fromResponse(response, null);

      return SearchModel.fromJson(apiResponse.data);
    } catch (ex) {
      rethrow;
    }
  }
}
