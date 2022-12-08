// ignore_for_file: prefer_const_constructors

import 'dart:async';

import 'package:capstone_V2/Objects/CounterBody.dart';
import 'package:flutter/material.dart';
import '../Objects/ObjectBox/model.dart';

class PartyCard extends StatefulWidget {
  final Party party;

  const PartyCard({Key? key, required this.party}) : super(key: key);

  @override
  State<PartyCard> createState() => PartyCardState();
}

class PartyCardState extends State<PartyCard> {
  final ValueNotifier<Duration> counter =
      ValueNotifier<Duration>(Duration(seconds: 0));

  @override
  Widget build(BuildContext context) {
    Timer.periodic(const Duration(seconds: 10), (timer) {
      counter.value = DateTime.now().difference(widget.party.timeAdded);
    });
    return Card(
      child: ListTile(
        onTap: () {},
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
}
