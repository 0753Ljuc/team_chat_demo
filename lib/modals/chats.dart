import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:team_chat_demo/screens/chat/widgets/chat_history.dart';
import 'package:team_chat_demo/screens/contacts/widgets/contact_point.dart';

class Chats with ChangeNotifier, DiagnosticableTreeMixin {
  final List<Message> _chats;
  final BuildContext context;
  Timer? _timer;

  Chats.withMessages(this._chats, this.context);

  List<Message> get chats => _chats;

  int _findChatIndexByContact(ContactPoint cp) {
    return _chats.indexWhere((v) => v.cp == cp);
  }

  void insertNewChat(Message msg) {
    msg.cp.unreadCounts += 1;
    int existingCPIndex = _findChatIndexByContact(msg.cp);
    if (existingCPIndex != -1) {
      _chats.removeAt(existingCPIndex);
    }
    _chats.insert(0, msg);
    notifyListeners();
  }

  void insertNewChatFromMe(ContactPoint cp, Message msg) {
    int existingCPIndex = _findChatIndexByContact(cp);
    if (existingCPIndex != -1) {
      _chats.removeAt(existingCPIndex);
    }
    _chats.insert(0, Message.fromContact(cp, msg.time, msg.text));
    notifyListeners();
    _autoReply(cp);
  }

  void _autoReply(ContactPoint cp) {
    if (_timer != null) {
      _timer!.cancel();
    }
    const duration = Duration(seconds: 3);

    _timer = Timer(duration, () {
      var msg = Message.fromContact(
          cp, DateTime.now(), "Sorry, I am leaving, will back soon");
      cp.chatHistory.add(msg);
      insertNewChat(msg);
    });
  }

  void clearUnreadCounts(ContactPoint cp) {
    int existingCPIndex = _findChatIndexByContact(cp);
    if (existingCPIndex != -1) {
      _chats[existingCPIndex].cp.unreadCounts = 0;
    }
  }

  void forceUpdate() {
    notifyListeners();
  }
}
