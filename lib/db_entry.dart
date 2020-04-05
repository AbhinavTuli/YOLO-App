import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'dart:convert';
import 'vote.dart';
import 'dvote.dart';
import 'sign_in.dart';

class DbEntry extends StatefulWidget {
  final Function selectHandler;
  final List docId;
  DbEntry(this.selectHandler, this.docId);
  @override
  _DbEntryState createState() => _DbEntryState();
}

class _DbEntryState extends State<DbEntry> {
  bool V = false;
  void _dVote(String eId, String uId, String voterId) async {
    DocumentReference docRef =
        Firestore.instance.collection('dboard').document(eId);
    await docRef.get().then((datasnapshot) async {
      List l = datasnapshot.data['Voters'];
      if (l.isNotEmpty && l.contains(voterId)) {
        return;
      } else {
        updateDvotes();
        await Firestore.instance.collection('dboard').document(eId).updateData({
          'Upvotes': FieldValue.increment(-1),
          'Voters': FieldValue.arrayUnion([voterId]),
        });
        await Firestore.instance
            .collection('users')
            .document(posterId)
            .updateData({'Karma': FieldValue.increment(-1)});
      }
    });
  }

  void _upVote(String eId, String posterId, String voterId) async {
    if(V){
      return;
    }
    DocumentReference docRef =
        Firestore.instance.collection('dboard').document(eId);
    await docRef.get().then((datasnapshot) async {
      List l = datasnapshot.data['Voters'];
      if (l.isNotEmpty && l.contains(voterId)) {
        return;
      } else {
        updateVotes();
        await Firestore.instance.collection('dboard').document(eId).updateData({
          'Upvotes': FieldValue.increment(1),
          'Voters': FieldValue.arrayUnion([voterId]),
        });
        await Firestore.instance
            .collection('users')
            .document(posterId)
            .updateData({'Karma': FieldValue.increment(1)});
      }
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

  void assignKarma(String postedById) async {
    await getKarma(postedById).then((onValue) {
      //print(onValue);
      try{
        setState(() {
          krma=onValue;
        });
      }
      catch (err){
        krma = onValue;
      }
    });
  }

  String name = 'Naggu';
  String time = '10 pm';
  String hostel = 'RAM';
  int upvotes = 0;
  int krma = 0;
  String posterId;
  void updateVotes() {
    setState(() {
      V = true;
      widget.docId[3] += 1;
      krma += 1;
    });
  }

  void updateDvotes() {
    setState(() {
      V = true;
      widget.docId[3] -= 1;
      krma -= 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    name = widget.docId[0];
    time = widget.docId[2].toString().substring(5, 16);
    hostel = widget.docId[1];
    upvotes = widget.docId[3];
    posterId = widget.docId[5];
    Color clr=Colors.white;
//    if(name=='CEO' ){
//      clr=Colors.red;
//    }
//    print('here '+posterId);
    assignKarma(posterId);
    return Padding(
      padding: const EdgeInsets.only(top: 4.0, bottom: 4, left: 8, right: 8),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(5.0),
        child: Container(
          color: Colors.blue,
          child: Padding(
            padding: const EdgeInsets.only(top: 8.0, bottom: 8, right: 4),
            child: Row(
//          mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                    flex: 50,
                    child: Align(
                      alignment: Alignment.center,
                      child: Container(
                        child: Text(
                          hostel,
                          style: TextStyle(fontSize: 25, color: Colors.black),
                        ),
                        decoration: new BoxDecoration(
                          borderRadius:
                              new BorderRadius.all(new Radius.circular(50.0)),
                          color: Colors.white,
                        ),
                      ),
                    )),
                Expanded(
                  flex: 80,
                  child: Column(
                    children: <Widget>[
                      Align(
                          alignment: Alignment.center,
                          child: Text(
                            name + ' (Karma: ' + krma.toString() + ')',
                            style: TextStyle(fontSize: 15, color: clr),
                          )),
                      Align(
                          alignment: Alignment.center,
                          child: Text(
                            time,
                            style: TextStyle(fontSize: 15, color: Colors.white),
                          )),
                    ],
                  ),
                ),
                Expanded(
                  flex: 20,
                  child: Column(children: [
                    (V)
                        ? Vote(
                            widget.docId[4], widget.docId[5], uId, null, null,V)
                        : Vote(widget.docId[4], widget.docId[5], uId, null,
                            _upVote,V),
                    Align(
                        alignment: Alignment.center,
                        child: Text(
                          upvotes.toString(),
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        )),
                    (V)
                        ? Dvote(
                            widget.docId[4], widget.docId[5], uId, null, null,V)
                        : Dvote(widget.docId[4], widget.docId[5], uId, null,
                            _dVote,V),
                  ]),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
