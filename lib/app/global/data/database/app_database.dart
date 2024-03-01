import 'dart:async';

import 'package:sembast/sembast.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast_io.dart';

class AppDataBase {
  // single tone
  AppDataBase._();

  static final AppDataBase instance = AppDataBase._();

  //

  Completer<Database>? _dbOpenCompleter;

  Future<Database> get database async {
    if (_dbOpenCompleter == null) {
      _dbOpenCompleter = Completer();
      _openDatabase();
    }
    //return database
    return _dbOpenCompleter!.future;
  }

  Future _openDatabase() async {
    final appDocumentDir = await getApplicationDocumentsDirectory();
    final path = "${appDocumentDir.path}mada-school.db";
    final database = await databaseFactoryIo.openDatabase(path);
    _dbOpenCompleter?.complete(database);
  }
}
