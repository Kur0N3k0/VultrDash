import 'dart:async';

import 'package:VultrDash/api/api.dart';
import 'package:VultrDash/apikeysetup.dart';
import 'package:flutter/material.dart';
import 'package:VultrDash/mainview.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

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
  final storage = new FlutterSecureStorage();

  void _setMoveTimer(BuildContext context) async {
    String credential = await storage.read(key: "credential");
    API.credential = credential;
    Timer(Duration(seconds: 1, milliseconds: 5), () {
      if (credential == null) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => APIKeySetup()));
      } else {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => MainViewApp()));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    this._setMoveTimer(context);

    return MaterialApp(
        theme: ThemeData(fontFamily: "Raleway"),
        home: Scaffold(
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
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic,
                            color: Colors.white,
                          )),
                    )
                  ],
                ))));
  }
}
