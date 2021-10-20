import 'base_parameters.dart';

class DevParameter extends BaseParameter {
  // TODO set correct configuration
  const DevParameter()
      : super(appName: "Ras", baseUrl: "https://reqres.in/api/users?");

  @override
  Flavor get flavor => Flavor.development;
}
