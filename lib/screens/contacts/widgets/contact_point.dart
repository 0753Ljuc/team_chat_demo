import 'package:flutter/material.dart';
import 'package:team_chat_demo/screens/chat/widgets/chat_history.dart';

class ContactPoint {
  final CircleAvatar avatar;
  final String name;
  List<Message> chatHistory;
  int unreadCounts = 0;

  ContactPoint(this.avatar, this.name) : chatHistory = [];
  ContactPoint.withHistory(this.avatar, this.name, this.chatHistory);
}
