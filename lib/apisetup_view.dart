import 'dart:async';

import 'package:flutter/material.dart';
import 'package:VultrDash/mainview.dart';

class ApiSetupView extends StatefulWidget {
  @override
  _ApiSetupViewState createState() => _ApiSetupViewState();
}

class _ApiSetupViewState extends State<ApiSetupView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("VultrDash - Setup",
              style: TextStyle(fontStyle: FontStyle.italic)),
          backgroundColor: Color.fromRGBO(0x1f, 0x20, 0x23, 1.0),
        ),
        backgroundColor: Color.fromRGBO(0x31, 0x32, 0x35, 1.0),
        body: Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(10.0),
            child: Column(children: [
              TextField(
                decoration: InputDecoration(
                    labelText: "API Key: ",
                    prefixIcon: Container(
                        child: Icon(Icons.lock,
                            color: Color.fromRGBO(0xff, 0xff, 0xff, 0.4)),
                        width: 15,
                        height: 15,
                        padding: EdgeInsets.all(10)),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(5.0),
                      ),
                    ),
                    filled: true,
                    contentPadding: EdgeInsets.all(10),
                    hintStyle: TextStyle(color: Colors.grey[800]),
                    hintText: "KvX01efF2HJkMo=",
                    fillColor: Color.fromRGBO(0x31, 0x32, 0x35, 1.0)),
              ),
            ])));
  }
}
