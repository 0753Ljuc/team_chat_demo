import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:team_chat_demo/screens/contacts/widgets/contact_point.dart';
import 'package:team_chat_demo/modals/profile.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ContactPoint me = context.watch<Profile>().me;

    return Container(
      child: Row(
        children: <Widget>[
          Expanded(
            child: FittedBox(child: me.avatar),
          ),
          Expanded(
            child: Text('Deliver features faster', textAlign: TextAlign.center),
          ),
          Expanded(
            child: Text('Craft beautiful UIs', textAlign: TextAlign.center),
          ),
        ],
      ),
    );
  }
}
