// ignore_for_file: prefer_const_constructors

import 'package:capstone_V2/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:flutter/src/widgets/container.dart';
//import 'package:flutter/src/widgets/framework.dart';
import '../ObjectBox/model.dart';
import '../ObjectBox/objectBox.dart';
import 'popupButton.dart';

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
    if (widget.table.preAssigned && widget.table.state != 'disabled') {
      return Color.fromARGB(255, 232, 199, 16);
    } else if (widget.table.state == 'open') {
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
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
      child: ElevatedButton(
        onPressed: (() {
          tableTappedDialog(widget.table);
        }),
        style: ButtonStyle(
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

  void tableTappedDialog(myTable table) => showDialog(
      context: context,
      builder: (context) => FractionallySizedBox(
            widthFactor: .8,
            heightFactor: .7,
            child: AlertDialog(
              title: Text('Table ${table.tableNumber.toString()}'),
              content: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  MyButton(
                    btnText: 'Preassign',
                    onPressed: () {
                      preAssign(table);
                      Navigator.pop(context);
                    },
                  ),
                  Text(
                    'Mark as:',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  MyButton(
                    btnText: 'Open',
                    onPressed: () {
                      markTableOpen(table);
                      Navigator.pop(context);
                    },
                  ),
                  MyButton(
                    btnText: 'Dirty',
                    onPressed: () {
                      markTableDirty(table);
                      Navigator.pop(context);
                    },
                  ),
                  MyButton(
                    btnText: 'Seated',
                    onPressed: () {
                      markTableSeated(table);
                      Navigator.pop(context);
                    },
                  ),
                  MyButton(
                    btnText: 'Disabled',
                    onPressed: () {
                      disableTable(table);
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
              actions: <Widget>[
                TextButton(
                    onPressed: (() => Navigator.pop(context)),
                    child: Text(
                      'Cancel',
                      style: TextStyle(color: Colors.blueGrey),
                    )),
              ],
            ),
          ));
  void markTableDirty(myTable table) {
    setState(() {
      table.state = 'dirty';
    });
  }

  void disableTable(myTable table) {
    setState(() {
      table.state = 'disabled';
    });
  }

  void markTableOpen(myTable table) {
    setState(() {
      table.state = 'open';
    });
  }

  void markTableSeated(myTable table) {
    setState(() {
      table.state = 'seated';
      // table.party = party;
      // start timeTracker;
    });
  }

  void preAssign(myTable table) {
    setState(() {
      table.preAssigned = true;
      //preAssign party
      //dialog (waitlist)
      // when party card clicked, (null) (print)
    });
  }
}

//COLORS:
//open = all green
//dirty = all red
//seated = all blue
//disabled = all grey & disabled

//preassigned = backgroundColor doesnt change, blue outline d)
