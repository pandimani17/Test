import 'package:newproject/app/app_config.dart';

abstract class ApiResource {
  String get baseUrl => appConfig.parameters.baseUrl;

  String getUrl(String path) => this.baseUrl + path;
}
