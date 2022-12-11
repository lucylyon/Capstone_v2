// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import '../Objects/ObjectBox/model.dart';
import '../Objects/ObjectBox/objectBox.dart';

class TableButton extends StatefulWidget {
  final myTable table;

  const TableButton({Key? key, required this.table}) : super(key: key);

  @override
  State<TableButton> createState() => TableButtonState();
}

class TableButtonState extends State<TableButton> {
// this is a future problem
  final ValueNotifier<Duration> counter =
      ValueNotifier<Duration>(Duration(seconds: 0));

  Color tableColor() {
    if (widget.table.state == 'open') {
      return Colors.green;
    } else if (widget.table.state == 'dirty') {
      return Colors.red;
    } else if (widget.table.state == 'seated') {
      return Colors.blue;
    }
    return Colors.blueGrey;
  }

  Color tableOutlineColor() {
    // if (widget.table.preassigned) {
    //   return Color.fromARGB(255, 232, 199, 16);
    //} else
    if (widget.table.state == 'open') {
      return Color.fromARGB(255, 23, 133, 47);
    } else if (widget.table.state == 'dirty') {
      return Color.fromARGB(255, 193, 30, 18);
    } else if (widget.table.state == 'seated') {
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
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
      child: ElevatedButton(
        onPressed: (() {
          print('pressed');
        }),
        style: ButtonStyle(
            // fixedSize: MaterialStateProperty.all(Size(60, 60)),
            backgroundColor: MaterialStateProperty.all(tableColor()),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            )),
            side: MaterialStateProperty.all(BorderSide(
              width: 8.0,
              color: tableOutlineColor(),
            ))),
        child: Text(
          widget.table.tableNumber.toString(),
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}


//COLORS: 
//open = all green
//dirty = all red
//seated = all blue
//disabled = all grey & disabled

//preassigned = backgroundColor doesnt change, blue outline d)