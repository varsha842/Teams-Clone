import 'dart:async';

import 'package:flutter/material.dart';
import 'package:clone/sdk/connection.dart';
import 'package:clone/sdk/message_format.dart';
import 'package:clone/widget.dart/action_button.dart';

typedef SendMessageCallback = void Function(String text);

class ChatScreen extends StatelessWidget {
  final List<MessageFormat> messages;
  final SendMessageCallback onSendMessage;
  final TextEditingController textEditingController =
      new TextEditingController();
  final List<Connection> connections;
  final String userId;
  final String userName;
  final _scrollcontroller = ScrollController();

  ChatScreen({
    this.messages,
    this.onSendMessage,
    this.connections,
    this.userId,
    this.userName,
  });

  List<Widget> _buildMessages() {
    final nameMap = new Map<String, String>();
    this.connections.forEach((connection) {
      nameMap[connection.userId] = connection.name;
    });
    return messages
        .map((message) => ListTile(
              title: Text(
                nameMap.containsKey(message.userId)
                    ? nameMap[message.userId]
                    : (message.userId == userId ? userName : ''),
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                message.text,
                style: TextStyle(fontSize: 24),
              ),
              isThreeLine: true,
            ))
        .toList();
  }

  void onSendClick() {
    var text = textEditingController.text;
    if (text.trim() == '') return;
    onSendMessage(text);
  }

  @override
  Widget build(BuildContext context) {
    Timer(
      Duration(seconds: 1),
      () =>
          _scrollcontroller.jumpTo(_scrollcontroller.position.maxScrollExtent),
    );
    return Container(
      width: 100.0,
      child: Column(
        children: <Widget>[
          Center(
            child: Text(
              'Chat',
              style: TextStyle(
                color: Colors.black,
                fontSize: 32.0,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          Expanded(
            child: ListView(
              controller: _scrollcontroller,
              children: ListTile.divideTiles(
                context: context,
                tiles: _buildMessages(),
              ).toList(),
            ),
          ),
          Container(
            color: Colors.white,
            padding: EdgeInsets.all(10.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: TextFormField(
                    controller: textEditingController,
                    style: TextStyle(
                      fontSize: 20,
                    ),
                    decoration: InputDecoration(
                      hintStyle: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
                ElevatedButton(
                  child: Text('Send'),
                  style: ElevatedButton.styleFrom(
                      primary: Colors.blueGrey,
                      onPrimary: Colors.white,
                      elevation: 5,
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)))),
                  onPressed: onSendClick,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
