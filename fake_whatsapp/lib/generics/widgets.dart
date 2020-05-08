import 'package:flutter/cupertino.dart';

import 'messages.dart';
import 'package:flutter/material.dart';

class ChatTile extends StatefulWidget {
  final String title;
  final Widget path;

  ChatTile({this.title, this.path});

  @override
  _ChatTileState createState() => _ChatTileState(this.title, this.path);
}

class _ChatTileState extends State<ChatTile> {
  Widget path;
  String title;

  _ChatTileState(title, path) {
    this.path = path;
    this.title = title;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return
      Container(
        decoration: BoxDecoration(
          border: Border(bottom: BorderSide(width: 0.2))
        ),
        child: ListTile(
          leading: Icon(Icons.people),
          title: Text(title),
          subtitle: Text("JUST KIDDING, I AIN'T NO SUBTITLE, just testing the lines to see if everything is ok", maxLines: 1,),
          onTap: () => {
            Navigator.push(context, new MaterialPageRoute(
              builder: (context) => path
            ))
          },
        ),
      );
  }
}

class MenuButton extends StatefulWidget {
  final bool isGroup;
  MenuButton({this.isGroup});

  @override
  _MenuButtonState createState() => _MenuButtonState(this.isGroup);
}

enum MenuDrop { newtransmition, reseauweb, important, settings }

class _MenuButtonState extends State<MenuButton> {
  bool isGroup;
  _MenuButtonState(isGroup) {
    this.isGroup = isGroup;
  }
  var _selection;

    @override
    Widget build(BuildContext context) {
      return PopupMenuButton<MenuDrop>(
        onSelected: (MenuDrop selection) { setState(() {
          _selection = selection;
        });},
        itemBuilder: (BuildContext context) => <PopupMenuEntry<MenuDrop>> [
          const PopupMenuItem<MenuDrop>(
            value: MenuDrop.newtransmition,
            child: Text('Nouvelle Diffusion'),
          ),
          const PopupMenuItem<MenuDrop>(
            value: MenuDrop.reseauweb,
            child: Text('Reseau Web'),
          ),
          const PopupMenuItem<MenuDrop>(
            value: MenuDrop.important,
            child: Text('Messages Importants'),
          ),
          const PopupMenuItem<MenuDrop>(
            value: MenuDrop.settings,
            child: Text('Paramètres'),
          ),
        ],
      );
    }
}

//ICON BUTTON
class ButtonIcon extends StatefulWidget {
  var addPerson;
  IconData icon;

  ButtonIcon(addPerson, icon) {
    this.addPerson = addPerson;
    this.icon = icon;
  }
  @override
  _ButtonIconState createState() => _ButtonIconState(addPerson, icon);
}

class _ButtonIconState extends State<ButtonIcon> {
  var addPerson;
  IconData icon;
  _ButtonIconState(addPerson, icon) {
    this.addPerson = addPerson;
    this.icon = icon;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return IconButton(
      icon: Icon(icon),
      onPressed: () => {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => addPerson))
      },
    );
  }
}
////////////////////////////

//SEARCH BAR
class SearchBar extends StatefulWidget {
  String hint;
  Function function;
  SearchBar(hint, function) {
    this.hint = hint;
    this.function = function;
  }

  @override
  _SearchBarState createState() => _SearchBarState(hint,function);
}

class _SearchBarState extends State<SearchBar> {
  String hint;
  Function function;
  _SearchBarState(hint, function) {
    this.hint = hint;
    this.function = function;
  }

  TextEditingController text;

  void initState() {
    super.initState();
    text = TextEditingController();
  }

  void dispose() {
    text.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Column(
        //mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(5),
            child: Stack(
              children: <Widget>[
                TextFormField(
                  autofocus: true,
                  controller: text,
                  maxLines: 1,
                  textCapitalization: TextCapitalization.sentences,
                  // Decoration
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.all(5),
                      //first Icon
                    //Hint Text
                    hintText: hint,
                    // Suffix Icon
                    suffixIcon: IconButton(
                      icon: Icon(Icons.search),
                      onPressed: function,
                    ),
                  ),
                ),
              ],
            )
          )
        ],
      ),
    );
  }
}
//////////////////

