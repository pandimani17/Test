abstract class BaseParameter {
  final String appName;
  final String baseUrl;

  Flavor get flavor;

  const BaseParameter({this.appName, this.baseUrl});
}

enum Flavor { development, production, staging }
