import 'package:flutter/material.dart';
import 'package:team_chat_demo/chat/chat_screen.dart';
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
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ChatScreen(
                            contact: item.cp,
                          )));
            },
            leading: item.cp.avatar,
            title: Text(
              item.cp.name,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
            subtitle: Text(
              item.text,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
            trailing: Text(getDisplayTime(item.time)));
      },
    );
  }
}
