import 'package:VultrDash/api/model/instance.dart';
import 'package:VultrDash/navdrawer.dart';
import 'package:flutter/material.dart';

class InstanceDetailMenu extends StatefulWidget {
  final InstanceModel instance;

  InstanceDetailMenu({Key key, @required this.instance}) : super(key: key);

  @override
  _InstanceDetailMenuState createState() => _InstanceDetailMenuState();
}

class _InstanceDetailMenuState extends State<InstanceDetailMenu> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(fontFamily: "Raleway"),
        home: Scaffold(
            drawer: NavDrawer(),
            appBar: AppBar(
              title: Text("Instance",
                  style: TextStyle(
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold)),
              backgroundColor: Color.fromRGBO(0x1f, 0x20, 0x23, 1.0),
            ),
            bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              backgroundColor: Color.fromRGBO(0x1f, 0x20, 0x23, 1.0),
              selectedItemColor: Colors.white,
              unselectedItemColor: Colors.white.withOpacity(.60),
              selectedFontSize: 14,
              unselectedFontSize: 14,
              onTap: (value) {
                // Respond to item press.
              },
              items: [
                BottomNavigationBarItem(
                  label: 'Overview',
                  icon: Icon(Icons.info),
                ),
                BottomNavigationBarItem(
                  label: 'Snapshots',
                  icon: Icon(Icons.history),
                ),
                BottomNavigationBarItem(
                  label: 'Backups',
                  icon: Icon(Icons.library_books),
                ),
                BottomNavigationBarItem(
                  label: 'Settings',
                  icon: Icon(Icons.settings),
                ),
              ],
            ),
            body: Container(
                // constraints: BoxConstraints.expand(
                //   height: 100.0,
                // ),
                padding: EdgeInsets.only(left: 0.0, bottom: 8.0, right: 16.0),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      width: 2,
                      color: Color.fromRGBO(0xff, 0xff, 0xff, 0x02),
                    ),
                  ),
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color.fromRGBO(0x31, 0x32, 0x35, 1.0),
                        Color.fromRGBO(0x28, 0x29, 0x2d, 1.0),
                      ]),
                ),
                child: Container(
                    child: Column(
                  children: [
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                              padding:
                                  EdgeInsets.fromLTRB(16.0, 16.0, 0.0, 0.0),
                              child: Text(
                                "KuroNeko",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 30.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              )),
                          Padding(
                              padding: EdgeInsets.fromLTRB(16.0, 0.0, 0.0, 0.0),
                              child: Text(
                                widget.instance.os,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              )),
                        ]),
                    Center(
                      child: Text(
                        'Hello Gradient!',
                        style: TextStyle(
                            fontSize: 48.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                  ],
                )))));
  }
}
