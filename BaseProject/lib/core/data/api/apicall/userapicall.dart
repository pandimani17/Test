import 'package:injectable/injectable.dart';
import 'package:newproject/core/basics/abstract/ApiResource.dart';
import 'package:newproject/core/data/api/models/api_response.dart';

import '../restapi.dart';

@singleton
class Userapi extends ApiResource {
  RestApi _restapi;

  Userapi(RestApi restApi) : _restapi = restApi;

  Future<ApiResponse> getusers(String url) {
    return _restapi.getusers(this.getUrl(url));
  }
}
