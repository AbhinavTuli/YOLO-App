import 'package:flutter/material.dart';
//import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Vote extends StatefulWidget {
//  final Function selectHandler;
  final id;
  final id2;
  final voterId;
  final Function fn;
  final Function f2;
  final V;
  Vote(this.id, this.id2, this.voterId, this.fn, this.f2,this.V);

  @override
  _VoteState createState() => _VoteState();
}

class _VoteState extends State<Vote> {
  bool on=true;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 25,
      width: 25,
      child: InkWell(
          child: Container(
              width: 120,
              height: 40,
              decoration: BoxDecoration(
//                  color: Colors.black,

                image: DecorationImage(
                  image: new AssetImage("assets/up2.png"),
                  fit: BoxFit.cover,
                ),
//                child: Text("clickMe") // button text
              )),
          onTap: () async{
            if(on) {
              on=false;
              if (widget.fn != null) {
                widget.fn();
              }
              if (widget.f2 != null) {
                widget.f2(widget.id, widget.id2, widget.voterId);
              }
              print("press up");
            }
          }),
    );
  }
}
