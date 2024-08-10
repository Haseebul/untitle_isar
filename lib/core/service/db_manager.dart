import 'package:isar/isar.dart';

// import 'package:untitle_isar/core/model/count/count.dart';
import 'package:path_provider/path_provider.dart';
import 'package:untitle_isar/core/model/user/user_model.dart';

mixin DBManager {
  Future<Isar> openDB() async {
    final dir = await getApplicationDocumentsDirectory();
    if (Isar.instanceNames.isNotEmpty) {
      return await Isar.open(
        [UserModelSchema],
        inspector: true,
        directory: dir.path,
      );
    }
    return Future.value(Isar.getInstance());
  }
}
