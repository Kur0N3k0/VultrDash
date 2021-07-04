import 'package:VultrDash/api/model/instance.dart';
import 'package:VultrDash/api/os.dart';
import 'package:VultrDash/api/snapshot.dart';
import 'package:flutter/material.dart';

class InstanceSnapshotMenu extends StatefulWidget {
  final InstanceModel instance;

  InstanceSnapshotMenu({Key key, @required this.instance}) : super(key: key);

  @override
  _InstanceSnapshotState createState() =>
      _InstanceSnapshotState(instance: instance);
}

class _InstanceSnapshotState extends State<InstanceSnapshotMenu> {
  InstanceModel instance;
  List<DataRow> contents = [];
  Map<int, String> osMap = {};

  _InstanceSnapshotState({@required this.instance}) : super() {
    getOS().then((value) => getSnapshots()).catchError((e) => {print(e)});
  }

  Future getOS() {
    return OS().getInfo().then((value) => {
          for (var os in value.os) {osMap[os.id] = os.name}
        });
  }

  void getSnapshots() {
    print(osMap);
    contents.clear();
    Snapshot()
        .getInfo()
        .then((value) async => {
              for (var i = 0; i < value.snapshots.length; i++)
                {
                  await Snapshot()
                      .getSnapshot(value.snapshots[i].id)
                      .then((snapshot) => {
                            print(snapshot.OSID),
                            contents.add(DataRow(cells: [
                              DataCell(Text(snapshot.description,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold))),
                              DataCell(Text(osMap[snapshot.OSID],
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold))),
                              DataCell(Text(snapshot.dateCreated,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold))),
                              DataCell(Text(snapshot.status,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold))),
                            ]))
                          })
                }
            })
        .then((value) => this.setState(() {}));
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
                                          "Snapshot",
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
                                children: [],
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
                                // decoration: BoxDecoration(
                                //     border: Border.all(color: Colors.white)),
                                child: ConstrainedBox(
                              constraints: BoxConstraints(
                                  minWidth: constraints.maxWidth),
                              child: DataTable(
                                  showCheckboxColumn: false,
                                  columns: [
                                    DataColumn(
                                        label: Expanded(
                                      child: Text(
                                        'Name',
                                        style: TextStyle(
                                            color: Color.fromRGBO(
                                                0xff, 0xff, 0xff, 0.4),
                                            fontWeight: FontWeight.bold),
                                        textAlign: TextAlign.center,
                                      ),
                                    )),
                                    DataColumn(
                                        label: Expanded(
                                      child: Text(
                                        'OS',
                                        style: TextStyle(
                                            color: Color.fromRGBO(
                                                0xff, 0xff, 0xff, 0.4),
                                            fontWeight: FontWeight.bold),
                                        textAlign: TextAlign.center,
                                      ),
                                    )),
                                    DataColumn(
                                        label: Expanded(
                                      child: Text(
                                        'Date',
                                        style: TextStyle(
                                            color: Color.fromRGBO(
                                                0xff, 0xff, 0xff, 0.4),
                                            fontWeight: FontWeight.bold),
                                        textAlign: TextAlign.center,
                                      ),
                                    )),
                                    DataColumn(
                                        label: Expanded(
                                      child: Text(
                                        'Status',
                                        style: TextStyle(
                                            color: Color.fromRGBO(
                                                0xff, 0xff, 0xff, 0.4),
                                            fontWeight: FontWeight.bold),
                                        textAlign: TextAlign.center,
                                      ),
                                    )),
                                  ],
                                  rows: contents),
                            )))
                      ],
                    )))));
  }
}
