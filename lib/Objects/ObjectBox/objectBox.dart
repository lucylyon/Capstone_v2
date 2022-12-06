//import 'objectbox.g.dart'; // created by `flutter pub run build_runner build`
import 'package:flutter/material.dart';

import 'package:capstone_V2/objectbox.g.dart';
import 'model.dart';

class ObjectBox {
  late final Store store;

  late final Box<Party> partyBox;
  late final Box<myTable> tableBox;

  ObjectBox._create(this.store) {
    partyBox = Box<Party>(store);
    tableBox = Box<myTable>(store);

    if (partyBox.isEmpty()) {
      _putDemoData();
    }
  }

  void _putDemoData() {
    myTable table1 = myTable(1);
    myTable table2 = myTable(2);

    // create party
    Party party1 = Party('name1');
    // assign a table to them
    party1.table.target = table1;

    Party party2 = Party('name2');
    party2.table.target = table2;

    // add parties we just created to PartyBox
    partyBox.putMany([party1, party2]);
  }

  //creates objectBox w/ store
  static Future<ObjectBox> create() async {
    final store = await openStore();
    print('objectbox created');
    return ObjectBox._create(store);
  }

  void addParty(String name) {
    //by default everyone is added to table 0, so not passing table as a parameter
    myTable waitListTable = myTable(0); //creates table that is the 'waitlist'
    //aka if anyone is seated at table 0, then they are on the waitlist
    //im sure there is a better way to do this, but this gets the job done
    Party newParty = Party(name);
    newParty.table.target = waitListTable;

    partyBox.put(newParty);

    print(
        'Added party: ${newParty.name} assigned to table ${newParty.table.target?.tableNumber}');
  }

  int addTable(int tableNumber) {
    myTable tableToAdd = myTable(tableNumber);
    int newTableId = tableBox.put(tableToAdd);

    return newTableId;
  }

  Stream<List<Party>> getParties() {
    final builder = partyBox.query()..order(Party_.id, flags: Order.descending);
    return builder.watch(triggerImmediately: true).map((query) => query.find());
  }
}
