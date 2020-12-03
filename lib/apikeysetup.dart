import 'package:VultrDash/api/account.dart';
import 'package:VultrDash/api/api.dart';
import 'package:VultrDash/mainview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fluttertoast/fluttertoast.dart';

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
        body: Container(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: [
              TextField(
                controller: apikeyController,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                    labelText: 'API Key',
                    labelStyle: TextStyle(color: Colors.white)),
              ),
              SizedBox(height: 10),
              RaisedButton(
                child: Text(
                  'Setup',
                  style: TextStyle(color: Colors.white),
                ),
                color: Color.fromRGBO(0x1f, 0x20, 0x23, 1.0),
                onPressed: () {
                  Account account = new Account();
                  String orgCred = API.credential;
                  API.credential = apikeyController.text;
                  account.getInfo().then(
                      (value) => {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MainViewApp()))
                          }, onError: (e) {
                    API.credential = orgCred;
                    Fluttertoast.showToast(
                        msg: "Invalid API key", timeInSecForIosWeb: 1);
                  });
                },
              ),
            ],
          ),
        ));
  }
}
