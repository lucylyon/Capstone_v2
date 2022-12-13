// ignore_for_file: prefer_const_constructors

import '../ObjectBox/model.dart';
import '../Widgets/tableButton.dart';
import 'package:flutter/material.dart';
import '../main.dart';

class TablesPage extends StatefulWidget {
  const TablesPage({super.key});

  @override
  State createState() => TablesPageState();
}

class TablesPageState extends State<TablesPage> {
  TableButton Function(BuildContext, int) itemBuilder(List<myTable> tables) =>
      (BuildContext context, int index) => TableButton(
            table: tables[index],
          );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      backgroundColor: Colors.blueGrey[50],
      appBar: AppBar(
        title: const Text('Tables'),
        backgroundColor: Colors.blueGrey[700],
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 12.0, bottom: 10.0),
        child: StreamBuilder<List<myTable>>(
            stream: objectbox.getTables(),
            builder: (context, snapshot) {
              if (snapshot.data?.isNotEmpty ?? false) {
                return GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3, childAspectRatio: 1.03),
                    itemCount: snapshot.hasData ? snapshot.data!.length : 0,
                    itemBuilder: itemBuilder(snapshot.data ?? []));
              } else {
                return const Center(child: Text("where are the tables :( "));
              }
            }),
      ),
    ));
  }
}
