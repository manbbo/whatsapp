import 'package:flutter/material.dart';
import 'messages.dart';
import 'widgets.dart';

class StatusTab extends StatefulWidget {
  @override
  _StatusTabState createState() => _StatusTabState();
}

class _StatusTabState extends State<StatusTab> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(
      children: <Widget>[
        Text('HI IM A TEXT - STATUS TAB'),
      ],
    );
  }
}