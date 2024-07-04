import 'package:flutter/foundation.dart';
import 'package:team_chat_demo/chat/widgets/chat_history.dart';

class Chats with ChangeNotifier, DiagnosticableTreeMixin {
  final List<Message> _chats;

  Chats.withMessages(this._chats);

  List<Message> get chats => _chats;
}
