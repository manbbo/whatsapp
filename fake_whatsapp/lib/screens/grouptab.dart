import 'package:flutter/material.dart';
import '../generics/messages.dart';
import '../generics/widgets.dart';

class GroupTab extends StatefulWidget {
  @override
  _GroupTabState createState() => _GroupTabState();
}

class _GroupTabState extends State<GroupTab> {
  List<ChatTile> tiles = [new ChatTile(title: 'Marvel > DC', path: SingleMessagesPage(title: 'Marvel > DC',)),
    new ChatTile(title: 'AWESOME GROUP', path: SingleMessagesPage(title: 'AWESOME GROUP',)),
    new ChatTile(title: 'Family', path: SingleMessagesPage(title: 'Family',)),
    new ChatTile(title: 'All friends for Jones', path: SingleMessagesPage(title: 'All friends for Jones',)),
    new ChatTile(title: 'I love comicbooks', path: SingleMessagesPage(title: 'I love comicbooks',))];

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
        icon: Icon(Icons.group_add),
        label: Text('New Group'),
      ),
    );
  }
}