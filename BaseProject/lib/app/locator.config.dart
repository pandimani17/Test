// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../core/data/api/apicall/dishesapicall.dart' as _i5;
import '../core/data/api/restapi.dart' as _i4;
import '../core/services/database_service.dart'
    as _i3; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String environment, _i2.EnvironmentFilter environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final stackedServices = _$StackedServices();
  gh.lazySingleton<_i3.DatabaseService>(() => stackedServices.databaseservice);
  gh.singleton<_i4.RestApi>(_i4.RestApi());
  gh.singleton<_i5.dishesapicall>(_i5.dishesapicall(get<_i4.RestApi>()));
  return get;
}

class _$StackedServices extends _i3.StackedServices {
  @override
  _i3.DatabaseService get databaseservice => _i3.DatabaseService();
}
