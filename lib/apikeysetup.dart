import 'package:VultrDash/api/account.dart';
import 'package:VultrDash/api/api.dart';
import 'package:VultrDash/mainview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:localstorage/localstorage.dart';

class APIKeySetup extends StatefulWidget {
  @override
  _APIKeySetupState createState() => _APIKeySetupState();
}

class _APIKeySetupState extends State<APIKeySetup> {
  final apikeyController = TextEditingController();
  final storage = new FlutterSecureStorage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Setup API key",
              style: TextStyle(fontStyle: FontStyle.italic)),
          backgroundColor: Color.fromRGBO(0x1f, 0x20, 0x23, 1.0),
        ),
        backgroundColor: Color.fromRGBO(0x31, 0x32, 0x35, 1.0),
        body: Column(
          children: [
            TextField(
              controller: apikeyController,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                  labelText: 'API Key',
                  labelStyle: TextStyle(color: Colors.white)),
            ),
            RaisedButton(
              child: Text(
                'Setup',
                style: TextStyle(color: Colors.white),
              ),
              color: Color.fromRGBO(0x1f, 0x20, 0x23, 1.0),
              onPressed: () {
                LocalStorage("config")
                    .setItem("credential", apikeyController.text);

                Account account = new Account();
                account.getInfo().then(
                    (value) => {
                          API.credential = apikeyController.text,
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MainViewApp()))
                        }, onError: (e) {
                  Fluttertoast.showToast(
                      msg: "Invalid API key", timeInSecForIosWeb: 1);
                });
              },
            ),
          ],
        ));
  }
}
