import 'package:flutter/material.dart';
import 'widgets.dart';

import 'messages.dart';

class ChatTab extends StatefulWidget {
  @override
  _ChatTabState createState() => _ChatTabState();
}

class _ChatTabState extends State<ChatTab> {
  List<ChatTile> tiles = [new ChatTile(title: 'sebastian', path: SingleMessagesPage(title: 'sebastian',)),
    new ChatTile(title: 'Alex', path: SingleMessagesPage(title: 'Alex',)),
    new ChatTile(title: 'GUGAM', path: SingleMessagesPage(title: 'GUGAM',)),
    new ChatTile(title: 'MY LOVE', path: SingleMessagesPage(title: 'MY LOVE',)),
    new ChatTile(title: 'Edson', path: SingleMessagesPage(title: 'Edson',)),
    new ChatTile(title: 'Mike', path: SingleMessagesPage(title: 'Mike',)),
    new ChatTile(title: 'Real cool girl', path: SingleMessagesPage(title: 'Real cool girl',)),
    new ChatTile(title: 'Amazing Goug', path: SingleMessagesPage(title: 'Amazing Goug',)),
    new ChatTile(title: 'Doug Dimmadong', path: SingleMessagesPage(title: 'Doug Dimmadong',)),
    new ChatTile(title: 'Katerine', path: SingleMessagesPage(title: 'Katerine',)),
    new ChatTile(title: 'Carol Work', path: SingleMessagesPage(title: 'Carol Work',)),
    new ChatTile(title: 'Smith', path: SingleMessagesPage(title: 'Smith',)),
    new ChatTile(title: 'Neo', path: SingleMessagesPage(title: 'Neo',)),];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        body: Stack(
          overflow: Overflow.clip,
          children: <Widget>[
            //MessagesPage(),
            ListView.builder(
              itemCount: tiles.length,
              itemBuilder: (context, int index) {
                return tiles[index];
              },
            ),
          ],
        ),
      floatingActionButton: FloatingActionButton.extended(
        icon: Icon(Icons.add_circle),
        label: Text('New Chat'),
      ),
      //https://proandroiddev.com/a-deep-dive-into-floatingactionbutton-in-flutter-bf95bee11627
    );
  }
}
