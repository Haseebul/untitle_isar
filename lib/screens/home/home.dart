import 'package:flutter/material.dart';
import 'package:untitle_isar/core/base/base_view.dart';
import 'package:untitle_isar/core/base/view_state.dart';
import 'package:untitle_isar/screens/home/home_vm.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<HomeVM>(
      model: HomeVM(),
      onModelReady: (homeVM) async {
        await homeVM.openDB();
        await homeVM.getAllUsers();
      },
      builder: (context, homeVM, child) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.pink,
          ),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(hintText: 'Name'),
                  controller: homeVM.nameTEC,
                ),
                TextFormField(
                  decoration: const InputDecoration(hintText: 'Age'),
                  controller: homeVM.ageTEC,
                ),
                const SizedBox(height: 20),
                (homeVM.state == ViewState.Busy)
                    ? const CircularProgressIndicator()
                    : ElevatedButton(
                        onPressed: () async {
                          await homeVM.addUserData();
                        },
                        child: const Text('Add User'),
                      ),
                const SizedBox(height: 20),
                (homeVM.loader)
                    ? const Center(child: CircularProgressIndicator())
                    : Expanded(
                        child: RefreshIndicator(
                          onRefresh: () {
                            return homeVM.getAllUsers();
                          },
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: homeVM.users.length,
                            itemBuilder: (context, index) {
                              final user = homeVM.users[index];
                              return ListTile(
                                title: Text(user?.name ?? ''),
                                subtitle: Text('${user?.age ?? ''}'),
                                trailing: IconButton(
                                  icon: const Icon(
                                    Icons.delete,
                                    color: Colors.red,
                                  ),
                                  onPressed: () async {
                                    int id = user!.id;
                                    await homeVM.deleteUserData(id);
                                  },
                                ),
                              );
                            },
                          ),
                        ),
                      ),
              ],
            ),
          ),
        );
      },
    );
  }
}
