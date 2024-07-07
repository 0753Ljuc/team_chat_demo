import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:team_chat_demo/screens/contacts/widgets/contact_point.dart';
import 'package:team_chat_demo/modals/profile.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ContactPoint me = context.watch<Profile>().me;

    return Container(
      decoration: const BoxDecoration(
          border: Border(
              bottom: BorderSide(
                  width: 1, color: Color.fromRGBO(166, 166, 166, .4)))),
      width: double.infinity,
      height: 80,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            flex: 0,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: me.avatar.backgroundColor,
              ),
              width: 60,
              height: 60,
              child: Center(child: me.avatar.child),
            ),
          ),
          Expanded(
            flex: 0,
            child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: SizedBox(
                    height: 60,
                    child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Expanded(
                              flex: 0,
                              child: Text(
                                me.name,
                                style: const TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              )),
                          const Expanded(
                              flex: 0,
                              child: Text(
                                "this guy is very very good!!!",
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Color.fromRGBO(55, 55, 55, .6)),
                              )),
                        ],
                      ),
                    ))),
          ),
        ],
      ),
    );
  }
}
