import 'package:injectable/injectable.dart';
import 'package:newproject/core/basics/abstract/ApiResource.dart';
import 'package:newproject/core/data/api/models/api_response.dart';

import '../restapi.dart';

@singleton
class dishesapicall extends ApiResource {
  RestApi _restapi;
  dishesapicall(RestApi restApi) : _restapi = restApi;

  Future<ApiResponse> getdishes() {
    return _restapi.getdishes(this.getUrl());
  }
}
