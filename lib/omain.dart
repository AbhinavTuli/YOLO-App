import 'package:flutter/material.dart';
import 'package:yolo/roomcheck.dart';
import 'package:yolo/thanks.dart';
import './home.dart';
import './gate.dart';
import './dashboard.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'sign_in.dart';
import 'dart:io';

final databaseReference = Firestore.instance;

void main() => runApp(MainApp());

class MainApp extends StatefulWidget {
  @override
  _MainAppState createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  int pg = 0;
  int gate = 0;
  String user = name;
  String nic;
  int mkarma;
  var gtime;
  var entries = new List();
  void _switchPg(int a) {
    setState(() {
      pg = a;
      if (a == 5) {
        _getData();
      }
    });
  }

  void _switchGate(int a, int b) {
    setState(() {
      pg = b;
      gate = a;
      gtime = DateTime.now().toString();
    });
  }

  void _saveRoom(int a, String b, String id) async {
    String nic;
    DocumentReference documentReference =
        Firestore.instance.collection("users").document(id);
    Future<String> ab = documentReference.get().then((datasnapshot) {
      return datasnapshot.data['Nick'];
    });
    await ab.then((onValue) => nic = onValue);
    await databaseReference.collection('dboard').document().setData({
      'Hostel': b,
      'Time': DateTime.now().toString(),
      'Nick': nic,
      'Upvotes': 0,
      'Uid': id,
      'Voters': [id],
    });
    setState(() {
      pg = a;
    });
  }

  void _saveGate(int a, int b) async {
    await databaseReference.collection('dboard').document().setData({
      'Gate Checking Status': a == 1 ? true : false,
      'Time': DateTime.now().toString(),
      'Name': user,
      'Upvotes': 0,
    });
    setState(() {
      pg = b;
      gate = a;
      gtime = DateTime.now().toString();
    });
  }

  void _getData() async {
    var en = new List();

    await databaseReference
        .collection('dboard')
        .getDocuments()
        .then((QuerySnapshot snapshot) {
      snapshot.documents.forEach((f) {
        var en2 = new List();
        en2.add(f.data['Nick']);
        en2.add(f.data['Hostel']);
        en2.add(f.data['Time']);
        en2.add(f.data['Upvotes']);
        en2.add(f.documentID);
        en2.add(f.data['Uid']);
        en.add(en2);
      });
//      snapshot.documents.forEach((f) => en.add(f.documentID));
    });
//    for (int i = 0; i < en.length; i++) {
//      DocumentReference documentReference =
//      Firestore.instance.collection("dboard").document(en[i]);
//      documentReference.get().then((datasnapshot) {
//        en2.add(datasnapshot.data['Time']);
//      });
//    }
    setState(() {
      entries = en;
    });
  }


  Future<int> getKarma(String postedById) async {
    DocumentReference documentReference =
    Firestore.instance.collection("users").document(postedById);
    Future<int> a;
    a = documentReference.get().then((datasnapshot) {
//        print(datasnapshot.data['Karma']);
//        print(postedById);
      return datasnapshot.data['Karma'];
    });
    return a;
  }

  void assignKarma(String Id) async {
    await getKarma(Id).then((onValue) {
      //print(onValue);
      mkarma = onValue;
    });
  }

  Future<String> getNic(String Id) async {
    DocumentReference documentReference =
    Firestore.instance.collection("users").document(Id);
    Future<String> a;
    a = documentReference.get().then((datasnapshot) {
//        print(datasnapshot.data['Karma']);
//        print(postedById);
      return datasnapshot.data['Nick'];
    });
    return a;
  }

