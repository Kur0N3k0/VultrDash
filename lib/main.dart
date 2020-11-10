import 'dart:async';

import 'package:flutter/material.dart';
import 'package:VultrDash/mainview.dart';

void main() {
  runApp(MaterialApp(
    home: IntroViewApp(),
  ));
}

class IntroViewApp extends StatefulWidget {
  @override
  _IntroViewAppState createState() => _IntroViewAppState();
}

class _IntroViewAppState extends State<IntroViewApp> {
  void _setMoveTimer(BuildContext context) async {
    Timer(Duration(seconds: 2, milliseconds: 5), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => MainViewApp()));
    });
  }

  @override
  Widget build(BuildContext context) {
    this._setMoveTimer(context);

    return Scaffold(
        body: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color.fromRGBO(0x1e, 0x28, 0xa3, 1.0),
                    Color.fromRGBO(0x02, 0x20, 0x48, 1.0),
                  ]),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Text(
                    "VultrDash",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                        color: Colors.white,
                        fontSize: 30.0),
                  ),
                ),
                Center(
                  child: Text("VPS Dashboard",
                      style: TextStyle(
                        fontStyle: FontStyle.italic,
                        color: Colors.white,
                      )),
                )
              ],
            )));
  }
}
