import 'package:flutter/material.dart';

class Option extends StatefulWidget {
  final Function selectHandler;
  final String ansText;
  Option(this.selectHandler, this.ansText);
  bool on=true;
  @override
  _OptionState createState() => _OptionState();
}

class _OptionState extends State<Option> {
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
            color: Colors.blue,
            textColor: Colors.white,
            child: Text(widget.ansText,style: TextStyle(fontSize: 28.5,color: Colors.white),),
            onPressed: (){
              if(widget.on) {
                widget.on = false;
                widget.selectHandler();
              }
              },
          ),
        ),
      ),
    );
  }
}
