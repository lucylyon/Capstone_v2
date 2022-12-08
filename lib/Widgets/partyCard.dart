// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

import '../Objects/ObjectBox/model.dart';

/// Styling for an event card. Includes the name, location and date.
/// Clicking a card navigates to a list of tasks related to event.

class PartyCard extends StatefulWidget {
  // final Event event;
  final Party party;

  //const EventCard({Key? key, required this.event}) : super(key: key);
  const PartyCard({Key? key, required this.party}) : super(key: key);

  @override
  State<PartyCard> createState() => PartyCardState();
}

class PartyCardState extends State<PartyCard> {
  @override
  Widget build(BuildContext context) {
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
            Text('counterBody'),
            Text(' of ${widget.party.timeQuoted}m')
          ],
        ),
      ),
    );
    // return Container(
    //   margin: const EdgeInsets.all(5),
    //   child: Column(
    //     children: <Widget>[
    //       Container(
    //         decoration: BoxDecoration(
    //           color: const Color.fromARGB(255, 243, 243, 243),
    //           borderRadius: BorderRadius.circular(10),
    //           boxShadow: const [
    //             BoxShadow(
    //               color: Color.fromARGB(255, 168, 168, 168),
    //               blurRadius: 5,
    //               offset: Offset(1, 2),
    //             )
    //           ],
    //         ),
    //         child: Row(
    //           children: <Widget>[
    //             Expanded(
    //               child: Column(
    //                 children: [
    //                   Container(
    //                     alignment: Alignment.centerLeft,
    //                     padding: const EdgeInsets.all(5),
    //                     child: Text(
    //                       widget.party.name,
    //                       //'name',
    //                       // widget.event.name,
    //                       style: const TextStyle(
    //                           fontSize: 25.0,
    //                           height: 1.0,
    //                           overflow: TextOverflow.fade),
    //                     ),
    //                   ),
    //                   Container(
    //                     alignment: Alignment.centerLeft,
    //                     padding: const EdgeInsets.all(10.0),
    //                     child: Row(
    //                       children: [
    //                         Text('location'),
    //                         // Text("Location: ${widget.event.location}",
    //                         //     style: const TextStyle(
    //                         //         fontSize: 15.0,
    //                         //         height: 1.0,
    //                         //         overflow: TextOverflow.fade)),
    //                         const Spacer(),
    //                         Text('date')
    //                         // Text(
    //                         //     "Date: ${DateFormat.yMd().format(widget.event.date!)}",
    //                         //     style: const TextStyle(
    //                         //         fontSize: 15.0,
    //                         //         height: 1.0,
    //                         //         overflow: TextOverflow.fade))
    //                       ],
    //                     ),
    //                   ),
    //                 ],
    //               ),
    //             ),
    //           ],
    //         ),
    //       ),
    //     ],
    //   ),
    // );
  }
}
