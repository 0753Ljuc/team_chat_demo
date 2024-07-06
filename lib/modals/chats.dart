import 'package:flutter/foundation.dart';
import 'package:team_chat_demo/chat/widgets/chat_history.dart';
import 'package:team_chat_demo/screens/contacts/widgets/contact_point.dart';

class Chats with ChangeNotifier, DiagnosticableTreeMixin {
  List<Message> _chats;

  Chats.withMessages(this._chats);

  List<Message> get chats => _chats;

  void insertNewChat(Message msg) {
    int existingCPIndex = _chats.indexWhere((v) => v.cp == msg.cp);
    if (existingCPIndex != -1) {
      _chats.removeAt(existingCPIndex);
    }
    _chats.insert(0, msg);
    notifyListeners();
  }

  void insertNewChatFromMe(ContactPoint cp, Message msg) {
    int existingCPIndex = _chats.indexWhere((v) => v.cp == cp);
    if (existingCPIndex != -1) {
      _chats.removeAt(existingCPIndex);
    }
    _chats.insert(0, Message.fromContact(cp, msg.time, msg.text));
    notifyListeners();
  }
}
