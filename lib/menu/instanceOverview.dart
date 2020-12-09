import 'package:VultrDash/api/instance.dart';
import 'package:VultrDash/api/model/instance.dart';
import 'package:VultrDash/api/snapshot.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class InstanceOverviewMenu extends StatelessWidget {
  final InstanceModel instance;

  InstanceOverviewMenu({Key key, @required this.instance}) : super(key: key);

  void _showDialog(BuildContext context, String title, String content,
      successCallback, failCallback) {
    showDialog(
        context: context,
        builder: (BuildContext ctx) {
          return AlertDialog(
            title: Text(title),
            content: Text(content),
            actions: [
              FlatButton(
                child: Text("Yes"),
                onPressed: () {
                  successCallback();
                  Navigator.pop(ctx);
                },
              ),
              FlatButton(
                child: Text("No"),
                onPressed: () {
                  failCallback();
                  Navigator.pop(ctx);
                },
              ),
            ],
          );
        });
  }

  Widget getOverviewInfoWidget(String key, Widget value) {
    return Padding(
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
                        key,
                        style: TextStyle(
                            color: Color.fromRGBO(0x8a, 0x90, 0x99, 1.0),
                            fontWeight: FontWeight.bold,
                            fontSize: 15.0),
                      ),
                    ))),
            Expanded(flex: 2, child: Container(height: 40, child: value)),
          ],
        ));
  }

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
                                      "Instance",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 26.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    )),
                                Padding(
                                    padding: EdgeInsets.fromLTRB(
                                        16.0, 0.0, 0.0, 0.0),
                                    child: Text(
                                      instance.label,
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
                                    icon: Icon(
                                      Icons.power_settings_new,
                                      color:
                                          Color.fromRGBO(0x8a, 0x90, 0x99, 1.0),
                                      size: 30,
                                    ),
                                    onPressed: () {
                                      print("start");
                                      Instance()
                                          .startInstance(instance.id)
                                          .whenComplete(() => {
                                                // TODO: toast message & update server status
                                              })
                                          .catchError((e) {
                                        print(e);
                                      });
                                    }),
                              ),
                              IconButton(
                                  icon: Icon(
                                    Icons.autorenew,
                                    color:
                                        Color.fromRGBO(0x8a, 0x90, 0x99, 1.0),
                                    size: 30,
                                  ),
                                  onPressed: () {
                                    print("reboot");
                                    // Snapshot()
                                    //     .createSnapshot(instance.id, "test")
                                    //     .then(
                                    //         (value) => {print(value.toJson())});
                                    Snapshot().getInfo().then((value) =>
                                        {print(value.snapshots[0].toJson())});
                                    Instance().getInfo().then((value) =>
                                        {print(value.instances[0].toJson())});
                                    // Instance()
                                    //     .rebootInstance(instance.id)
                                    //     .catchError((e) {
                                    //   print(e);
                                    // });
                                    _showDialog(context, "Alert",
                                        "Really reboot instance?", () {
                                      print("success");
                                      // TODO: toast message & update server status
                                    }, () {
                                      print("fail");
                                    });
                                  }),
                              IconButton(
                                  icon: Icon(
                                    Icons.disc_full,
                                    color:
                                        Color.fromRGBO(0x8a, 0x90, 0x99, 1.0),
                                    size: 30,
                                  ),
                                  onPressed: () {
                                    print("reinstall");
                                    _showDialog(context, "Alert",
                                        "Really reinstall instance?", () {
                                      print("success");
                                      // TODO: toast message & update server status
                                    }, () {
                                      print("fail");
                                    });
                                  }),
                              IconButton(
                                  icon: Icon(
                                    Icons.delete,
                                    color:
                                        Color.fromRGBO(0x8a, 0x90, 0x99, 1.0),
                                    size: 30,
                                  ),
                                  onPressed: () {
                                    print("delete");
                                    _showDialog(context, "Alert",
                                        "Really delete instance?", () {
                                      print("success");
                                      // TODO: toast message & update server status
                                    }, () {
                                      print("fail");
                                    });
                                  }),
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
                    getOverviewInfoWidget(
                        "Location :  ",
                        Row(children: [
                          Image.asset("./assets/img/flagsm_jp.webp"),
                          Padding(
                            padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                            child: Text(
                              "Tokyo",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15.0),
                            ),
                          )
                        ])),
                    getOverviewInfoWidget(
                        "IP Address :  ",
                        Container(
                            height: 40,
                            child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(instance.mainIp,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15.0))))),
                    getOverviewInfoWidget(
                        "vCPU :  ",
                        Container(
                            height: 40,
                            child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(instance.vcpuCount.toString(),
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15.0))))),
                    getOverviewInfoWidget(
                        "RAM :  ",
                        Container(
                            height: 40,
                            child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(instance.ram.toString() + " MB",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15.0))))),
                    getOverviewInfoWidget(
                        "Storage :  ",
                        Container(
                            height: 40,
                            child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(instance.disk.toString() + " GB",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15.0))))),
                    getOverviewInfoWidget(
                        "Label :  ",
                        Container(
                            height: 40,
                            child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(instance.label,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15.0))))),
                    getOverviewInfoWidget(
                        "Tag :  ",
                        Container(
                            height: 40,
                            child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(instance.tag,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15.0))))),
                    getOverviewInfoWidget(
                        "OS :  ",
                        Container(
                            height: 40,
                            child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(instance.os,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15.0))))),
                    getOverviewInfoWidget(
                        "KVM :  ",
                        Container(
                            height: 40,
                            child: Align(
                                alignment: Alignment.centerLeft,
                                child: InkWell(
                                    onTap: () => launch(instance.kvm),
                                    child: Text("Link",
                                        style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15.0)))))),
                    getOverviewInfoWidget(
                        "Status :  ",
                        Container(
                            height: 40,
                            child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(instance.status,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15.0))))),
                  ],
                ))));
  }
}
