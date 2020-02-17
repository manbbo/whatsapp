import 'package:flutter/material.dart';
import 'widgets.dart';

class MessagesWidget extends StatefulWidget {
  @override
  _MessagesWidgetState createState() => _MessagesWidgetState();
}

class _MessagesWidgetState extends State<MessagesWidget> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(mainAxisAlignment: MainAxisAlignment.start,
        //crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ChatBubble("aasda", false),
          ChatBubble("asdasdasd", true),
        ]);
  }
}

class SingleMessagesPage extends StatefulWidget {
  final String title;
  SingleMessagesPage({this.title});

  @override
  _SingleMessagesPageState createState() => _SingleMessagesPageState(title);
}

class _SingleMessagesPageState extends State<SingleMessagesPage> {
  String title;
  _SingleMessagesPageState(title) {
    this.title = title;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.videocam),
            onPressed: () => {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: new Text("Type in your search"),
                      content: new Container(
                        child: TextField(),
                      ),
                      actions: <Widget>[
                        // usually buttons at the bottom of the dialog
                        new FlatButton(
                          child: new Text("Search"),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  }),
            },
          ),
          IconButton(
            icon: Icon(Icons.phone),
            onPressed: () => {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: new Text("Type in your search"),
                      content: new Container(
                        child: TextField(),
                      ),
                      actions: <Widget>[
                        // usually buttons at the bottom of the dialog
                        new FlatButton(
                          child: new Text("Search"),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  }),
            },
          ),
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () => {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: new Text("Type in your search"),
                      content: new Container(
                        child: TextField(),
                      ),
                      actions: <Widget>[
                        // usually buttons at the bottom of the dialog
                        new FlatButton(
                          child: new Text("Search"),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  }),
            },
          )
        ],
      ),
      body: Stack(
        overflow: Overflow.clip,
        children: <Widget>[MessagesWidget(), TextBar()],
      ),
    );
  }
}
