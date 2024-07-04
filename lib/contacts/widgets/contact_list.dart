import 'package:flutter/material.dart';
import 'package:team_chat_demo/chat/chat_screen.dart';
import 'package:team_chat_demo/contacts/widgets/contact_point.dart';

class ContactList extends StatelessWidget {
  const ContactList({super.key, required this.list});

  final List<ContactPoint> list;

  @override
  Widget build(BuildContext context) {
    Map<String, List<ContactPoint>> groupedContacts =
        getGroupedContactList(list);

    List<String> initials = groupedContacts.keys.toList()..sort();

    return ListView.builder(
      itemCount: initials.length,
      itemBuilder: (context, index) {
        String initial = initials[index];
        List<ContactPoint> group = groupedContacts[initial]!
          ..sort((a, b) => a.name.compareTo(b.name));
        return Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.fromLTRB(8, 8, 0, 8),
              color: const Color.fromRGBO(222, 222, 222, .8),
              child: Text(
                initial,
                style: const TextStyle(
                  fontSize: 10,
                ),
              ),
            ),
            Column(
                children: group.map((contact) {
              return ListTile(
                leading: contact.avatar,
                title: Text(contact.name),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ChatScreen(
                                contact: contact,
                              )));
                },
              );
            }).toList())
          ],
        );
      },
    );
  }
}

Map<String, List<ContactPoint>> getGroupedContactList(List<ContactPoint> list) {
  Map<String, List<ContactPoint>> groupedContacts = {};
  for (var contact in list) {
    String initial = contact.name[0];
    if (!groupedContacts.containsKey(initial)) {
      groupedContacts[initial] = [];
    }
    groupedContacts[initial]!.add(contact);
  }

  return groupedContacts;
}
