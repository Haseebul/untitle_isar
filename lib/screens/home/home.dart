import 'package:flutter/material.dart';
import 'package:untitle_isar/core/base/base_view.dart';
import 'package:untitle_isar/screens/home/home_vm.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView(
      model: HomeVM(),
      onModelReady: (homeVM) async {
        await homeVM.openDB();
      },
      builder: (context, homeVM, child) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.pink,
          ),
          body: const Column(
            children: [],
          ),
        );
      },
    );
  }
}
