import 'package:flutter/material.dart';

class CounterBody extends StatelessWidget {
  const CounterBody({super.key, required this.counterValueNotifier});

  final ValueNotifier<Duration> counterValueNotifier;

//https://api.flutter.dev/flutter/foundation/ChangeNotifier-class.html

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: counterValueNotifier,
      builder: (BuildContext context, Widget? child) {
        return Text('${counterValueNotifier.value.inMinutes}');
      },
    );
  }
}
