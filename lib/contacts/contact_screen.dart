import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:team_chat_demo/contacts/widgets/contact_list.dart';
import 'package:team_chat_demo/contacts/widgets/contact_point.dart';
import 'package:team_chat_demo/providers/contacts.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<ContactPoint> list = context.read<Contacts>().contactList;
    return ContactList(list: list);
  }
}
