import 'package:VultrDash/api/model/instance.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class InstanceOverviewMenu extends StatelessWidget {
  final InstanceModel instance;

  InstanceOverviewMenu({Key key, @required this.instance}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
        child: SingleChildScrollView(
            child: ConstrainedBox(
                constraints: BoxConstraints(
                    minHeight: MediaQuery.of(context).size.height),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
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
                                      instance.label,
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
                                      instance.os,
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
                                                  color: Colors.white,
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
                                        child: Text(instance.mainIp,
                                            style: TextStyle(
                                                color: Colors.white,
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
                                            instance.vcpuCount.toString(),
                                            style: TextStyle(
                                                color: Colors.white,
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
                                            instance.ram.toString() + " MB",
                                            style: TextStyle(
                                                color: Colors.white,
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
                                            instance.disk.toString() + " GB",
                                            style: TextStyle(
                                                color: Colors.white,
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
                                        child: Text(instance.label,
                                            style: TextStyle(
                                                color: Colors.white,
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
                                        child: Text(instance.tag,
                                            style: TextStyle(
                                                color: Colors.white,
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
                                        child: Text(instance.os,
                                            style: TextStyle(
                                                color: Colors.white,
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
                                        "KVM :  ",
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
                                        child: InkWell(
                                            onTap: () => launch(instance.kvm),
                                            child: Text("Link",
                                                style: TextStyle(
                                                    decoration: TextDecoration
                                                        .underline,
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 15.0)))))),
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
                                        "Status :  ",
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
                                        child: Text(instance.status,
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15.0))))),
                          ],
                        )),
                  ],
                ))));
  }
}
