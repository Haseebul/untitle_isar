import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:untitle_isar/core/model/user/user_model.dart';
import 'package:untitle_isar/path_file.dart';

class HomeVM extends BaseNotifier {
  HomeVM();

  List<UserModel?> users = <UserModel?>[];
  bool loader = false;
  final nameTEC = TextEditingController();
  final ageTEC = TextEditingController();

  Future<void> addUserData() async {
    setState(ViewState.Busy);
    log('<===================================');
    String name = nameTEC.text.trim();
    String age = ageTEC.text.trim();
    if (name.isNotEmpty && age.isNotEmpty) {
      int ageValue = int.parse(age);
      final user = UserModel()
        ..name = name
        ..age = ageValue;
      await Future.delayed(const Duration(seconds: 2));
      await addUser(user);
      setState(ViewState.Idle);
      log('===================================================>');
    }
  }

  getAllUsers() async {
    loader = true;
    await Future.delayed(const Duration(seconds: 5));
    users = await getUsers();
    loader = false;
    notifyListeners();
  }
}
