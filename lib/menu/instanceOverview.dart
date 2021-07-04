import 'package:VultrDash/api/instance.dart';
import 'package:VultrDash/api/model/instance.dart';
import 'package:VultrDash/api/snapshot.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class InstanceOverviewMenu extends StatefulWidget {
  final InstanceModel instance;

  InstanceOverviewMenu({Key key, @required this.instance}) : super(key: key);

  @override
  _InstanceOverviewState createState() =>
      _InstanceOverviewState(instance: instance);
}

class _InstanceOverviewState extends State<InstanceOverviewMenu> {
  InstanceModel instance;
  final Map<String, String> regionMap = {
    "ams": "Amsterdam",
    "atl": "Atlanta",
    "cdg": "Paris",
    "dfw": "Dallas",
    "ewr": "New Jersey",
    "fra": "Frankfurt",
    "icn": "Seoul",
    "lax": "Los Angeles",
    "lhr": "London",
    "mia": "Miami",
    "nrt": "Tokyo",
    "ord": "Chicago",
    "sea": "Seattle",
    "sgp": "Singapore",
    "sjc": "Silicon Valley",
    "syd": "Sydney",
    "yto": "Toronto"
  };

  _InstanceOverviewState({@required this.instance}) : super();

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

  void updateInstanceStatus() {
    Instance().getInfo(param: {"label": instance.label}).then((value) => {
          value.instances.length > 0
              ? this.setState(() {
                  instance = value.instances[0];
                })
              : value
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
                                  width: 50.0,
                                  child: Padding(
                                    padding: EdgeInsets.fromLTRB(
                                        16.0, 16.0, 0.0, 0.0),
                                    child: FlatButton(
                                        padding: EdgeInsets.all(0.0),
                                        child: Column(children: [
                                          Icon(
                                            instance.status == "active"
                                                ? Icons.pause
                                                : Icons.power_settings_new,
                                            color: Color.fromRGBO(
                                                0x8a, 0x90, 0x99, 1.0),
                                            size: 30,
                                          ),
                                          Text(
                                            instance.status == "active"
                                                ? "stop"
                                                : "start",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold),
                                          )
                                        ]),
                                        onPressed: () {
                                          print("start");
                                          var inst = Instance();
                                          if (instance.status == "active") {
                                            inst
                                                .halt(instance.id)
                                                .then((value) =>
                                                    updateInstanceStatus())
                                                .catchError((e) {
                                              print(e);
                                            });
                                            return;
                                          }
                                          inst
                                              .startInstance(instance.id)
                                              .then((value) =>
                                                  updateInstanceStatus())
                                              .catchError((e) {
                                            print(e);
                                          });
                                        }),
                                  )),
                              Ink(
                                  decoration: ShapeDecoration(
                                    color: Colors.lightBlue,
                                    shape: CircleBorder(),
                                  ),
                                  width: 50.0,
                                  child: Padding(
                                      padding: EdgeInsets.fromLTRB(
                                          0.0, 16.0, 0.0, 0.0),
                                      child: FlatButton(
                                          padding: EdgeInsets.all(0.0),
                                          child: Column(children: [
                                            Icon(
                                              Icons.autorenew,
                                              color: Color.fromRGBO(
                                                  0x8a, 0x90, 0x99, 1.0),
                                              size: 30,
                                            ),
                                            Text(
                                              "reboot",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold),
                                            )
                                          ]),
                                          onPressed: () {
                                            print("reboot");
                                            _showDialog(context, "Alert",
                                                "Really reboot instance?", () {
                                              print("success");
                                              Instance()
                                                  .rebootInstance(instance.id)
                                                  .then((value) =>
                                                      {updateInstanceStatus()})
                                                  .catchError((e) {
                                                print(e);
                                              });
                                            }, () {
                                              print("fail");
                                            });
                                          }))),
                              // Ink(
                              //     decoration: ShapeDecoration(
                              //       color: Colors.lightBlue,
                              //       shape: CircleBorder(),
                              //     ),
                              //     width: 50.0,
                              //     child: FlatButton(
                              //         padding: EdgeInsets.all(0.0),
                              //         child: Column(children: [
                              //           Icon(
                              //             Icons.disc_full,
                              //             color: Color.fromRGBO(
                              //                 0x8a, 0x90, 0x99, 1.0),
                              //             size: 30,
                              //           ),
                              //           Text(
                              //             "reinstall",
                              //             style: TextStyle(
                              //                 color: Colors.white,
                              //                 fontWeight: FontWeight.bold),
                              //           )
                              //         ]),
                              //         onPressed: () {
                              //           print("reinstall");
                              //           _showDialog(context, "Alert",
                              //               "Really reinstall instance?", () {
                              //             print("success");
                              //             Instance()
                              //                 .reinstallInstance(
                              //                     instance.id, instance.label)
                              //                 .then((value) =>
                              //                     {updateInstanceStatus()});
                              //           }, () {
                              //             print("fail");
                              //           });
                              //         })),
                              Ink(
                                  decoration: ShapeDecoration(
                                    color: Colors.lightBlue,
                                    shape: CircleBorder(),
                                  ),
                                  width: 50.0,
                                  child: Padding(
                                      padding: EdgeInsets.fromLTRB(
                                          0.0, 16.0, 0.0, 0.0),
                                      child: FlatButton(
                                          padding: EdgeInsets.all(0.0),
                                          child: Column(children: [
                                            Icon(
                                              Icons.delete,
                                              color: Color.fromRGBO(
                                                  0x8a, 0x90, 0x99, 1.0),
                                              size: 30,
                                            ),
                                            Text(
                                              "delete",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold),
                                            )
                                          ]),
                                          onPressed: () {
                                            print("delete");
                                            _showDialog(context, "Alert",
                                                "Really delete instance?", () {
                                              print("success");
                                              Instance()
                                                  .deleteInstance(instance.id)
                                                  .then((value) =>
                                                      {Navigator.pop(context)});
                                            }, () {
                                              print("fail");
                                            });
                                          }))),
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
                        Container(
                            height: 40,
                            child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(regionMap[instance.region],
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15.0))))),
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
