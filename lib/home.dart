import 'package:flutter/material.dart';
import './option.dart';
import 'sign_in.dart';

class Home extends StatelessWidget {
  final Function fn;

  @override
  Home(this.fn);
  Widget build(BuildContext context) {
    void _showDialog() {
      // flutter defined function
      showDialog(
        context: context,
        builder: (BuildContext context) {
          // return object of type Dialog
          return AlertDialog(
            title: new Text("420",textAlign: TextAlign.center,),
            content: new Text("Welcome to YOLO\n\nWe've created this to help out BITSians so please don't post false updates, although we do have a karma system to filter out such users. \n\nThis is just a barebones version to see if people are actually interested in this concept. \n\nWe have a bunch of updates planned including a much nicer dashboard, push notifications for selected hostels, ability to comment on posts amongst other stuff. \n\nAll of this depends on the reception, so please do share this with friends if you like it."),
            actions: <Widget>[
              // usually buttons at the bottom of the dialog
              new FlatButton(
                child: new Text("Close"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
    return Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Column(children: [
          Option(() => fn(5), 'Dashboard'),
//          Option(() => fn(3), 'Gate Status'),
          Option(() => fn(1), 'Report Checking'),
          SizedBox(height: 40,),
          Option(_showDialog, 'Info'),
//          Option(() => fn(2), 'Report Gate Checking'),
        ]));
  }
}
