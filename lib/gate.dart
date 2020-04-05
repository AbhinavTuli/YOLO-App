import 'package:flutter/material.dart';
import './option.dart';

class Gate extends StatelessWidget {
  final Function fn;
  final Function saveGate;
  Gate(this.fn, this.saveGate);
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Option(() => saveGate(1, 4), 'Yes'),
      Option(() => saveGate(0, 4), 'No'),
      FlatButton(
        child: Text('Go back',style: TextStyle(fontSize: 18,color: Colors.white),),
        onPressed: () => fn(0),
      )
    ]);
  }
}
