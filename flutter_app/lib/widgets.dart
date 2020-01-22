import 'package:flutter/material.dart';

class TextBar extends StatefulWidget {
  @override
  _TextBar createState() => _TextBar();
}

class _TextBar extends State<TextBar> {
  TextEditingController textMessage;

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
                color: Colors.black,
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
                                        color: Colors.teal[100 * (index % 9)],
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
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: new Text("MESSAGE SENT"),
                          content: new Text(textMessage.text),
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
            ),
          ),
        ],
      ),
    );
  }
}

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
    switch(_sent) {
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
    )
    ;
  }
}

class ListWidget extends StatefulWidget {
  @override
  _ListWidgetState createState() => _ListWidgetState();
}

class _ListWidgetState extends State<ListWidget> {
  @override
  Widget build(BuildContext context) {
    // TODO: implementar o JSON aqui dentro da classe
    //
    return new ListView.builder(

      //children: <Widget>[ChatBubble("assad")],
    );
  }
}
