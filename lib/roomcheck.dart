import 'package:flutter/material.dart';
import './option3.dart';
import 'sign_in.dart';
class RoomCheck extends StatelessWidget {
  final Function fn;
  final Function fn2;
  RoomCheck(this.fn,this.fn2);
  @override
  Widget build(BuildContext context) {

    return GridView.count(
      primary: false,
      padding: EdgeInsets.only(top:2),
      crossAxisSpacing: 0,
      mainAxisSpacing: 0,
      crossAxisCount: 3,
      children: [
        Option(()=>fn(4,'GT Safe',uId),'GT Safe'),
        Option(()=>fn(4,'GT Check',uId),'GT Check'),
        Option(()=>fn(4,'AK',uId),'AK'),
        Option(()=>fn(4,'BD',uId),'BD'),
        Option(()=>fn(4,'BG',uId),'BG'),
        Option(()=>fn(4,'CVR',uId),'CVR'),
        Option(()=>fn(4,'GN',uId),'GN'),
        Option(()=>fn(4,'KR',uId),'KR'),
        Option(()=>fn(4,'MAL-A',uId),'MAL-A'),
        Option(()=>fn(4,'MAL-B',uId),'MAL-B'),
        Option(()=>fn(4,'MAL-C',uId),'MAL-C'),
        Option(()=>fn(4,'MR',uId),'MR'),
        Option(()=>fn(4,'MSA',uId),'MSA'),
        Option(()=>fn(4,'RM',uId),'RM'),
        Option(()=>fn(4,'RP',uId),'RP'),
        Option(()=>fn(4,'SR',uId),'SR'),
        Option(()=>fn(4,'VK',uId),'VK'),


      ],
//        children: [
//          Option(()=>fn(4,'RM'),'RM'),
//          Option(()=>fn(4,'BD'),'BD'),
//          Option(()=>fn(4,'KR'),'KR'),
//          Option(()=>fn(4,'MAL-A'),'MAL-A'),
//          Option(()=>fn(4,'MAL-B'),'MAL-B'),
//          Option(()=>fn(4,'MAL-C'),'MAL-C'),
//          Option(()=>fn(4,'GN'),'GN'),
//          Option(()=>fn(4,'SR'),'SR'),
//          Option(()=>fn(4,'MR'),'MR'),
//          Option(()=>fn(4,'RP'),'RP'),
//          Option(()=>fn(4,'AK'),'AK'),
//
//          FlatButton(child: Text('Go back'), onPressed: ()=>fn2(0),),
//        ]
    );
  }
}
