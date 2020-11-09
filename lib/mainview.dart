import 'package:VultrDash/navdrawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MainViewApp extends StatefulWidget {
  @override
  _MainViewAppState createState() => _MainViewAppState();
}

class _MainViewAppState extends State<MainViewApp> {
  final SvgPicture icon = SvgPicture.asset("./assets/img/icon-ubuntu.svg");
  final Image search = Image.asset("./assets/img/search.png");
  final Image flag = Image.asset("./assets/img/flagsm_jp.webp");

  @override
  Widget build(BuildContext context) {
    var result = Scaffold(
      drawer: NavDrawer(),
      appBar: AppBar(
        title: Text("VultrDash",
          style: TextStyle(
            fontStyle: FontStyle.italic
          )
        ),
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
                      child: Icon(Icons.search, color: Color.fromRGBO(0xff, 0xff, 0xff, 0.4)),
                      width: 15,
                      height: 15,
                      padding: EdgeInsets.all(10)
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(5.0),
                      ),
                    ),
                    filled: true,
                    contentPadding: EdgeInsets.all(10),
                    hintStyle: TextStyle(color: Colors.grey[800]),
                    hintText: "Type in your text",
                    fillColor: Color.fromRGBO(0x31, 0x32, 0x35, 1.0)
                  ),
                ),
                Container(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: ConstrainedBox(
                      constraints: BoxConstraints(minWidth: constraints.maxWidth),
                      child: DataTable(
                        columns: [
                          DataColumn(
                            label: Container(
                              child: Text('Server', style: TextStyle(color: Color.fromRGBO(0xff, 0xff, 0xff, 0.4))),
                              alignment: Alignment.center,
                            )
                          ),
                          DataColumn(
                            label: Container(
                              child: Text('OS', style: TextStyle(color: Color.fromRGBO(0xff, 0xff, 0xff, 0.4))),
                              alignment: Alignment.center,
                            )
                          ),
                          DataColumn(
                            label: Container(
                              child: Text('Region', style: TextStyle(color: Color.fromRGBO(0xff, 0xff, 0xff, 0.4))),
                              alignment: Alignment.center,
                            )
                          ),
                          DataColumn(
                            label: Container(
                              child: Text('Status', style: TextStyle(color: Color.fromRGBO(0xff, 0xff, 0xff, 0.4))),
                              alignment: Alignment.center,
                            )
                          ),
                        ],
                        rows: [
                          DataRow(
                            cells: [
                              DataCell(
                                Container(
                                  child: Text('nekop.kr', style: TextStyle(color: Colors.white)),
                                  width: MediaQuery.of(context).size.width / 7
                                )
                              ),
                              DataCell(
                                Container(
                                  child: icon,
                                  width: 20,
                                  alignment: Alignment.center,
                                )
                              ),
                              DataCell(
                                Container(
                                  child: flag,
                                  alignment: Alignment.center,
                                )
                              ),
                              DataCell(
                                Container(
                                  child: Text('Running', style: TextStyle(color: Colors.white)),
                                  width: MediaQuery.of(context).size.width / 7
                                )
                              ),
                            ]
                          ),
                        ],
                      ),
                    )
                  )
                )
              ],
            )
          )
        )
      );

    return result;
  }
}