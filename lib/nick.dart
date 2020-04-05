import 'package:flutter/material.dart';
import 'package:yolo/omain.dart';
import 'sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class Nick extends StatelessWidget {
  final myController = TextEditingController();
  void dispose() {
    myController.dispose();
  }

  void _setNick(String nick) async {
    await Firestore.instance.collection('users').document(uId).updateData({
      'Nick': nick,
    });
//    setState(() {
//      pg = a;
//    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: Container(
          decoration: new BoxDecoration(
            image: new DecorationImage(
              image: new AssetImage("assets/rick.jpg"),
              fit: BoxFit.fill,
            ),
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
//              Image(image: AssetImage("assets/google_logo.png"), height: 150.0),
                  SizedBox(height: 50),
                  Text(
                    "Pick a nickname \n(Please don't use your real name!!)",
                    style: TextStyle(color: Colors.white, fontSize: 22),textAlign: TextAlign.center,
                  ),
                  Container(
                    decoration: new BoxDecoration(
                      color: Colors.white,
                    ),
                    child: TextFormField(
                      controller: myController,
                      decoration: InputDecoration(labelText: 'Nick',alignLabelWithHint: true),
                    ),
                  ),
                  _submitButton(context),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _submitButton(BuildContext context) {
    return FlatButton(
      splashColor: Colors.grey,
      onPressed: () {
        _setNick(myController.text);
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MainApp()),
        );

//        print(myController.text);
      },
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
//            Image(image: AssetImage("assets/google_logo.png"), height: 35.0),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                'Submit',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
