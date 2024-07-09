import 'package:flutter/material.dart';
import 'package:team_chat_demo/widgets/custom_router_observer.dart';
import 'package:team_chat_demo/widgets/custom_scaffold.dart';
import 'package:team_chat_demo/widgets/router_setting.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Demo App",
      home: CustomScaffold(),
      navigatorObservers: [CustomRouteObserver(context)],
      routes: appRoutes,
    );
  }
}
