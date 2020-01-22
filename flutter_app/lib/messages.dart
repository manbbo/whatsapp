import 'package:flutter/material.dart';
import 'widgets.dart';

class MessagesPage extends StatefulWidget {
  @override
  _MessagesPageState createState() => _MessagesPageState();
}

class _MessagesPageState extends State<MessagesPage> {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(mainAxisAlignment: MainAxisAlignment.start,
        //crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ChatBubble("aasda", false),
          ChatBubble("asdasdasd", true),
        ]
    );
  }
}
