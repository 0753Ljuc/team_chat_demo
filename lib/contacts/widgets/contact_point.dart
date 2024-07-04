import 'package:flutter/material.dart';
import 'package:team_chat_demo/chat/widgets/chat_history.dart';

class ContactPoint {
  final CircleAvatar avatar;
  final String name;
  List<Message> chat_history;

  ContactPoint(this.avatar, this.name) : chat_history = [];
  ContactPoint.withHistory(this.avatar, this.name, this.chat_history);
}
