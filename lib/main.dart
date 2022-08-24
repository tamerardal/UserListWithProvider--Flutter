import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_list/screen/search.dart';
import 'screen/detail_screen.dart';
import 'management/users_management.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<UsersManagement>(
            create: (context) => UsersManagement()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(),
      home: const MyHomePage(title: 'Users List'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
        backgroundColor: Colors.brown,
        toolbarHeight: 75,
        // ignore: prefer_const_constructors
        shape: RoundedRectangleBorder(
          // ignore: prefer_const_constructors
          borderRadius: BorderRadius.vertical(
            // ignore: prefer_const_constructors
            bottom: Radius.circular(6.5),
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {
                showSearch(context: context, delegate: Search());
              },
              icon: Icon(Icons.search))
        ],
      ),
      body: Container(
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: context.watch<UsersManagement>().isLoading
              ? const CircularProgressIndicator(
                  color: Colors.brown,
                )
              : buildCenterWidget(context),
        ),
      ),
    );
  }

  buildCenterWidget(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 1, right: 1),
      child: Column(
          children: context
              .read<UsersManagement>()
              .users
              .asMap()
              .entries
              .map(
                (e) => Column(
                  children: [
                    Material(
                      elevation: 5,
                      child: Container(
                        margin:
                            const EdgeInsets.only(left: 2, right: 2, top: 4),
                        child: ListTile(
                          onTap: () {
                            // UserManagement().getUserById(e.value.id);
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (builder) => DetailPage(
                                  id: e.value.id ?? 0,
                                ),
                              ),
                            );
                          },
                          title: Text(
                            e.value.title.toString(),
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          leading: Text(
                            e.value.id.toString(),
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          shape: const RoundedRectangleBorder(
                              side: BorderSide(color: Colors.black12, width: 1),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(2))),
                          tileColor: Colors.brown.shade50,
                        ),
                      ),
                    )
                  ],
                ),
              )
              .toList()),
    );
  }
}
