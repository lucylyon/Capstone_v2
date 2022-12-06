// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  MyButton({required this.onPressed, required this.btnText});

  final String btnText;
  final GestureTapCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: SizedBox(
          height: 50,
          width: 200,
          child: ElevatedButton(
            style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24)))),
            onPressed: onPressed,
            child: Text(
              btnText,
              style: TextStyle(fontSize: 20),
            ),
          ),
        ),
      ),
    );
  }
}
