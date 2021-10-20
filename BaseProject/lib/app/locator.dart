import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:sqflite_migration_service/sqflite_migration_service.dart';

import 'locator.config.dart';

final locator = GetIt.instance;

@InjectableInit(usesNullSafety: false)
void setupLocator() {
  locator.registerLazySingleton(() => DatabaseMigrationService());
  $initGetIt(locator);
}
