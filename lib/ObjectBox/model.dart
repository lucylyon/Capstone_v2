import 'package:objectbox/objectbox.dart';

// https://www.youtube.com/watch?v=6YPSQPS_bhU
// object box tutorial

//enum TableState { open, dirty, seated, disabled }

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

  // bool seated?

  Party(this.name, this.size, this.phoneNumber, this.timeQuoted, this.timeAdded,
      {this.id = 0});

  //final table = ToOne<myTable>();
}

@Entity()
class myTable {
  @Id()
  int id;

  int tableNumber;
  String state;
  bool preAssigned;

  myTable(this.tableNumber, this.state, this.preAssigned, {this.id = 0});
}

// string state
// int tableNumber
// Party? Party
// gonna need CounterBody for time
