import 'package:flutter/material.dart';
import 'package:team_chat_demo/common/utils.dart';
import 'package:team_chat_demo/contacts/widgets/contact_list.dart';
import 'package:team_chat_demo/contacts/widgets/contact_point.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ContactList(list: list);
  }
}

List<ContactPoint> list = nameList
    .map((name) => ContactPoint(
        CircleAvatar(
          backgroundColor: getRandomColor(),
          child: Text(mapSimplifiedName(name)),
        ),
        name))
    .toList();

List<String> nameList = [
  "Michael Johnson",
  "Emily Davis",
  "David Wilson",
  "Jessica Brown",
  "Chris Miller",
  "Sarah Moore",
  "Daniel Taylor",
  "Ashley Anderson",
  "Matthew Thomas",
  "Amanda Jackson",
  "Joshua White",
  "Jennifer Harris",
  "Andrew Martin",
  "Lauren Thompson",
  "Brandon Garcia",
  "Megan Martinez",
  "Kevin Lee",
  "Rachel Perez",
  "Sophia Hernandez",
  "Oliver Martinez",
  "Isabella Clark",
  "Liam Lewis",
  "Mia Robinson",
  "Noah Walker",
  "Ava Young",
  "Elijah Hall",
  "Emma Allen",
  "James King",
  "Charlotte Scott",
  "Benjamin Wright",
  "Amelia Green",
  "Lucas Baker",
  "Harper Nelson",
  "Henry Carter",
  "Evelyn Mitchell",
  "Alexander Perez",
  "Abigail Roberts",
  "Mason Turner",
  "Sofia Phillips",
  "Ethan Campbell",
  "Emily Parker",
  "Michael Evans",
  "Victoria Edwards",
  "Jackson Collins",
  "Grace Stewart",
  "Sebastian Sanchez",
  "Madison Morris",
  "Aiden Rogers",
  "Scarlett Reed",
  "Daniel Cook"
];
