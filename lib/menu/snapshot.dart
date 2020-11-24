import 'package:VultrDash/navdrawer.dart';
import 'package:flutter/material.dart';

class SnapshotMenu extends StatefulWidget {
  @override
  _SnapshotMenuState createState() => _SnapshotMenuState();
}

class _SnapshotMenuState extends State<SnapshotMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavDrawer(),
      appBar: AppBar(
        title: Text("Snapshot", style: TextStyle(fontStyle: FontStyle.italic)),
        backgroundColor: Color.fromRGBO(0x1f, 0x20, 0x23, 1.0),
      ),
      backgroundColor: Color.fromRGBO(0x31, 0x32, 0x35, 1.0),
    );
  }
}
