import 'package:flutter/material.dart';
import 'sign_in.dart';
import 'omain.dart';
import 'nick.dart';
class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: new BoxDecoration(
          image: new DecorationImage(
            image: new AssetImage("assets/rick.jpg"),
            fit: BoxFit.fill,
          ),
        ),
        child: Center(
          child:Padding(
            padding: const EdgeInsets.only(top: 50),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
//              Image(image: AssetImage("assets/google_logo.png"), height: 150.0),
              Text('YOLO',style: TextStyle(fontSize: 130,color: Colors.white,fontStyle: FontStyle.italic),),
              SizedBox(height: 20),
              _signInButton(),
            ],
          ),
        ),
        ),
      ),
    );
  }

  Widget _signInButton() {
    return FlatButton(
      splashColor: Colors.grey,
        onPressed: () {
          signInWithGoogle().then((p) {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) {
                  return p==1?MainApp():Nick();
                },
              ),
            );
          });
        },
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image(image: AssetImage("assets/google_logo.png"), height: 35.0),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                'Sign in with Google',
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