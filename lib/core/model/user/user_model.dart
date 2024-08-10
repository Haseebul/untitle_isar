import 'package:isar/isar.dart';

part 'user_model.g.dart';

@collection
class UserModel {
  Id id = Isar.autoIncrement; // you can also use id = null to auto increment

  String? name;
  int? age;
}
//command for create model
//flutter pub run build_runner build --delete-conflicting-outputs