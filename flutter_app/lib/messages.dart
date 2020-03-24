import 'package:flutter/material.dart';
import 'widgets.dart';

class MessagesWidget extends StatefulWidget {
  final List<ChatBubble> chatBubble;
  MessagesWidget({this.chatBubble});
  @override
  _MessagesWidgetState createState() => _MessagesWidgetState(chatBubble);
}

class _MessagesWidgetState extends State<MessagesWidget> {
  List<ChatBubble> chatBubble;

  _MessagesWidgetState(List<ChatBubble> c) {
    this.chatBubble = c;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: ListView.builder(
            itemCount: chatBubble.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                alignment: Alignment.topRight,
                child: chatBubble[index],
              );
            },
          ),
        )
      ],
    );
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

  static List<ChatBubble> c = [];
  MessagesWidget m = new MessagesWidget(chatBubble: c,);

  @override
  Widget build(BuildContext context) {
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
        children: <Widget>[
          m,
          TextBar(m: c)]
        ,
      ),
    );
  }
}
