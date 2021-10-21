import 'base_parameters.dart';

class DevParameter extends BaseParameter {
  // TODO set correct configuration
  const DevParameter()
      : super(
            appName: "task",
            baseUrl: "https://www.mocky"
                ".io/v2/5dfccffc310000efc8d2c1ad");

  @override
  Flavor get flavor => Flavor.development;
}
