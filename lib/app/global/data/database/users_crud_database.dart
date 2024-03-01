import 'package:get/get.dart';
import 'package:school/app/global/data/controllers/main_controller.dart';
import 'package:school/app/global/data/database/app_database.dart';
import 'package:school/app/global/data/models/UserModel.dart';
import 'package:sembast/sembast.dart';

import 'dart:developer' as developer;

class UserDatabase {
  static const String USER_STORE_NAME = "users";

  final _userStore = intMapStoreFactory.store(USER_STORE_NAME);

  Future<Database> get _database async => await AppDataBase.instance.database;

  Future addUser(UserModel user) async {
    final finder = Finder(
        filter: Filter.custom((record) => record['email'] == user.email));

    final records = await _userStore.find(await _database, finder: finder);

    if (records.isNotEmpty) {
      developer.log("update user data ${user.toJson()}", name: "database");
      await update(user);
      getAllUsers();
    } else {
      // developer.log("add user data ${user.toJson()}", name: "database");
      await _userStore.add(await _database, user.toJson());
      getAllUsers();
    }
  }

  Future update(UserModel user) async {
    final finder = Finder(
        filter: Filter.custom((record) => record['email'] == user.email));
    var userJson = user.toJson();

    await _userStore.update(await _database, userJson, finder: finder);
  }

  Future getAllUsers() async {
    final finder = Finder(sortOrders: [SortOrder("id")]);
    final records = await _userStore.find(await _database, finder: finder);
    List<UserModel> users = [];
    for (var user in records) {
      users.add(UserModel.fromJson(user.value));
    }
    Get.find<MainController>().localUsers(users);
  }

  Future clearUsers() async {
    // developer.log("clean users data -------------   ----  ", name: "database");

    final finder = Finder();
    await _userStore.delete(await _database, finder: finder);
    Get.find<MainController>().localUsers([]);
  }

  Future deleteUser(UserModel user) async {
    final finder = Finder(
        filter: Filter.custom((record) => record['email'] == user.email));
    await _userStore.delete(await _database, finder: finder);
    int index = Get.find<MainController>()
        .localUsers
        .indexWhere((element) => element.email == user.email);
    if (index != -1) {
      Get.find<MainController>().localUsers.removeAt(index);
    }
  }
}
