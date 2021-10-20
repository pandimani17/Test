import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:newproject/core/basics/abstract/ApiResource.dart';

import 'models/api_response.dart';

@singleton
class RestApi extends ApiResource {
  final Dio _dio = Dio();

  Future<ApiResponse> getusers(url) async {
    ApiResponse apiResponse;
    Response response = await _dio.get(url);
    apiResponse = ApiResponse(data: response.data, headers: response.headers);
    return apiResponse;
  }
}
