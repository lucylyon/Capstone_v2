//import 'objectbox.g.dart'; // created by `flutter pub run build_runner build`
import 'package:flutter/material.dart';

import '../objectbox.g.dart';
import 'model.dart';

class ObjectBox {
  late final Store store;

  late final Box<Party2> partyBox;
  late final Box<Table2> tableBox;

  ObjectBox._create(this.store) {
    partyBox = Box<Party2>(store);
    tableBox = Box<Table2>(store);

    if (partyBox.isEmpty()) {
      _putDemoData();
    }
  }

  void _putDemoData() {
    Table2 table1 = Table2(1);
    Table2 table2 = Table2(2);

// create party
    Party2 party1 = Party2('name1');
    // assign a table to them
    party1.table.target = table1;

    Party2 party2 = Party2('name2');
    party2.table.target = table2;

// add parties we just created to PartyBox
    partyBox.putMany([party1, party2]);
  }
}
