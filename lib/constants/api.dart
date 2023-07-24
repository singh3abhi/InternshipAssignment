import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

const String baseUrl = "https://dev2be.oruphones.com/api/v1/global/assignment/";
const Map<String, dynamic> defaultHeaders = {
  'Content-Type': 'application/json'
};

class Api {
  final Dio _dio = Dio();

  Api() {
    _dio.options.baseUrl = baseUrl;
    _dio.options.headers = defaultHeaders;

    _dio.interceptors.add(PrettyDioLogger(
      requestBody: true,
      requestHeader: true,
      responseBody: true,
      responseHeader: true,
    ));
  }

  Dio get sendRequest => _dio;
}

class ApiResponse {
  dynamic data;
  String? message;

  ApiResponse({
    this.data,
    this.message,
  });

  factory ApiResponse.fromResponse(Response response, String? name) {
    final data = response.data as Map<String, dynamic>;

    if (name == null) {
      return ApiResponse(data: data);
    } else {
      return ApiResponse(
        data: data[name],
        message: data['message'],
      );
    }
  }
}
