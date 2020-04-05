import 'package:flutter/material.dart';

class Thanks extends StatelessWidget {
  final Function resetHandler;
  @override
  Thanks(this.resetHandler);

  Widget build(BuildContext context) {
    return Center(
        child: Padding(
          padding: const EdgeInsets.only(top:88.0),
          child: Column(
            children: <Widget>[
              Text('Thanks For Reporting!',style: TextStyle(fontSize: 25, color: Colors.white,decoration: TextDecoration.underline,)),
              Padding(
                padding: const EdgeInsets.only(top:20.0),
                child: FlatButton(child: Text('Go back',style: TextStyle(fontSize: 20, color: Colors.white)), onPressed: ()=>resetHandler(0),),
              )
            ],
          ),
        )
    );
  }
}
