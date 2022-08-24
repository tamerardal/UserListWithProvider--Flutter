import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:user_list/management/user_management.dart';
import 'package:user_list/management/users_management.dart';

import 'detail_screen.dart';
import '../model/user_model.dart';

class Search extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) => [
        IconButton(
            onPressed: () {
              query = '';
            },
            icon: Icon(Icons.clear))
      ];

  @override
  Widget? buildLeading(BuildContext context) => IconButton(
        onPressed: () => close(context, null),
        icon: Icon(Icons.arrow_back),
      );

  @override
  Widget buildResults(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: context
            .read<UsersManagement>()
            .users
            .asMap()
            .entries
            .where((element) => element.value.title!
                .toLowerCase()
                .contains(query.toLowerCase()))
            .map((e) => Column(
                  children: [
                    ListTile(
                      title: Text(e.value.title.toString()),
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (builder) => DetailPage(id: e.value.id!)));
                      },
                    )
                  ],
                ))
            .toList(),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: context
            .read<UsersManagement>()
            .users
            .asMap()
            .entries
            .where((element) => element.value.title!
                .toLowerCase()
                .contains(query.toLowerCase()))
            .map((e) => Column(
                  children: [
                    ListTile(
                      title: Text(e.value.title.toString()),
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (builder) => DetailPage(id: e.value.id!)));
                      },
                    )
                  ],
                ))
            .toList(),
      ),
    );
  }
}
