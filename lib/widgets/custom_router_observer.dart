import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:team_chat_demo/modals/chats.dart';
import 'package:team_chat_demo/screens/contacts/widgets/contact_point.dart';
import 'package:team_chat_demo/widgets/router_setting.dart';

class CustomRouteObserver extends NavigatorObserver {
  final BuildContext context;
  int msgCounts = 0;

  CustomRouteObserver(this.context);

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPush(route, previousRoute);
    if (route.settings.name == chatScreenRoute &&
        previousRoute?.settings.name == homeRoute) {
      msgCounts = (route.settings.arguments as ContactPoint).chatHistory.length;
    }
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPop(route, previousRoute);
    if (route.settings.name == chatScreenRoute &&
        previousRoute?.settings.name == homeRoute) {
      var cp = route.settings.arguments as ContactPoint;
      if (msgCounts != cp.chatHistory.length) {
        cp.unreadCounts = 0;
      }
      msgCounts = 0;
      context.read<Chats>().forceUpdate();
    }
  }
}
