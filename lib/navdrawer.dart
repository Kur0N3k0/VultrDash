import 'package:VultrDash/apikeysetup.dart';
import 'package:VultrDash/mainview.dart';
import 'package:VultrDash/menu/blockstorage.dart';
import 'package:VultrDash/menu/dns.dart';
import 'package:VultrDash/menu/firewall.dart';
import 'package:VultrDash/menu/instance.dart';
import 'package:VultrDash/menu/iso.dart';
import 'package:VultrDash/menu/loadbalancer.dart';
import 'package:VultrDash/menu/network.dart';
import 'package:VultrDash/menu/object.dart';
import 'package:VultrDash/menu/profile.dart';
import 'package:VultrDash/menu/script.dart';
import 'package:VultrDash/menu/snapshot.dart';
import 'package:flutter/material.dart';

class NavDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text(
              'Manage',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
            ),
            decoration: BoxDecoration(
              color: Color.fromRGBO(0x31, 0x32, 0x35, 1.0),
            ),
          ),
          ListTile(
            leading: Icon(Icons.verified_user),
            title: Text(
              'Profile',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            onTap: () => {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => ProfileMenu()))
            },
          ),
          ListTile(
            leading: Icon(Icons.layers),
            title: Text('Instances',
                style: TextStyle(fontWeight: FontWeight.bold)),
            onTap: () => {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => MainViewApp()))
            },
          ),
          ListTile(
            leading: Icon(Icons.archive),
            title: Text('Snapshots',
                style: TextStyle(fontWeight: FontWeight.bold)),
            onTap: () => {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => SnapshotMenu()))
            },
          ),
          ListTile(
            leading: Icon(Icons.file_upload),
            title: Text('ISOs', style: TextStyle(fontWeight: FontWeight.bold)),
            onTap: () => {
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => ISOMenu()))
            },
          ),
          ListTile(
            leading: Icon(Icons.note_add),
            title:
                Text('Scripts', style: TextStyle(fontWeight: FontWeight.bold)),
            onTap: () => {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => ScriptMenu()))
            },
          ),
          ListTile(
            leading: Icon(Icons.dns),
            title: Text('DNS', style: TextStyle(fontWeight: FontWeight.bold)),
            onTap: () => {
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => DNSMenu()))
            },
          ),
          ListTile(
            leading: Icon(Icons.storage),
            title: Text('BlockStorage',
                style: TextStyle(fontWeight: FontWeight.bold)),
            onTap: () => {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => BlockStorageMenu()))
            },
          ),
          ListTile(
            leading: Icon(Icons.backup),
            title:
                Text('Objects', style: TextStyle(fontWeight: FontWeight.bold)),
            onTap: () => {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => ObjectMenu()))
            },
          ),
          ListTile(
            leading: Icon(Icons.fireplace),
            title:
                Text('Firewall', style: TextStyle(fontWeight: FontWeight.bold)),
            onTap: () => {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => FirewallMenu()))
            },
          ),
          ListTile(
            leading: Icon(Icons.network_check),
            title:
                Text('Network', style: TextStyle(fontWeight: FontWeight.bold)),
            onTap: () => {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => NetworkMenu()))
            },
          ),
          ListTile(
            leading: Icon(Icons.alt_route),
            title: Text('LoadBalancer',
                style: TextStyle(fontWeight: FontWeight.bold)),
            onTap: () => {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => LoadBalancerMenu()))
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title:
                Text('Settings', style: TextStyle(fontWeight: FontWeight.bold)),
            onTap: () => {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => APIKeySetup()))
            },
          ),
          ListTile(
            leading: Icon(Icons.border_color),
            title:
                Text('Feedback', style: TextStyle(fontWeight: FontWeight.bold)),
            onTap: () => {Navigator.of(context).pop()},
          ),
        ],
      ),
    );
  }
}
