import 'package:flutter/material.dart';
import 'package:team_chat_demo/screens/chat/chat_screen.dart';
import 'package:team_chat_demo/screens/contacts/widgets/contact_point.dart';

const String homeRoute = '/';
const String chatScreenRoute = '/chatScreen';

// Define a map for your routes
final Map<String, WidgetBuilder> appRoutes = {
  chatScreenRoute: (context) => ChatScreen(
      contact: ModalRoute.of(context)!.settings.arguments as ContactPoint)
};
