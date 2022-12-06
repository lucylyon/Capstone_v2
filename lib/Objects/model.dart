import 'package:objectbox/objectbox.dart';

@Entity()
class Party2 {
  @Id()
  int id;

  String name;
  // int size;
  // String phoneNumber;
  // int timeQuoted;
  // DateTime timeAdded;
  // bool seated?

  Party2(this.name, {this.id = 0});

  final table = ToOne<Table2>();
}

@Entity()
class Table2 {
  @Id()
  int id;

  int tableNumber;

  Table2(this.tableNumber, {this.id = 0});
}



  // final int tableNumber;
  // final TableState state;
  // final Party party; // fix this later
  // final int(table?) preassigned;