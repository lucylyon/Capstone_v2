// ignore_for_file: prefer_const_constructors

import 'Old_Party.dart';
import 'Old_Table.dart';

enum TableState { open, dirty, seated, disabled }

List<Old_Party> waitList = [];

Old_Table table = Old_Table(
    tableNumber: 1, state: TableState.open, party: false, preassigned: false);
Old_Table table2 = Old_Table(
    tableNumber: 2, state: TableState.dirty, party: false, preassigned: false);
Old_Table table3 = Old_Table(
    tableNumber: 3, state: TableState.open, party: false, preassigned: true);
Old_Table table4 = Old_Table(
    tableNumber: 4, state: TableState.seated, party: false, preassigned: false);
Old_Table table5 = Old_Table(
    tableNumber: 5, state: TableState.open, party: false, preassigned: false);
Old_Table table6 = Old_Table(
    tableNumber: 6, state: TableState.open, party: false, preassigned: false);
Old_Table table7 = Old_Table(
    tableNumber: 7, state: TableState.open, party: false, preassigned: false);
Old_Table table8 = Old_Table(
    tableNumber: 8, state: TableState.open, party: false, preassigned: false);
Old_Table table9 = Old_Table(
    tableNumber: 9, state: TableState.open, party: false, preassigned: false);
Old_Table table10 = Old_Table(
    tableNumber: 10, state: TableState.open, party: false, preassigned: false);
Old_Table table11 = Old_Table(
    tableNumber: 11, state: TableState.open, party: false, preassigned: false);
Old_Table table12 = Old_Table(
    tableNumber: 12, state: TableState.open, party: false, preassigned: false);
Old_Table table13 = Old_Table(
    tableNumber: 13, state: TableState.open, party: false, preassigned: false);
Old_Table table14 = Old_Table(
    tableNumber: 14, state: TableState.open, party: false, preassigned: false);
Old_Table table15 = Old_Table(
    tableNumber: 15, state: TableState.open, party: false, preassigned: false);
Old_Table table16 = Old_Table(
    tableNumber: 16, state: TableState.open, party: false, preassigned: false);
// this stuff database?
