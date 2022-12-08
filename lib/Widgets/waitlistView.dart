import 'package:flutter/material.dart';

import '../main.dart';
import '../Objects/ObjectBox/model.dart';
import '../Widgets/partyCard.dart';

class WaitList extends StatefulWidget {
  const WaitList({Key? key}) : super(key: key);

  @override
  State<WaitList> createState() => WaitListState();
}

class WaitListState extends State<WaitList> {
  PartyCard Function(BuildContext, int) _itemBuilder(List<Party> parties) =>
      (BuildContext context, int index) => PartyCard(party: parties[index]);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Party>>(
        stream: objectbox.getParties(),
        builder: (context, snapshot) {
          if (snapshot.data?.isNotEmpty ?? false) {
            return ListView.builder(
                shrinkWrap: true,
                itemCount: snapshot.hasData ? snapshot.data!.length : 0,
                itemBuilder: _itemBuilder(snapshot.data ?? []));
          } else {
            return const Center(
                child: Text("Press the + icon to add a party to the waitlist"));
          }
        });
  }
}
