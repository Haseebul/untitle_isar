import 'dart:developer';

import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:untitle_isar/core/model/user/user_model.dart';

mixin DBManager {
  late Isar isar;

  Future<void> openDB() async {
    final dir = await getApplicationDocumentsDirectory();
    isar = await Isar.open(
      [UserModelSchema],
      inspector: true,
      directory: dir.path,
    );
  }

  Future<void> addUser(UserModel user) async {
    await isar.writeTxn(() async {
      await isar.userModels.put(user);
    });
  }

  Future<List<UserModel?>> getUsers() async {
    final users = await isar.userModels.where().findAll();
    return users;
  }

  Future<void> deleteUser(int id) async {
    await isar.userModels.delete(id);
  }
}
