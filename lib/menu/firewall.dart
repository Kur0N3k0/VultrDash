import 'package:VultrDash/navdrawer.dart';
import 'package:flutter/material.dart';

class FirewallMenu extends StatefulWidget {
  @override
  _FirewallMenuState createState() => _FirewallMenuState();
}

class _FirewallMenuState extends State<FirewallMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavDrawer(),
      appBar: AppBar(
        title: Text("Firewall", style: TextStyle(fontStyle: FontStyle.italic)),
        backgroundColor: Color.fromRGBO(0x1f, 0x20, 0x23, 1.0),
      ),
      backgroundColor: Color.fromRGBO(0x31, 0x32, 0x35, 1.0),
    );
  }
}
