import 'package:flutter/material.dart';
import 'package:team_chat_demo/wechat/widgets/chat_item.dart';

class ChatList extends StatelessWidget {
  const ChatList({super.key, required this.list});

  final List<ChatItem> list;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: const CircleAvatar(
            backgroundColor: Colors.black12,
          ),
          title: Text(list[index].title),
        );
      },
    );
  }
}
