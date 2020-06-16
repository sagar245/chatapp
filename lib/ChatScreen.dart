import 'package:flutter/material.dart';
import 'package:flutterchatapp/chatmessage.dart';

class ChatScreen extends StatefulWidget{
  @override
  ChatScreenState createState() => new ChatScreenState();
}

class ChatScreenState extends State<ChatScreen>{
  final TextEditingController _textEditingController=new TextEditingController();
  final List<chatmessage> _messages =<chatmessage>[];
  void _handleSubmitted( String text){
    _textEditingController.clear();
    chatmessage message=new chatmessage(
      text: text,
    );
    setState(() {
      _messages.insert(0, message);
    });
  }
  Widget _textComposerWidget(){
    return new IconTheme(
      data: new IconThemeData(
        color: Colors.blue
      ),
      child: new Container(
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        child: new Row(
          children: <Widget>[
            new Flexible(
              child: new TextField(
                decoration: new InputDecoration.collapsed(hintText: "Send a message"),
                controller: _textEditingController,
                onSubmitted: _handleSubmitted,
              ),

            ),
            new Container(
             margin: const EdgeInsets.symmetric(horizontal: 4.0),
              child: new IconButton(icon: new Icon(Icons.send), onPressed: () =>_handleSubmitted(_textEditingController.text)),
            )
          ],
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
     return new Column(
       children: <Widget>[
         new Flexible(child: new ListView.builder(
           padding: new EdgeInsets.all(8.0),
           reverse: true,
           itemBuilder: (_,int index) =>_messages[index],
           itemCount: _messages.length,
         ),
         ),
         new Divider(
             height: 1.0),
         new Container(
           decoration: new BoxDecoration(
             color: Theme.of(context).cardColor,
           ),
           child: _textComposerWidget(),
         )
       ],
     );
  }
}