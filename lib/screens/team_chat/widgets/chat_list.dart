import 'package:flutter/material.dart';
import 'package:team_chat_demo/screens/chat/widgets/chat_history.dart';
import 'package:team_chat_demo/common/utils.dart';
import 'package:team_chat_demo/widgets/router_setting.dart';

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
              Navigator.pushNamed(
                context,
                chatScreenRoute,
                arguments: item.cp,
              );
            },
            leading: item.cp.unreadCounts == 0
                ? item.cp.avatar
                : Badge.count(
                    count: item.cp.unreadCounts,
                    child: item.cp.avatar,
                  ),
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
