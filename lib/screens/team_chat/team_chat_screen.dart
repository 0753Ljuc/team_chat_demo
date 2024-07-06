import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:team_chat_demo/chat/widgets/chat_history.dart';
import 'package:team_chat_demo/modals/chats.dart';
import 'package:team_chat_demo/screens/team_chat/widgets/chat_list.dart';

class TeamChatScreen extends StatelessWidget {
  const TeamChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Message> list = context.watch<Chats>().chats;

    return ChatList(list: list);
  }
}
