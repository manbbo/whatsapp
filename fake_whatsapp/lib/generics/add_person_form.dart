import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'widgets.dart';

class AddPerson extends StatefulWidget {
  @override
  _AddPersonState createState() => _AddPersonState();
}

class _AddPersonState extends State<AddPerson> {
  String text;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ajouter"),
      ),
      body: Stack(
        children: <Widget>[
          SearchBar('Rechercher une Personne', () => {Navigator.pop(context)})
        ],
      ),
    );
  }
}