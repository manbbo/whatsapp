import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'widgets.dart';

class SearchConversation extends StatefulWidget {
  @override
  _SearchConversationState createState() => _SearchConversationState();
}

class _SearchConversationState extends State<SearchConversation> {
  String text;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Conversations"),
      ),
      body: Stack(
        children: <Widget>[
          SearchBar('Rechercher de Conversations', () => {Navigator.pop(context)})
        ],
      ),
    );
  }
}