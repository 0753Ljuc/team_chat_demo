import 'package:flutter/material.dart';
import 'package:team_chat_demo/chat/widgets/chat_history.dart';
import 'package:team_chat_demo/common/utils.dart';

class ChatList extends StatelessWidget {
  const ChatList({super.key, required this.list});

  final List<Message> list;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (context, index) {
        Message item = list[index];
        return ListTile(
            leading: item.avatar,
            title: Text(item.name),
            subtitle: Text(item.text),
            trailing: Text(getDisplayTime(item.time)));
      },
    );
  }
}
