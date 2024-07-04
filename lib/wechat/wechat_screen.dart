import 'package:flutter/material.dart';
import 'package:team_chat_demo/wechat/widgets/chat_item.dart';
import 'package:team_chat_demo/wechat/widgets/chat_list.dart';

class WechatScreen extends StatelessWidget {
  WechatScreen({super.key});

  final List<ChatItem> list = List<ChatItem>.generate(
      100, (i) => ChatItem(icon: Icons.adaptive, title: 'item ${i}'));

  @override
  Widget build(BuildContext context) {
    return ChatList(list: list);
  }
}
