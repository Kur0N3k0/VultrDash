import 'package:VultrDash/api/model/instance.dart';
import 'package:VultrDash/menu/instanceBackup.dart';
import 'package:VultrDash/menu/instanceOverview.dart';
import 'package:VultrDash/menu/instanceSetting.dart';
import 'package:VultrDash/menu/instanceSnapshot.dart';
import 'package:VultrDash/navdrawer.dart';
import 'package:flutter/material.dart';

class InstanceDetailMenu extends StatefulWidget {
  final InstanceModel instance;

  InstanceDetailMenu({Key key, @required this.instance}) : super(key: key);

  @override
  _InstanceDetailMenuState createState() => _InstanceDetailMenuState();
}

class _InstanceDetailMenuState extends State<InstanceDetailMenu> {
  List<Widget> pages;
  int pageIdx = 0;

  @override
  void initState() {
    super.initState();

    pages = [
      InstanceOverviewMenu(instance: widget.instance),
      InstanceSnapshotMenu(instance: widget.instance),
      InstanceBackupMenu(instance: widget.instance),
      InstanceSettingMenu(instance: widget.instance),
    ];
  }

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
                setState(() {
                  pageIdx = value;
                });
              },
              currentIndex: pageIdx,
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
            body: pages[pageIdx]));
  }
}
