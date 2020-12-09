import 'package:VultrDash/api/backup.dart';
import 'package:VultrDash/api/instance.dart';
import 'package:VultrDash/api/model/instance.dart';
import 'package:VultrDash/api/snapshot.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class InstanceSnapshotMenu extends StatelessWidget {
  final InstanceModel instance;
  List<Widget> contents;

  InstanceSnapshotMenu({Key key, @required this.instance}) : super(key: key);

  void getSnapshots(String instanceId) {
    Snapshot()
        .createSnapshot(instanceId, "test")
        .then((value) => {print(value.toJson())});
  }

  @override
  Widget build(BuildContext context) {
    //getSnapshots(instance.id);

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
        child: LayoutBuilder(
            builder: (ctx, constraints) => SingleChildScrollView(
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
                                          "Snapshots",
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
                                        tooltip: "test",
                                        icon: Icon(
                                          Icons.power_settings_new,
                                          color: Color.fromRGBO(
                                              0x8a, 0x90, 0x99, 1.0),
                                          size: 30,
                                        ),
                                        onPressed: () {
                                          print("zzzz");
                                        }),
                                  ),
                                  IconButton(
                                      icon: Icon(
                                        Icons.autorenew,
                                        color: Color.fromRGBO(
                                            0x8a, 0x90, 0x99, 1.0),
                                        size: 30,
                                      ),
                                      onPressed: null),
                                  IconButton(
                                      icon: Icon(
                                        Icons.disc_full,
                                        color: Color.fromRGBO(
                                            0x8a, 0x90, 0x99, 1.0),
                                        size: 30,
                                      ),
                                      onPressed: null),
                                  IconButton(
                                      icon: Icon(
                                        Icons.delete,
                                        color: Color.fromRGBO(
                                            0x8a, 0x90, 0x99, 1.0),
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
                            padding: EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 10.0),
                            child: Container(
                              constraints: BoxConstraints(
                                minWidth: MediaQuery.of(context).size.width,
                              ),
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.white),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5))),
                              child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 10.0, horizontal: 10.0),
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Take Snapshot",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        TextField(
                                          style: TextStyle(color: Colors.white),
                                          decoration: InputDecoration(
                                              labelText: 'label',
                                              labelStyle: TextStyle(
                                                  color: Colors.white),
                                              focusedBorder:
                                                  UnderlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color: Colors.white)),
                                              suffixIcon: IconButton(
                                                icon: Icon(
                                                  Icons.add,
                                                  color: Colors.white,
                                                ),
                                              )),
                                        )
                                      ])),
                            )),
                        Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 10.0),
                            child: Container(
                              height: 1.0,
                              color: Colors.white,
                            )),
                        Padding(
                            padding: EdgeInsets.symmetric(horizontal: 0.0),
                            child: Container(
                                alignment: Alignment.center,
                                // decoration: BoxDecoration(
                                //     border: Border.all(color: Colors.white)),
                                child: ConstrainedBox(
                                  constraints: BoxConstraints(
                                      minWidth: constraints.minWidth),
                                  child: DataTable(
                                      showCheckboxColumn: false,
                                      columns: [
                                        DataColumn(
                                            label: Container(
                                          child: Text('Name',
                                              style: TextStyle(
                                                  color: Color.fromRGBO(
                                                      0xff, 0xff, 0xff, 0.4),
                                                  fontWeight: FontWeight.bold)),
                                          alignment: Alignment.center,
                                        )),
                                        DataColumn(
                                            label: Container(
                                          child: Text('OS',
                                              style: TextStyle(
                                                  color: Color.fromRGBO(
                                                      0xff, 0xff, 0xff, 0.4),
                                                  fontWeight: FontWeight.bold)),
                                          alignment: Alignment.center,
                                        )),
                                        DataColumn(
                                            label: Container(
                                          child: Text('Date',
                                              style: TextStyle(
                                                  color: Color.fromRGBO(
                                                      0xff, 0xff, 0xff, 0.4),
                                                  fontWeight: FontWeight.bold)),
                                          alignment: Alignment.center,
                                        )),
                                        DataColumn(
                                            label: Container(
                                          child: Text('Status',
                                              style: TextStyle(
                                                  color: Color.fromRGBO(
                                                      0xff, 0xff, 0xff, 0.4),
                                                  fontWeight: FontWeight.bold)),
                                          alignment: Alignment.center,
                                        )),
                                      ],
                                      rows: []),
                                )))
                      ],
                    )))));
  }
}
