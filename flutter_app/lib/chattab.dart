import 'package:flutter/material.dart';
import 'messages.dart';
import 'widgets.dart';

class ChatTab extends StatefulWidget {
  @override
  _ChatTabState createState() => _ChatTabState();
}

class _ChatTabState extends State<ChatTab> {
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
                color: Colors.green,
              ),
            )
          ],
        ),
      ],
    );
  }
}