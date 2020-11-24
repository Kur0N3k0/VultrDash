import 'package:VultrDash/api/instance.dart';
import 'package:VultrDash/api/model/instance.dart';
import 'package:VultrDash/navdrawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:localstorage/localstorage.dart';
import 'package:tuple/tuple.dart';

class MainViewApp extends StatefulWidget {
  @override
  _MainViewAppState createState() => _MainViewAppState();
}

class _MainViewAppState extends State<MainViewApp> {
  final SvgPicture icon = SvgPicture.asset("./assets/img/icon-ubuntu.svg");
  final Image search = Image.asset("./assets/img/search.png");
  final Image flag = Image.asset("./assets/img/flagsm_jp.webp");
  final List<Tuple2<InstanceModel, DataRow>> instances = [];
  final List<DataRow> serverList = [];
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

  @override
  Widget build(BuildContext context) {
    if (instances.isEmpty) {
      Instance inst = new Instance();
      inst.getInfo().then((value) => {
            value.instances.forEach((element) {
              instances.add(new Tuple2(
                  element,
                  DataRow(cells: [
                    DataCell(Container(
                        child: Text(element.label,
                            style: TextStyle(color: Colors.white)),
                        width: MediaQuery.of(context).size.width / 7)),
                    DataCell(Container(
                      child: icon,
                      width: 20,
                      alignment: Alignment.center,
                    )),
                    DataCell(Container(
                      child: Text(regionMap[element.region],
                          style: TextStyle(color: Colors.white)),
                      alignment: Alignment.center,
                    )),
                    DataCell(Container(
                        child: Text(element.powerStatus,
                            style: TextStyle(color: Colors.white)),
                        width: MediaQuery.of(context).size.width / 7)),
                  ])));
              instances.forEach((element) {
                serverList.add(element.item2);
              });

              setState(() {});
            })
          });
    }

    var result = Scaffold(
        drawer: NavDrawer(),
        appBar: AppBar(
          title:
              Text("VultrDash", style: TextStyle(fontStyle: FontStyle.italic)),
          backgroundColor: Color.fromRGBO(0x1f, 0x20, 0x23, 1.0),
        ),
        backgroundColor: Color.fromRGBO(0x31, 0x32, 0x35, 1.0),
        body: LayoutBuilder(
            builder: (context, constraints) => SingleChildScrollView(
                    child: Column(
                  children: [
                    TextField(
                      decoration: InputDecoration(
                          prefixIcon: Container(
                              child: Icon(Icons.search,
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
                          hintText: "Type in your text",
                          fillColor: Color.fromRGBO(0x31, 0x32, 0x35, 1.0)),
                    ),
                    Container(
                        child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: ConstrainedBox(
                              constraints: BoxConstraints(
                                  minWidth: constraints.maxWidth),
                              child: DataTable(
                                columns: [
                                  DataColumn(
                                      label: Container(
                                    child: Text('Server',
                                        style: TextStyle(
                                            color: Color.fromRGBO(
                                                0xff, 0xff, 0xff, 0.4))),
                                    alignment: Alignment.center,
                                  )),
                                  DataColumn(
                                      label: Container(
                                    child: Text('OS',
                                        style: TextStyle(
                                            color: Color.fromRGBO(
                                                0xff, 0xff, 0xff, 0.4))),
                                    alignment: Alignment.center,
                                  )),
                                  DataColumn(
                                      label: Container(
                                    child: Text('Region',
                                        style: TextStyle(
                                            color: Color.fromRGBO(
                                                0xff, 0xff, 0xff, 0.4))),
                                    alignment: Alignment.center,
                                  )),
                                  DataColumn(
                                      label: Container(
                                    child: Text('Status',
                                        style: TextStyle(
                                            color: Color.fromRGBO(
                                                0xff, 0xff, 0xff, 0.4))),
                                    alignment: Alignment.center,
                                  )),
                                ],
                                rows: serverList,
                              ),
                            )))
                  ],
                ))));

    return result;
  }
}
