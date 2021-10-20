// import 'package:firebase_database/firebase_database.dart';
import 'package:injectable/injectable.dart';
import 'package:newproject/app/locator.dart';
import 'package:newproject/core/data/api_model/usersmodel.dart';
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

  Future<List<Data>> getTodos() async {
    List<Map> todoResults = await _database.query("Data");
    return todoResults.map((todo) => Data.fromJson(todo)).toList();
  }

  Future addTodo(List usersmodel) {
    Batch batch = _database.batch();
    usersmodel.forEach((val) async {
      Data city = Data.fromMap(val);
      List<Map> result = await _database.rawQuery(
          'SELECT * FROM Data WHERE '
          'id=?',
          [city.id]);
      if (result.length == 0) {
        batch.insert("Data", city.toMap());
      }
    });
    batch.commit();

    // for (int i = 0; i < usersmodel.length; i++) {
    //   Map<String, Object> values = Map();
    //   Data usermodel1 = Data();
    //   usermodel1.id = usersmodel[i].id;
    //   usermodel1.firstName = usersmodel[i].firstName;
    //   usermodel1.lastName = usersmodel[i].lastName;
    //   usermodel1.email = usersmodel[i].email;
    //   values.addAll(usermodel1.toJson());
    //   try {
    //     await _database.insert("Data", values);
    //     print('todo inserted succesfully');
    //   } catch (e) {
    //     print('Could not insert the todo: $e');
    //   }
    // }
  }
}

@module
abstract class StackedServices {
  @lazySingleton
  DatabaseService get databaseservice;
}

// class Firebaseservice {
//   DatabaseReference _messagesRef;
//   pushmessage(String name, Message msg) {
//     _messagesRef = FirebaseDatabase.instance.reference().child(name);
//     _messagesRef.push().set(msg.toJson());
//   }
// }

// @module
// abstract class StackedService {
//   @lazySingleton
//   Firebaseservice get firebasecerive;
// }
