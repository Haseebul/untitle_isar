import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:untitle_isar/screens/home/home_vm.dart';

List<SingleChildWidget> providers = [
  //splash or on-boarding
  ChangeNotifierProvider(create: (_) => HomeVM()),
];
