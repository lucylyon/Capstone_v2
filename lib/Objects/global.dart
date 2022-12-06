// ignore_for_file: prefer_const_constructors

import '../Objects/Party.dart';
import 'Table.dart';

enum TableState { open, dirty, seated, disabled }

List<Party> waitList = [];

myTable table = myTable(
    tableNumber: 1, state: TableState.open, party: false, preassigned: false);
myTable table2 = myTable(
    tableNumber: 2, state: TableState.dirty, party: false, preassigned: false);
myTable table3 = myTable(
    tableNumber: 3, state: TableState.open, party: false, preassigned: true);
myTable table4 = myTable(
    tableNumber: 4, state: TableState.seated, party: false, preassigned: false);
myTable table5 = myTable(
    tableNumber: 5, state: TableState.open, party: false, preassigned: false);
myTable table6 = myTable(
    tableNumber: 6, state: TableState.open, party: false, preassigned: false);
myTable table7 = myTable(
    tableNumber: 7, state: TableState.open, party: false, preassigned: false);
myTable table8 = myTable(
    tableNumber: 8, state: TableState.open, party: false, preassigned: false);
myTable table9 = myTable(
    tableNumber: 9, state: TableState.open, party: false, preassigned: false);
myTable table10 = myTable(
    tableNumber: 10, state: TableState.open, party: false, preassigned: false);
myTable table11 = myTable(
    tableNumber: 11, state: TableState.open, party: false, preassigned: false);
myTable table12 = myTable(
    tableNumber: 12, state: TableState.open, party: false, preassigned: false);
myTable table13 = myTable(
    tableNumber: 13, state: TableState.open, party: false, preassigned: false);
myTable table14 = myTable(
    tableNumber: 14, state: TableState.open, party: false, preassigned: false);
myTable table15 = myTable(
    tableNumber: 15, state: TableState.open, party: false, preassigned: false);
myTable table16 = myTable(
    tableNumber: 16, state: TableState.open, party: false, preassigned: false);
// this stuff database?
