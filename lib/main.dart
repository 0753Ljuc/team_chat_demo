import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:team_chat_demo/my_app.dart';
import 'package:team_chat_demo/providers/profile.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Profile()),
        // ChangeNotifierProvider(create: (_) => Chats()),
        // ChangeNotifierProvider(create: (_) => Contacts()),
      ],
      child: const MyApp(),
    ),
  );
}
