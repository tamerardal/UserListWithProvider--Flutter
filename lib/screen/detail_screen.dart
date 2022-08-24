import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:provider/src/provider.dart';
import 'package:user_list/management/user_management.dart';
import 'package:user_list/model/user_model.dart';

class DetailPage extends StatelessWidget {
  int id;
  DetailPage({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => UserManagement(id: id),
      child: Scaffold(
        appBar: buildAppBar(),
        body: GetBody(),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      title: const Text(
        "Detail Page",
      ),
      centerTitle: true,
      backgroundColor: Colors.brown,
    );
  }
}

class GetBody extends StatelessWidget {
  const GetBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return context.watch<UserManagement>().isLoading
        ? Container(
            alignment: Alignment.center,
            child: CircularProgressIndicator(
              color: Colors.brown,
            ))
        : Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: context
                .read<UserManagement>()
                .user
                .asMap()
                .entries
                .map((i) => Column(
                      children: [buildMaterial(i)],
                    ))
                .toList());
  }

  buildMaterial(MapEntry<int, User> i) {
    return Container(
      margin: const EdgeInsets.only(left: 2, right: 2, top: 4),
      child: ListTile(
        title: Text(
          i.value.title.toString(),
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        leading: Text(
          i.value.id.toString(),
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(i.value.body.toString()),
      ),
    );
  }
}
