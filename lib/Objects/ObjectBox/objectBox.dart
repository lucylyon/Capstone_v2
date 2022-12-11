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
      putTableData();
    }
  }

  void putTableData() {
    for (int i = 1; i < 16; i++) {
      tableBox.put(myTable(i, 'open'));
    }
    //  myTable table1 = myTable(1, 'open');
    //  myTable table2 = myTable(2, 'open');

    //tableBox.putMany([table1, table2]);
    //print('tables ${tableBox.getAll().toString()} added');
  }

  //creates objectBox w/ store
  static Future<ObjectBox> create() async {
    final store = await openStore();
    return ObjectBox._create(store);
  }

  void addParty(Party newParty) {
    //   myTable waitListTable = myTable(0, TableState.disabled);
    myTable waitListTable = myTable(0, 'open');
    //creates table that is the 'waitlist'
    //aka if anyone is seated at table 0, then they are on the waitlist
    //im sure there is a better way to do this, but this gets the job done
    print('in objectbox addParty');
    // newParty.table.target = waitListTable;
    partyBox.put(newParty);
  }

  int addTable(int tableNumber) {
    myTable tableToAdd = myTable(tableNumber, 'open');
    //myTable tableToAdd = myTable(tableNumber, TableState.open);
    int newTableId = tableBox.put(tableToAdd);

    return newTableId;
  }

  Stream<List<Party>> getParties() {
    final builder = partyBox.query()..order(Party_.id);
    return builder.watch(triggerImmediately: true).map((query) => query.find());
  }

  Stream<List<myTable>> getTables() {
    final builder = tableBox.query()..order(myTable_.id);
    return builder.watch(triggerImmediately: true).map((query) => query.find());
  }
}
