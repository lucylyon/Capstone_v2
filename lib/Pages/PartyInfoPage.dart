// ignore_for_file: prefer_const_constructors

import 'dart:ffi';

import 'package:flutter/material.dart';
import 'dart:async';
import '../Objects/CounterBody.dart';
import 'package:flutter/scheduler.dart';

class PartyInfoPage extends StatefulWidget {
  const PartyInfoPage({super.key});

  @override
  State createState() => PartyInfoPageState();
}

class PartyInfoPageState extends State<PartyInfoPage> {
  // Initial Selected Value
  String dropdownvalue = '5-10 minutes';

  // List of items in our dropdown menu
  // var items = [
  // '1',
  // '2',
  // '3',
  //   '4',
  //   '5',
  //   '6',
  //   '7',
  //   '8',
  //   '9',
  //   '10',
  //   '11',
  //   '12',
  //   '13',
  //   '14',
  //   '15'
  // ];

  var items = [
    '5-10 minutes',
    '10-15 minutes',
    '15-20 minutes',
    '20-30 minutes',
    '30-45 minutes',
    '45-60 minutes',
    '60+ minutes'
  ];

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String formatNow = now.minute.toString();

    Stopwatch stopwatch = Stopwatch();
    Duration elapsed;

    //  print('test');
    // Timer timer = Timer.periodic(const Duration(seconds: 1), (timer) {});
    // print(timer.tick);
    // print('will this work');
    //   timer.cancel();

//THESE LINES
    final ValueNotifier<int> counter = ValueNotifier<int>(0);
    final ValueNotifier<int> counter2 = ValueNotifier<int>(0);

    // Timer.periodic(const Duration(seconds: 1), (timer) {
    //   counter.value++;
    // });
    //THESE LINES

    // Timer.periodic(const Duration(seconds: 2), (timer) {
    //   counter2.value++;
    // });

    final ButtonStyle btnStyle =
        ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));

    return Scaffold(
        backgroundColor: Colors.blueGrey[50],
        appBar: AppBar(
          title: const Text('Party Info'),
          backgroundColor: Colors.blueGrey[700],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            // Row(children: [
            //   CounterBody(counterValueNotifier: counter),
            //   CounterBody(counterValueNotifier: counter2),
            // ]),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 250,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                        child: TextFormField(
                          initialValue: 'Name',
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("This is just a page to test stuff"),
                ),
                Padding(
                    padding: const EdgeInsets.all(8),
                    child: Text('current minute: ' + formatNow)),
                Row(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(40, 10, 10, 10),
                      child: const Text(
                        'Quoted Wait Time: ',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    DropdownButton(
                      // Initial Value
                      value: dropdownvalue,
                      // Down Arrow Icon
                      icon: const Icon(Icons.keyboard_arrow_down),

                      // Array list of items
                      items: items.map((String items) {
                        return DropdownMenuItem(
                          value: items,
                          child: Text(items),
                        );
                      }).toList(),
                      // After selecting the desired option,it will
                      // change button value to selected value
                      onChanged: (String? newValue) {
                        setState(() {
                          dropdownvalue = newValue!;
                        });
                      },
                    ),
                  ],
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                      style: btnStyle,
                      onPressed: null,
                      child: const Text('Remove')),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                      style: btnStyle,
                      onPressed: null,
                      child: const Text('Seat')),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                      style: btnStyle,
                      onPressed: null,
                      child: const Text('Edit')),
                ),
              ],
            ),
            //   ElevatedButton(
            // style: btnStyle,
            // onPressed: () {
            //   // stopwatch.start();
            //   // print('stopwatch started');
            //   Timer.periodic(const Duration(seconds: 5), (timer) {
            //     print(timer.tick);
            //     //counter--;
            //   });
            // },
            // child: const Text('Start'))
            ElevatedButton(
                style: btnStyle,
                onPressed: () {
                  stopwatch.start();
                  print('stopwatch started');
                },
                child: const Text('Stop')),
            ElevatedButton(
                style: btnStyle,
                onPressed: () {
                  stopwatch.stop();
                  elapsed = stopwatch.elapsed;
                  print('stopwatch stopped');
                  print(elapsed.inSeconds);
                },
                child: const Text('Stop')),
            ElevatedButton(
                style: ElevatedButton.styleFrom(),
                onPressed: () {},
                child: Text('testing')),
            ElevatedButton(
              child: Text('Button'),
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple,
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                  textStyle:
                      TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
            ),
            //Text(elapsed.inSeconds().toString())
          ],
        ));
  }
}
