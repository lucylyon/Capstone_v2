import 'package:flutter/material.dart';
import '../pages/TablesPage.dart';
import '../pages/WaitlistPage.dart';
import '../pages/BottomNavPage.dart';
import '../pages/PartyInfoPage.dart';
import '../ObjectBox/objectBox.dart';

// goal is to have just waitlistpage and tablespage on bottom nav bar
// party info page will pop up when you click on a party that is in the waitlist
// or if you click the add party button (on waitlist page)
// then empty partyinfo page will open & you fill in all the new info :)

late ObjectBox objectbox;

Future<void> main() async {
  // This is required so ObjectBox can get the application directory
  // to store the database in.
  WidgetsFlutterBinding.ensureInitialized();
  objectbox = await ObjectBox.create();

  runApp(const MyApp());
}
// void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.blueGrey,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        routes: {
          //i don think i need this
          '/': (context) => BottomNavPage(),
          //'/waitlist': (context) => testPage(),
          '/waitlist': (context) => WaitlistPage(),
          //'/partyInfo': (context) => PartyInfoPage(),
          '/tables': (context) => TablesPage()
        });
  }
}
