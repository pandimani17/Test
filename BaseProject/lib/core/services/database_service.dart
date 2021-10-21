import 'package:injectable/injectable.dart';
import 'package:newproject/app/locator.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_migration_service/sqflite_migration_service.dart';

const String DB_NAME = 'Test.sqlite';

class DatabaseService {
  Database _database;
  final _migrationService = locator<DatabaseMigrationService>();

  Future initialise() async {
    _database = await openDatabase(DB_NAME, version: 1);

    await _migrationService.runMigration(
      _database,
      migrationFiles: [
        '1_create_schema.sql',
      ],
      verbose: true,
    );
  }
}

@module
abstract class StackedServices {
  @lazySingleton
  DatabaseService get databaseservice;
}
