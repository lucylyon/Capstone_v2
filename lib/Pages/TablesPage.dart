// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import '../Objects/Old_Table.dart';
import '../Objects/global.dart';

class TablesPage extends StatefulWidget {
  const TablesPage({super.key});

  @override
  State createState() => TablesPageState();
}

//ADD STATS TO TOP (after database. maybe after break)
// hopefully later: capacity, make it match up w/ party

class TablesPageState extends State<TablesPage> {
  // Color tableColor = Colors.blueGrey;
  // Color tableOutlineColor = Colors.blueAccent;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          backgroundColor: Colors.blueGrey[50],
          appBar: AppBar(
            title: const Text('Tables'),
            backgroundColor: Colors.blueGrey[700],
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TableItem(table: table, tableEdit: tableEdit),
                  TableItem(table: table2, tableEdit: tableEdit),
                  TableItem(table: table3, tableEdit: tableEdit),
                  TableItem(table: table4, tableEdit: tableEdit),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TableItem(table: table5, tableEdit: tableEdit),
                  TableItem(table: table6, tableEdit: tableEdit),
                  TableItem(table: table7, tableEdit: tableEdit),
                  TableItem(table: table8, tableEdit: tableEdit),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TableItem(table: table9, tableEdit: tableEdit),
                  TableItem(table: table10, tableEdit: tableEdit),
                  TableItem(table: table11, tableEdit: tableEdit),
                  TableItem(table: table12, tableEdit: tableEdit),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TableItem(table: table13, tableEdit: tableEdit),
                  TableItem(table: table14, tableEdit: tableEdit),
                  TableItem(table: table15, tableEdit: tableEdit),
                  TableItem(table: table16, tableEdit: tableEdit),
                ],
              )
            ],
          )),
    );
  }

  void tableEdit(Old_Table table) {
    print('table edit');
  }
}

// table = button
// 
// https://pub.dev/packages/outline_gradient_button ?


//table class 
// string status
// int tableNum
// party Party
// gonna need CounterBody for time



//open = all green
//dirty = all red
//seated = all blue
//disabled = all grey & disabled

//preassigned = backgroundColor doesnt change, blue outline d)
