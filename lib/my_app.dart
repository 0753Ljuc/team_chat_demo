import 'package:flutter/material.dart';
import 'package:team_chat_demo/widgets/custom_scaffold.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Demo App",
      home: CustomScaffold(),
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   return MaterialApp(
  //     title: "Test Drive",
  //     home: const HomePage(),
  //     routes: {
  //       '/': (context) => const HomePage(),
  //     },
  //   );
  // }
}
