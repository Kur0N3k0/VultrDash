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
              selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
              unselectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(children: [
                      Expanded(
                          flex: 1,
                          child: Container(
                            child: Column(
                              children: [
                                Padding(
                                    padding: EdgeInsets.fromLTRB(
                                        16.0, 16.0, 0.0, 0.0),
                                    child: Text(
                                      widget.instance.label,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 30.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    )),
                                Padding(
                                    padding: EdgeInsets.fromLTRB(
                                        16.0, 0.0, 0.0, 0.0),
                                    child: Text(
                                      widget.instance.os,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    )),
                              ],
                            ),
                          )),
                      Expanded(
                          flex: 2,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Ink(
                                decoration: ShapeDecoration(
                                  color: Colors.lightBlue,
                                  shape: CircleBorder(),
                                ),
                                child: IconButton(
                                    tooltip: "test",
                                    icon: Icon(
                                      Icons.power_settings_new,
                                      color:
                                          Color.fromRGBO(0x8a, 0x90, 0x99, 1.0),
                                      size: 30,
                                    ),
                                    onPressed: () {
                                      print("zzzz");
                                    }),
                              ),
                              IconButton(
                                  icon: Icon(
                                    Icons.autorenew,
                                    color:
                                        Color.fromRGBO(0x8a, 0x90, 0x99, 1.0),
                                    size: 30,
                                  ),
                                  onPressed: null),
                              IconButton(
                                  icon: Icon(
                                    Icons.disc_full,
                                    color:
                                        Color.fromRGBO(0x8a, 0x90, 0x99, 1.0),
                                    size: 30,
                                  ),
                                  onPressed: null),
                              IconButton(
                                  icon: Icon(
                                    Icons.delete,
                                    color:
                                        Color.fromRGBO(0x8a, 0x90, 0x99, 1.0),
                                    size: 30,
                                  ),
                                  onPressed: null),
                            ],
                          ))
                    ]),
                    Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 10.0),
                        child: Container(
                          height: 1.0,
                          color: Colors.white,
                        )),
                    Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                        child: Row(
                          children: [
                            Expanded(
                                flex: 1,
                                child: Container(
                                    height: 40,
                                    child: Align(
                                      alignment: Alignment.centerRight,
                                      child: Text(
                                        "Location :  ",
                                        style: TextStyle(
                                            color: Color.fromRGBO(
                                                0x8a, 0x90, 0x99, 1.0),
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15.0),
                                      ),
                                    ))),
                            Expanded(
                                flex: 2,
                                child: Container(
                                    height: 40,
                                    child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Row(children: [
                                          Image.asset(
                                              "./assets/img/flagsm_jp.webp"),
                                          Padding(
                                            padding:
                                                EdgeInsets.fromLTRB(5, 0, 0, 0),
                                            child: Text(
                                              "Tokyo",
                                              style: TextStyle(
                                                  color: Color.fromRGBO(
                                                      0x8a, 0x90, 0x99, 1.0),
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 15.0),
                                            ),
                                          )
                                        ])))),
                          ],
                        )),
                    Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                        child: Row(
                          children: [
                            Expanded(
                                flex: 1,
                                child: Container(
                                    height: 40,
                                    child: Align(
                                      alignment: Alignment.centerRight,
                                      child: Text(
                                        "IP Address :  ",
                                        style: TextStyle(
                                            color: Color.fromRGBO(
                                                0x8a, 0x90, 0x99, 1.0),
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15.0),
                                      ),
                                    ))),
                            Expanded(
                                flex: 2,
                                child: Container(
                                    height: 40,
                                    child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(widget.instance.mainIp,
                                            style: TextStyle(
                                                color: Color.fromRGBO(
                                                    0x8a, 0x90, 0x99, 1.0),
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15.0))))),
                          ],
                        )),
                    Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                        child: Row(
                          children: [
                            Expanded(
                                flex: 1,
                                child: Container(
                                    height: 40,
                                    child: Align(
                                      alignment: Alignment.centerRight,
                                      child: Text(
                                        "vCPU :  ",
                                        style: TextStyle(
                                            color: Color.fromRGBO(
                                                0x8a, 0x90, 0x99, 1.0),
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15.0),
                                      ),
                                    ))),
                            Expanded(
                                flex: 2,
                                child: Container(
                                    height: 40,
                                    child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                            widget.instance.vcpuCount
                                                .toString(),
                                            style: TextStyle(
                                                color: Color.fromRGBO(
                                                    0x8a, 0x90, 0x99, 1.0),
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15.0))))),
                          ],
                        )),
                    Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                        child: Row(
                          children: [
                            Expanded(
                                flex: 1,
                                child: Container(
                                    height: 40,
                                    child: Align(
                                      alignment: Alignment.centerRight,
                                      child: Text(
                                        "RAM :  ",
                                        style: TextStyle(
                                            color: Color.fromRGBO(
                                                0x8a, 0x90, 0x99, 1.0),
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15.0),
                                      ),
                                    ))),
                            Expanded(
                                flex: 2,
                                child: Container(
                                    height: 40,
                                    child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                            widget.instance.ram.toString() +
                                                " MB",
                                            style: TextStyle(
                                                color: Color.fromRGBO(
                                                    0x8a, 0x90, 0x99, 1.0),
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15.0))))),
                          ],
                        )),
                    Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                        child: Row(
                          children: [
                            Expanded(
                                flex: 1,
                                child: Container(
                                    height: 40,
                                    child: Align(
                                      alignment: Alignment.centerRight,
                                      child: Text(
                                        "Storage :  ",
                                        style: TextStyle(
                                            color: Color.fromRGBO(
                                                0x8a, 0x90, 0x99, 1.0),
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15.0),
                                      ),
                                    ))),
                            Expanded(
                                flex: 2,
                                child: Container(
                                    height: 40,
                                    child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                            widget.instance.disk.toString() +
                                                " GB",
                                            style: TextStyle(
                                                color: Color.fromRGBO(
                                                    0x8a, 0x90, 0x99, 1.0),
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15.0))))),
                          ],
                        )),
                    Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                        child: Row(
                          children: [
                            Expanded(
                                flex: 1,
                                child: Container(
                                    height: 40,
                                    child: Align(
                                      alignment: Alignment.centerRight,
                                      child: Text(
                                        "Label :  ",
                                        style: TextStyle(
                                            color: Color.fromRGBO(
                                                0x8a, 0x90, 0x99, 1.0),
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15.0),
                                      ),
                                    ))),
                            Expanded(
                                flex: 2,
                                child: Container(
                                    height: 40,
                                    child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(widget.instance.label,
                                            style: TextStyle(
                                                color: Color.fromRGBO(
                                                    0x8a, 0x90, 0x99, 1.0),
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15.0))))),
                          ],
                        )),
                    Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                        child: Row(
                          children: [
                            Expanded(
                                flex: 1,
                                child: Container(
                                    height: 40,
                                    child: Align(
                                      alignment: Alignment.centerRight,
                                      child: Text(
                                        "Tag :  ",
                                        style: TextStyle(
                                            color: Color.fromRGBO(
                                                0x8a, 0x90, 0x99, 1.0),
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15.0),
                                      ),
                                    ))),
                            Expanded(
                                flex: 2,
                                child: Container(
                                    height: 40,
                                    child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(widget.instance.tag,
                                            style: TextStyle(
                                                color: Color.fromRGBO(
                                                    0x8a, 0x90, 0x99, 1.0),
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15.0))))),
                          ],
                        )),
                    Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                        child: Row(
                          children: [
                            Expanded(
                                flex: 1,
                                child: Container(
                                    height: 40,
                                    child: Align(
                                      alignment: Alignment.centerRight,
                                      child: Text(
                                        "OS :  ",
                                        style: TextStyle(
                                            color: Color.fromRGBO(
                                                0x8a, 0x90, 0x99, 1.0),
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15.0),
                                      ),
                                    ))),
                            Expanded(
                                flex: 2,
                                child: Container(
                                    height: 40,
                                    child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(widget.instance.os,
                                            style: TextStyle(
                                                color: Color.fromRGBO(
                                                    0x8a, 0x90, 0x99, 1.0),
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15.0))))),
                          ],
                        ))
                  ],
                )))));
  }
}
