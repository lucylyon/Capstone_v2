import 'package:capstone_V2/objectbox.g.dart';
import 'model.dart';

//tableBox is hard coded; can't change # of tables;

class ObjectBox {
  late final Store store;

  late final Box<Party> partyBox;
  late final Box<myTable> tableBox;

  ObjectBox._create(this.store) {
    partyBox = Box<Party>(store);
    tableBox = Box<myTable>(store);

    if (tableBox.isEmpty()) {
      print('in if tableBox.isEmpty');
      _putTableData();
    }

    if (partyBox.isEmpty()) {
      print('in if partyBox.isEmpty');
      _putDemoData();
    }
  }

  void _putTableData() {
    myTable table1 = myTable(1);
    print('table ${table1.id} created');
    myTable table2 = myTable(2);
    print('table ${table2.id} created');

    tableBox.putMany([table1, table2]);
    print('tables ${tableBox.getAll().toString()} added');
  }

  void _putDemoData() {
    DateTime now = DateTime.now();
    // create party
    Party party1 = Party('name 1', '1', '11', 10, now);
    // assign a table to them
    party1.table.target = tableBox.get(1);

    Party party2 = Party('name 2', '2', '22', 20, now);
    party2.table.target = tableBox.get(2);

    // add parties we just created to PartyBox
    partyBox.putMany([party1, party2]);
  }

  //creates objectBox w/ store
  static Future<ObjectBox> create() async {
    final store = await openStore();
    return ObjectBox._create(store);
  }

  void addParty(Party newParty) {
    myTable waitListTable = myTable(0);
    //creates table that is the 'waitlist'
    //aka if anyone is seated at table 0, then they are on the waitlist
    //im sure there is a better way to do this, but this gets the job done
    print('in objectbox addParty');
    newParty.table.target = waitListTable;
    partyBox.put(newParty);

    print(
        'Added party: \'${newParty.name}\' assigned to table ${newParty.table.target?.tableNumber}');
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

  // for testing purposes:
  void getPartyNames() {
    if (partyBox.isEmpty()) {
      print('party box is empty');
    }
    for (var i = partyBox.count(); i > 0; i--) {
      print(partyBox.get(i)?.name);
    }
  }
}
