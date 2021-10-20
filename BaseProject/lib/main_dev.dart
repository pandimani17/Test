import 'package:newproject/maincommon.dart';

import 'app/Parameters/dev_parameters.dart';
import 'app/app_config.dart';

main() async {
  maincommon(() {
    AppConfig.init(DevParameter());
  });
}