// TEXTBAR (CHAT)
class TextBar extends StatefulWidget {
  final List<ChatBubble> m;
  TextBar({this.m});

  @override
  _TextBar createState() => _TextBar(m);
}

class _TextBar extends State<TextBar> {
  TextEditingController textMessage;

  List<ChatBubble> c;
  _TextBar(List<ChatBubble> c) {
    this.c = c;
  }

  void initState() {
    super.initState();
    textMessage = TextEditingController();
  }

  void dispose() {
    textMessage.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(5),
            child: Stack(
              children: <Widget>[
                TextFormField(
                  controller: textMessage,
                  maxLines: 3,
                  minLines: 1,
                  textCapitalization: TextCapitalization.sentences,
                  // Decoration
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.all(5),
                    icon: IconButton(
                      //first Icon
                      icon: Icon(Icons.insert_emoticon),
                      onPressed: () => {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: new Text("EMOTICONS"),
                                content: new Container(
                                  width: 400,
                                  height: 300,
                                  child: new CustomScrollView(
                                    slivers: <Widget>[
                                      SliverGrid(
                                        gridDelegate:
                                            SliverGridDelegateWithMaxCrossAxisExtent(
                                          maxCrossAxisExtent: 100.0,
                                          mainAxisSpacing: 10.0,
                                          crossAxisSpacing: 10.0,
                                          childAspectRatio: 1.0,
                                        ),
                                        delegate: SliverChildBuilderDelegate(
                                          (BuildContext context, int index) {
                                            return Container(
                                              alignment: Alignment.center,
                                              color: Colors
                                                  .teal[100 * (index % 9)],
                                              child: Text('Grid Item $index'),
                                            );
                                          },
                                          childCount: 18,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                actions: <Widget>[
                                  // usually buttons at the bottom of the dialog
                                  new FlatButton(
                                    child: new Text("Close"),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                ],
                              );
                            }),
                      },
                    ),
                    //Hint Text
                    hintText: 'Text',
                    // Suffix Icon
                    suffixIcon: IconButton(
                      icon: Icon(Icons.send),
                      onPressed: () => {
                      //c = new MessagesWidget(chatBubble: new ChatBubble('_text', true),),
                        c.add(new ChatBubble(textMessage.text, true)),
                        setState((){}),
                        textMessage.clear(),
                      },
                    ),
                  ),
                ),
              ],
            ),
            decoration: new BoxDecoration(
              color: Colors.green,
            ),
          )
        ],
      ),
    );
  }
}
////////////////////////

// CHAT BUBBLE
class ChatBubble extends StatefulWidget {
  String _text; // = 'Its me, mario';
  bool _sent;
  ChatBubble(_text, _sent) {
    this._sent = _sent;
    this._text = _text;
  }

  @override
  _ChatBubbleState createState() => _ChatBubbleState(_text, _sent);
}

class _ChatBubbleState extends State<ChatBubble> {
  String _text;
  bool _sent;
  _ChatBubbleState(_text, _sent) {
    this._text = _text;
    this._sent = _sent;
  }

  Alignment setAlignment() {
    switch (_sent) {
      case true:
        return Alignment.topRight;
        break;
      case false:
        return Alignment.topLeft;
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: setAlignment(),
      padding: EdgeInsets.all(5),
      child: Container(
        color: Colors.green,
        constraints: BoxConstraints(maxWidth: 330),
        padding: EdgeInsets.all(10),
        child: Text(_text),
      ),
    );
  }
}
//////////////////////////

// LIST WIDGET (to create functions lists)
class ListWidget extends StatefulWidget {
  List<Function> wwidget;
  ListWidget(wwidget) {
    this.wwidget = wwidget;
  }

  @override
  _ListWidgetState createState() => _ListWidgetState(wwidget);
}

class _ListWidgetState extends State<ListWidget> {
  List<Function> wwidget;
  _ListWidgetState(wwidget) {
    this.wwidget = wwidget;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implementar o JSON aqui dentro da classe
    //
    return new ListView.builder(
      itemBuilder: wwidget[1],
      itemCount: wwidget.length,
    );
  }
}
////////////////////////////////////