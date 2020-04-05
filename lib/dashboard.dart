import 'package:flutter/material.dart';
import 'package:yolo/db_entry.dart';
import './option.dart';
import 'db_entry.dart';
import 'vote.dart';
class Dashboard extends StatelessWidget {
  final Function fn;
  final List entries;

  @override
  Dashboard(this.fn, this.entries);
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          flex: 90,
          child: ListView(
//      shrinkWrap: true,
            children: <Widget>[
//        Row(
//
////          mainAxisAlignment: MainAxisAlignment.center,
//          children: [
//            Expanded(
//                flex: 20,
//                child: Align(
//                  alignment: Alignment.center,
//                  child: Text('Hostel',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white),
//                  ),
//                )),
//            Expanded(
//                flex: 30,
//                child: Align(
//                    alignment: Alignment.center,
//                    child: Text('Time',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white),))),
//            Expanded(
//                flex: 35,
//                child: Align(
//                    alignment: Alignment.center,
//                    child: Text('Name',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white),))),
//            Expanded(
//                flex: 26,
//                child: Align(
//                  alignment: Alignment.center,
//                    child: Text('Upvotes'.toString(),style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white),))),
//          ],
//        ),
              Column(
//          shrinkWrap: true,
//          reverse: true,
                  verticalDirection: VerticalDirection.up,
                    children:
                        entries.map<Widget>((word) => DbEntry(() => 0, word)).toList(),

//        FlatButton(
//          child: Text('Go back'),
//          onPressed: () => fn(0),
//        )
              ),
            ],
          ),
        ),
      ],
    );
  }
}
