import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:team_chat_demo/common/utils.dart';
import 'package:team_chat_demo/my_app.dart';
import 'package:team_chat_demo/providers/chats.dart';
import 'package:team_chat_demo/providers/contacts.dart';
import 'package:team_chat_demo/providers/profile.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Profile()),
        ChangeNotifierProvider(create: (_) => Contacts()),
        ChangeNotifierProvider(
            create: (context) =>
                Chats.withMessages(injectMessageIntoContactPoints(context))),
      ],
      child: const MyApp(),
    ),
  );
}
