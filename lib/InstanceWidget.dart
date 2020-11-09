import 'package:VultrDash/Instance.dart';
import 'package:flutter/material.dart';

class InstanceWidget extends StatefulWidget {
  final Instance instance;
  InstanceWidget(this.instance);

  @override
  _InstanceWidgetState createState() => _InstanceWidgetState(instance);
}

class _InstanceWidgetState extends State<InstanceWidget> {
  Instance instance;

  _InstanceWidgetState(this.instance);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          print("maxWidth: ${MediaQuery.of(context).size.width}");
            return Container(
              child: Text(
                instance.name,
                style: TextStyle(color: Colors.black),
              ),
              width: MediaQuery.of(context).size.width / 2.1,
              height: MediaQuery.of(context).size.width / 2.1 / 1.5,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5.0),
                border: Border.all(color: Colors.grey)
              ),
            );
        },
      ),
    );
  }
}