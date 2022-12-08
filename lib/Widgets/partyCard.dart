// ignore_for_file: prefer_const_constructors

import 'dart:async';
import 'package:capstone_V2/Objects/CounterBody.dart';
import 'package:flutter/material.dart';
import '../Objects/ObjectBox/model.dart';
import 'PartyTappedButton.dart';

class PartyCard extends StatefulWidget {
  final Party party;

  const PartyCard({Key? key, required this.party}) : super(key: key);

  @override
  State<PartyCard> createState() => PartyCardState();
}

class PartyCardState extends State<PartyCard> {
  final ValueNotifier<Duration> counter =
      ValueNotifier<Duration>(Duration(seconds: 0));
  String title = '';

  @override
  Widget build(BuildContext context) {
    Timer.periodic(const Duration(seconds: 10), (timer) {
      counter.value = DateTime.now().difference(widget.party.timeAdded);
    });
    return Card(
      child: ListTile(
        onTap: () {
          partyTappedDialog(widget.party);
        },
        leading: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              widget.party.size,
              style: TextStyle(fontWeight: FontWeight.w500),
            )
          ],
        ),
        title: Text(widget.party.name),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CounterBody(counterValueNotifier: counter),
            Text(' of ${widget.party.timeQuoted}m')
          ],
        ),
      ),
    );
  }

  void partyTappedDialog(Party party) => showDialog(
      context: context,
      builder: (context) => AlertDialog(
            title: Text(party.name),
            content: FractionallySizedBox(
              widthFactor: 0.8,
              heightFactor: 0.43,
              child: Column(
                children: [
                  MyButton(
                    btnText: 'Seat',
                    onPressed: (() => Navigator.pop(context)),
                  ),
                  MyButton(
                    btnText: 'Preassign',
                    onPressed: (() => Navigator.pop(context)),
                  ),
                  MyButton(
                    btnText: 'Remove',
                    onPressed: (() => Navigator.pop(context)),
                  ),
                  MyButton(
                    btnText: 'Edit',
                    onPressed: (() => Navigator.pop(context)),
                  ),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                  onPressed: (() => Navigator.pop(context)),
                  child: Text('Cancel')),
            ],
          ));
}
