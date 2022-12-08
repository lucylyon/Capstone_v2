import 'package:objectbox/objectbox.dart';

@Entity()
class Party {
  @Id()
  int id;

  String name;
  String size;
  String phoneNumber;
  int timeQuoted;

  @Property(type: PropertyType.date)
  DateTime timeAdded;
  // int size;
  // String phoneNumber;
  // int timeQuoted;
  // DateTime timeAdded;
  // bool seated?

  Party(this.name, this.size, this.phoneNumber, this.timeQuoted, this.timeAdded,
      {this.id = 0});

  final table = ToOne<myTable>();
}

@Entity()
class myTable {
  @Id()
  int id;

  int tableNumber;

  myTable(this.tableNumber, {this.id = 0});
}



  // final int tableNumber;
  // final TableState state;
  // final Party party; // fix this later
  // final int(table?) preassigned;