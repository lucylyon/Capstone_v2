// ignore_for_file: prefer_const_constructors

import 'dart:async';
import 'package:flutter/material.dart';
import 'CounterBody.dart';
import 'Old_Party.dart';
import 'global.dart';

// using party as a base
// ignore: camel_case_types
class Old_Table {
  const Old_Table({
    required this.tableNumber,
    required this.state,
    required this.party,
    required this.preassigned,
  });
  final int tableNumber;
  final TableState state;
  final bool party; // fix this later
  final bool preassigned;
}

// is it possible to have maybe Party preassignedParty
// also maybe DateTime seated

typedef TableEditCallback = Function(Old_Table table);

class TableItem extends StatelessWidget {
  TableItem({required this.table, required this.tableEdit})
      : super(key: ObjectKey(table));

  final Old_Table table;
  final TableEditCallback tableEdit;
  //get rid of these ? just use onPressed: tablePressedDialog
  final ValueNotifier<Duration> counter =
      ValueNotifier<Duration>(Duration(seconds: 0));

  Color tableColor() {
    if (table.state == TableState.open) {
      return Colors.green;
    } else if (table.state == TableState.dirty) {
      return Colors.red;
    } else if (table.state == TableState.seated) {
      return Colors.blue;
    }
    return Colors.blueGrey;
  }

  Color tableOutlineColor() {
    if (table.preassigned) {
      return Color.fromARGB(255, 232, 199, 16);
    } else if (table.state == TableState.open) {
      return Color.fromARGB(255, 23, 133, 47);
    } else if (table.state == TableState.dirty) {
      return Color.fromARGB(255, 193, 30, 18);
    } else if (table.state == TableState.seated) {
      return Color.fromARGB(255, 15, 33, 170);
    }
    return tableColor();
  }

  @override
  Widget build(BuildContext context) {
// keeps track of how long party has been seating; needs to only happen when
// table is marked as seated.. hm.
    // Timer.periodic(const Duration(seconds: 10), (timer) {
    //   counter.value = DateTime.now().difference(table.timeAdded);
    // });
    //  CounterBody(counterValueNotifier: counter)

// make onPressed like partyClickedDialog

    return RawMaterialButton(
      onPressed: tableEdit(table),
      child: ElevatedButton(
        onPressed: tableEdit(table),
        style: ButtonStyle(
            fixedSize: MaterialStateProperty.all(Size(60, 60)),
            backgroundColor: MaterialStateProperty.all(tableColor()),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            )),
            side: MaterialStateProperty.all(BorderSide(
              width: 5.0,
              color: tableOutlineColor(),
            ))),
        child: Text(
          table.tableNumber.toString(),
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}


//tablePressedDialog
//blah blah blah
//row
// text(Mark as:)
//expanded( children: <Widget> Row(
// disable button
// change sections button
// preassign button
//when clicked:
// list of parties comes up
// basically same as waitlist page, party object should work
// tap on party
// tableOutline = different color (blue?)

// ))