  void assignNic(String Id) async {
    await getNic(Id).then((onValue) {
      try{
        setState(() {
          nic = onValue;
        });
      }
      catch(err){
        nic = onValue;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
//    print(uId);

//          if(nic==null || mkarma==null){
//        print("Slumber");
//        sleep(const Duration(seconds:2));
//      }



    if (pg == 0) {
      assignNic(uId);
      assignKarma(uId);
      try {
        return WillPopScope(
          onWillPop: () async => false,
          child: MaterialApp(
            home: Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                backgroundColor: Colors.black87,
                title: Text(nic + '           Karma:' + mkarma.toString()),
              ),
              body: Container(
                decoration: new BoxDecoration(
                  image: new DecorationImage(
                    image: new AssetImage("assets/rick.jpg"),
                    fit: BoxFit.fill,
                  ),
                ),
                child: Home(_switchPg),
              ),
            ),
          ),
        );
      }
      catch(err){
        nic='Loading....';
        mkarma=-1;
        return WillPopScope(
          onWillPop: () async => false,
          child: MaterialApp(
            home: Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                backgroundColor: Colors.black87,
                title: Text(nic + '           Karma:' + mkarma.toString()),
              ),
              body: Container(
                decoration: new BoxDecoration(
                  image: new DecorationImage(
                    image: new AssetImage("assets/rick.jpg"),
                    fit: BoxFit.fill,
                  ),
                ),
                child: Home(_switchPg),
              ),
            ),
          ),
        );
      }
    } else if (pg == 1) {
      return WillPopScope(
        onWillPop: () async {
          _switchPg(0);
          return false;
        },
        child: MaterialApp(
          home: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.blue,
              title: Text('Where?'),
            ),
            body: RoomCheck(_saveRoom, _switchPg),
          ),
        ),
      );
    } else if (pg == 2) {
      return WillPopScope(
        onWillPop: () async => false,
        child: MaterialApp(
          home: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.blue,
              title: Text('Breathalyzer At Gate?'),
            ),
            body: Container(
                decoration: new BoxDecoration(
                  image: new DecorationImage(
                    image: new AssetImage("assets/rick.jpg"),
                    fit: BoxFit.fill,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 80),
                  child: Gate(_switchPg, _saveGate),
                )),
          ),
        ),
      );
    } else if (pg == 4) {
      return WillPopScope(
        onWillPop: () async => false,
        child: MaterialApp(
          home: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.black87,
              title: Text(user),
            ),
            body: Container(
                decoration: new BoxDecoration(
                  image: new DecorationImage(
                    image: new AssetImage("assets/rick.jpg"),
                    fit: BoxFit.fill,
                  ),
                ),
                child: Thanks(_switchPg)),
          ),
        ),
      );
    } else if (pg == 3 && gate == 1) {
      return WillPopScope(
        onWillPop: () async => false,
        child: MaterialApp(
          home: Scaffold(
              appBar: AppBar(
                title: Text('Reported at ' + gtime.toString()),
              ),
              body: FlatButton(
                child: Text('Go back'),
                onPressed: () => _switchPg(0),
              )),
        ),
      );
    } else if (pg == 3 && gate == 0) {
      return WillPopScope(
        onWillPop: () async => false,
        child: MaterialApp(
          home: Scaffold(
              appBar: AppBar(
                title: gtime != null
                    ? Text('Lite at ' + gtime.toString())
                    : Text('Lite'),
              ),
              body: FlatButton(
                child: Text('Go back'),
                onPressed: () => _switchPg(0),
              )),
        ),
      );
    } else if (pg == 5) {
      return WillPopScope(
        onWillPop: () async {
          _switchPg(0);
          return false;
        },
        child: MaterialApp(
          home: Scaffold(
            floatingActionButton: FloatingActionButton(
              child: Container(
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: new AssetImage("assets/plus.png"),
                        fit: BoxFit.scaleDown)),
              ),
              onPressed: () {
                _switchPg(1);
              },
              //child: Icon(Icons.navigation),
              backgroundColor: Colors.blue,
            ),
            backgroundColor: Colors.white,
            appBar: AppBar(
              title: Row(children: [
//                Padding(
//                  padding: const EdgeInsets.only(right:8.0),
//                  child: SizedBox(
//                  child:InkWell(
//                    child: Container(
//                      height: 25,
//                      width: 25,
//                      decoration: BoxDecoration(
//                        image: DecorationImage(
//                          image: new AssetImage("assets/plus.png"),
//                          fit: BoxFit.cover,
//                        )
//                      ),
//                    ),
//                  )
//                  ),
//                ),
                Text(nic + '           Karma:' + mkarma.toString()),
//                Padding(
//                  padding: const EdgeInsets.only(left: 4,right:4),
//                  child: Container(
//                    height: 45,
//                    width: 45,
//                    child: FloatingActionButton(
//                      backgroundColor: Colors.white,
//                      elevation: 0,
//                      onPressed: () => {},
//                    ),
//                  ),
//                ),
//                Padding(
//                  padding: const EdgeInsets.only(left: 4,right:4),
//                  child: Container(
//                    height: 45,
//                    width: 45,
//                    child: FloatingActionButton(
//                      backgroundColor: Colors.white,
//                      elevation: 0,
//                      onPressed: () => {},
//                    ),
//                  ),
//                )
              ]),
              backgroundColor: Colors.blue,
            ),
            body: Dashboard(_switchPg, entries),
          ),
        ),
      );
    }
  }
}
