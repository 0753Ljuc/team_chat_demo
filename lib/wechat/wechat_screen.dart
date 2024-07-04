import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:team_chat_demo/chat/widgets/chat_history.dart';
import 'package:team_chat_demo/providers/chats.dart';
import 'package:team_chat_demo/wechat/widgets/chat_list.dart';

class WechatScreen extends StatelessWidget {
  const WechatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Message> list = context.read<Chats>().chats;

    return ChatList(list: list);
  }
}
