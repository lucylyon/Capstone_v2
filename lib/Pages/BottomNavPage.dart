import 'package:capstone_V2/Pages/PartyInfoPage.dart';
import 'package:flutter/material.dart';
import '../Pages/TablesPage.dart';
import '../Pages/WaitlistPage.dart';
import '../Pages/PartyInfoPage.dart';

class BottomNavPage extends StatefulWidget {
  const BottomNavPage({super.key});

  @override
  State createState() => BottomNavPageState();
}

class BottomNavPageState extends State<BottomNavPage> {
  List<Widget> children = [WaitlistPage(), PartyInfoPage(), TablesPage()];
  //List<Widget> children = [testPage(), PartyInfoPage(), TablesPage()];
  int currentIndex = 0;

  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> widgetOptions = <Widget>[
    Text(
      'Index 0: Waitlist',
      style: optionStyle,
    ),
    Text(
      'Index 2: Tables',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
//  children = [PartyInfoPage()];
    return Scaffold(
      body: children[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(
                Icons.table_rows_outlined,
                color: Colors.blueGrey,
              ),
              label: 'Waitlist'),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.tag_faces,
              color: Colors.blueGrey,
            ),
            label: 'Testing',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.table_bar,
              color: Colors.blueGrey,
            ),
            label: 'Tables',
          ),
        ],
        currentIndex: currentIndex,
        selectedItemColor: Colors.black,
        onTap: _onItemTapped,
      ),
    );
  }
}
