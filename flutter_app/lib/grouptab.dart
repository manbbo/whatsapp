import 'package:flutter/material.dart';
import 'messages.dart';
import 'widgets.dart';

class GroupTab extends StatefulWidget {
  @override
  _GroupTabState createState() => _GroupTabState();
}

class _GroupTabState extends State<GroupTab> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(
      overflow: Overflow.clip,
      children: <Widget>[
        MessagesPage(),
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(5),
              child: TextBar(),
              decoration: new BoxDecoration(
                color: Colors.blue,
              ),
            )
          ],
        ),
      ],
    );
  }
}