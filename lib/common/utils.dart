import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:team_chat_demo/chat/widgets/chat_history.dart';
import 'package:team_chat_demo/contacts/widgets/contact_point.dart';
import 'package:team_chat_demo/providers/contacts.dart';

Color getRandomColor() {
  Random random = Random();
  return Color.fromARGB(
    255,
    random.nextInt(200) + 56,
    random.nextInt(200) + 56,
    random.nextInt(200) + 56,
  );
}

String mapSimplifiedName(String name) {
  return name.split(" ").map((str) => str.characters.first).join(" ");
}

List<Message> injectMessageIntoContactPoints(BuildContext context) {
  var contacts = context.read<Contacts>();
  final startTime = DateTime(2024, 7, 0, 12, 0, 0);

  List<Message> newChats = [];

  for (var v in contacts.contactList.sublist(10, 15)) {
    var message = Message.fromContact(
        v,
        generateRandomTimeWithinDuration(startTime, const Duration(days: 4)),
        "Hello!");
    newChats.add(message);
    v.chat_history = [message];
  }

  return newChats..sort((a, b) => b.time.compareTo(a.time));
}

DateTime generateRandomTimeWithinDuration(
    DateTime startTime, Duration duration) {
  final random = Random();
  final totalSeconds = duration.inSeconds;
  final randomSeconds = random.nextInt(totalSeconds);
  return startTime.add(Duration(seconds: randomSeconds));
}

String getDisplayTime(DateTime time) {
  String str = time.toLocal().toString();
  return str.substring(0, str.length - 4);
}
