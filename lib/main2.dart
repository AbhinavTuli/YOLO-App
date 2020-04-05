//import 'package:flutter/material.dart';
//import 'package:yolo/roomcheck.dart';
//import 'package:yolo/thanks.dart';
//import './home.dart';
//import './option.dart';
//import './gate.dart';
//import './dashboard.dart';
////import 'package:cloud_firestore/cloud_firestore.dart';
//
//void main() => runApp(MainApp());
//
//class MainApp extends StatefulWidget {
//  @override
//  _MainAppState createState() => _MainAppState();
//}
//
//class _MainAppState extends State<MainApp> {
//  int pg = 0;
//  int gate=0;
//  String user='TestUser';
//  var gtime;
//  void _switchPg(int a) {
//    setState(() {
//      pg = a;
//    });
//  }
//  void _switchGate(int a,int b){
//    setState(() {
//      pg=b;
//      gate=a;
//      gtime=DateTime.now();
//    });
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    if (pg == 0) {
//      return MaterialApp(
//        home: Scaffold(
//          appBar: AppBar(
//            title: Text('Welcome'),
//          ),
//          body: Home(_switchPg),
//        ),
//      );
//    } else if (pg == 1) {
//      return MaterialApp(
//        home: Scaffold(
//          appBar: AppBar(
//            title: Text('Where?'),
//          ),
//          body: RoomCheck(_switchPg),
//        ),
//      );
//    } else if (pg == 2) {
//      return MaterialApp(
//        home: Scaffold(
//          appBar: AppBar(
//            title: Text('Breathalyzer at gate?'),
//          ),
//          body: Gate(_switchPg,_switchGate),
//        ),
//      );
//    } else if (pg == 4) {
//      return MaterialApp(
//        home: Scaffold(
//          appBar: AppBar(
//            title: Text('Cool'),
//          ),
//          body: Thanks(_switchPg),
//        ),
//      );
//    }
//    else if (pg == 3 && gate==1) {
//      return MaterialApp(
//        home: Scaffold(
//            appBar: AppBar(
//              title: Text('Reported at '+gtime.toString()),
//            ),
//            body:FlatButton(child: Text('Go back'), onPressed: ()=>_switchPg(0),)
//        ),
//
//      );
//
//    }
//    else if (pg == 3 && gate==0) {
//      return MaterialApp(
//        home: Scaffold(
//            appBar: AppBar(
//              title: gtime!=null ?Text('Lite at '+gtime.toString()):Text('Lite'),
//            ),
//            body:FlatButton(child: Text('Go back'), onPressed: ()=>_switchPg(0),)
//        ),
//      );
//    }
//    else if(pg==5){
//      return MaterialApp(
//        home: Scaffold(
//          appBar: AppBar(
//            title: Text('Recent Updates '),
//          ),
//          body:dashboard(_switchPg),
//        ),
//      );
//    }
//  }
//}
