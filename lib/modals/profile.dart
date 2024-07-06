import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:team_chat_demo/screens/contacts/widgets/contact_point.dart';

class Profile with ChangeNotifier, DiagnosticableTreeMixin {
  final ContactPoint _me = ContactPoint(
      const CircleAvatar(
        backgroundColor: Colors.deepOrange,
        child: Text("T H"),
      ),
      "Topman Huang");

  ContactPoint get me => _me;

  void changeAvatar() {
    // todo: change avatar
    notifyListeners();
  }

  void changeName() {
    // todo: change name
    notifyListeners();
  }
}
