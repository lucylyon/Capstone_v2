// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
//import '../Objects/Old_Party.dart';
import '../Widgets/PartyTappedButton.dart';
import 'dart:async';
//import '../Objects/global.dart';
import '../main.dart';
import '../Objects/ObjectBox/model.dart';
//import '../Widgets/partyCard.dart';
import '../Widgets/waitlistView.dart';

class WaitlistPage extends StatefulWidget {
  const WaitlistPage({super.key});

  @override
  State createState() => WaitlistPageState();
}

class WaitlistPageState extends State<WaitlistPage> {
  String title = '';
  List<DropdownMenuItem<String>> menuItems = [
    DropdownMenuItem(value: "10", child: Text("5-10 minutes")),
    DropdownMenuItem(value: "15", child: Text("10-15 minutes")),
    DropdownMenuItem(value: "20", child: Text("15-20 minutes")),
    DropdownMenuItem(value: "30", child: Text("20-30 minutes")),
    DropdownMenuItem(value: "45", child: Text("30-45 minutes")),
    DropdownMenuItem(value: "60", child: Text("45-60 minutes")),
    DropdownMenuItem(value: "75", child: Text("60+ minutes")),
  ];
  String selectedValue = '10';

  late TextEditingController nameController;
  late TextEditingController sizeController;
  late TextEditingController phoneNumberController;

  String name = '';
  String size = '';
  String phoneNumber = '';
  int timeQuoted = 10;
  String timeAdded = '';

  ValueNotifier<int> counter = ValueNotifier<int>(0);

  // List<myTable> tables = objectbox.tableBox.getAll();
  // late myTable currentTable;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[50],
      appBar: AppBar(
        title: Text('WaitList'),
        backgroundColor: Colors.blueGrey[700],
      ),
      body: WaitList(),
      //Text('waitListView here?'),
      //  ListView(
      //   padding: const EdgeInsets.symmetric(vertical: 8.0),
      //   children: waitList.map(
      //     (item) {
      //       return PartyItem(
      //         party: item,
      //         partyEdit: partyClicked,
      //       );
      //     },
      //   ).toList(),
      // ),
      floatingActionButton: FloatingActionButton(
          onPressed: newPartyDialog, child: const Icon(Icons.add)),
    );
  }

// changed to be Objectbox Party
  void partyTappedDialog(Party party) => showDialog(
      context: context,
      builder: (context) => AlertDialog(
            title: Text(title),
            content: FractionallySizedBox(
              widthFactor: 0.8,
              heightFactor: 0.55,
              child: Column(
                children: [
                  MyButton(
                    btnText: 'Seat',
                    onPressed: (() => Navigator.pop(context)),
                  ),
                  MyButton(
                    btnText: 'Preassign',
                    onPressed: (() => Navigator.pop(context)),
                  ),
                  MyButton(
                    btnText: 'Notify (?)',
                    onPressed: (() => Navigator.pop(context)),
                  ),
                  MyButton(
                    btnText: 'Remove',
                    onPressed: (() => Navigator.pop(context)),
                  ),
                  MyButton(
                    btnText: 'Edit',
                    onPressed: (() => Navigator.pop(context)),
                  ),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                  onPressed: (() => Navigator.pop(context)),
                  child: Text('Cancel')),
            ],
          ));

  //https://www.youtube.com/watch?v=D6icsXS8NeA -- getting popup w/ dialog
  Future<String?> newPartyDialog() => showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
            builder: (context, setState) => AlertDialog(
                    title: Text('New Party'),
                    content: Column(children: [
                      TextField(
                        autofocus: true,
                        decoration: InputDecoration(hintText: 'Name'),
                        controller: nameController,
                      ),
                      TextField(
                        autofocus: true,
                        decoration: InputDecoration(hintText: 'Size'),
                        controller: sizeController,
                      ),
                      TextField(
                        autofocus: true,
                        decoration: InputDecoration(hintText: 'Phone number'),
                        controller: phoneNumberController,
                      ),
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 12.0),
                            child: Text(
                              'Quoted Wait Time: ',
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                          DropdownButton(
                              value: selectedValue,
                              onChanged: (newValue) {
                                setState(() {
                                  selectedValue = newValue!;
                                  timeQuoted = int.parse(selectedValue);
                                });
                              },
                              items: menuItems)
                        ],
                      ),
                    ]),
                    actions: <Widget>[
                      // exits out of popup
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: Text('Cancel'),
                      ),
                      TextButton(
                        onPressed: () {
                          setState(() {
                            DateTime now = DateTime.now();
                            timeAdded = now.minute.toString();
                            createParty(
                              nameController.text,
                              sizeController.text,
                              phoneNumberController.text,
                              timeQuoted,
                              DateTime.now(),
                            );
                            //   create new party here
                            // handlePartyItem(
                            // nameController.text,
                            // sizeController.text,
                            // phoneNumberController.text,
                            // timeQuoted,
                            // DateTime.now(),
                            // );
                            Navigator.pop(context);
                          });
                        },
                        child: Text('Save'),
                      ),
                    ]));
      });

  void submit() {
    Navigator.of(context).pop(nameController.text);
    setState(() {
      name = nameController.text;
      size = sizeController.text;
      phoneNumber = phoneNumberController.text;
    });
    clear();
  }

  // void handlePartyItem(name, size, phoneNumber, timeQuoted, timeAdded) {
  //   setState(() {
  //     Old_Party newParty = Old_Party(
  //       name: name,
  //       size: size,
  //       phoneNumber: phoneNumber,
  //       timeQuoted: timeQuoted,
  //       timeAdded: timeAdded,
  //     );
  //     waitList.add(newParty);
  //     clear();
  //   });
  // }

  void createParty(String name, String size, String phoneNumber, int timeQuoted,
      DateTime timeAdded) {
    Party newParty = Party(name, size, phoneNumber, timeQuoted, timeAdded);

    print('in createParty. (waitlistpage)');
    objectbox.addParty(newParty);
  }

  // void removeParty(Old_Party party) {
  //   setState(() {
  //     waitList.remove(party);
  //     Navigator.pop(context);
  //   });
  // }

  // void partyClicked(Old_Party party) {
  //   setState(() {
  //     title = party.name;
  //     partyTappedDialog(party);
  //   });
  // }

////// all of these are controller functions
  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    sizeController = TextEditingController();
    phoneNumberController = TextEditingController();
  }

  @override
  void dispose() {
    nameController.dispose();
    sizeController.dispose();
    phoneNumberController.dispose();
    super.dispose();
  }

  void clear() {
    nameController.clear();
    sizeController.clear();
    phoneNumberController.clear();
  }
}
