import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:team_chat_demo/chat/widgets/chat_history.dart';
import 'package:team_chat_demo/contacts/widgets/contact_point.dart';
import 'package:team_chat_demo/providers/profile.dart';

class ChatScreen extends StatefulWidget {
  final ContactPoint contact;
  const ChatScreen({super.key, required this.contact});

  @override
  State<ChatScreen> createState() => _ChatScreen();
}

class _ChatScreen extends State<ChatScreen> {
  late List<Message> messages;
  late ContactPoint me;
  Timer? _timer;
  final TextEditingController _controller = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    me = context.read<Profile>().me;
    messages = generateMessages(widget.contact, me);
  }

  void _handleSubmitted(String text) {
    _controller.clear();
    setState(() {
      if (text.isNotEmpty) {
        messages.add(Message.fromContact(me, DateTime.now(), text));
        _scrollToBottom();
        if (_timer != null) {
          _timer!.cancel();
        }
        _timer = Timer(const Duration(seconds: 2), () {
          setState(() {
            messages.add(Message.fromContact(widget.contact, DateTime.now(),
                "Sorry, I am leaving, will back soon"));
            _scrollToBottom();
          });
        });
      }
    });
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeOut,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.contact.name),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
              child: ChatHistory(
            messages: messages,
            me: me,
            scrollController: _scrollController,
          )),
          const Divider(
            height: 1.0,
            color: Color.fromRGBO(233, 233, 233, .8),
          ),
          Container(
            child: _buildTextComposer(),
          ),
        ],
      ),
    );
  }

  Widget _buildTextComposer() {
    return IconTheme(
      data: const IconThemeData(color: Colors.teal),
      child: Container(
        color: const Color.fromRGBO(222, 222, 222, .4),
        padding: const EdgeInsets.symmetric(horizontal: 36),
        child: Row(
          children: <Widget>[
            Flexible(
                child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4.0),
                  color: Colors.white),
              padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
              child: TextField(
                controller: _controller,
                onSubmitted: _handleSubmitted,
                decoration: const InputDecoration.collapsed(
                  hintText: 'Send a message',
                ),
                textInputAction: TextInputAction.send,
                onEditingComplete: () {
                  _handleSubmitted(_controller.text);
                },
              ),
            )),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 4.0),
              child: IconButton(
                icon: const Icon(Icons.send),
                onPressed: () => _handleSubmitted(_controller.text),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

List<Message> generateMessages(ContactPoint contact, ContactPoint self) {
  return [
    Message.fromContact(contact, DateTime(2024, 5, 6, 17, 30), "Hello!"),
    Message.fromContact(self, DateTime(2024, 5, 6, 17, 31), "Hi, bro"),
    Message.fromContact(
        contact, DateTime(2024, 5, 6, 17, 33), "I am missing you !!!"),
  ];
}
