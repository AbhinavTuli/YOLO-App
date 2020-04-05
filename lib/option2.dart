import 'package:flutter/material.dart';

class Option extends StatelessWidget {
  final Function selectHandler;
  final String ansText;
  Option(this.selectHandler, this.ansText);
  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.center,
    child:Padding(
      padding: const EdgeInsets.all(0.0),
      child: Container(
        width: 220,
        height: 500,
        child: RaisedButton(
          shape: RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(5.0),
              side: BorderSide(color: Colors.black)
          ),
          color: Colors.blueGrey,
          textColor: Colors.black,
          child: Text(ansText,style: TextStyle(fontSize: 18,color: Colors.white),),
          onPressed: selectHandler,
        ),
      ),
    ),
    );
  }
}
