import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:team_chat_demo/chat/widgets/chat_history.dart';
import 'package:team_chat_demo/screens/contacts/widgets/contact_point.dart';
import 'package:team_chat_demo/modals/chats.dart';
import 'package:team_chat_demo/modals/profile.dart';

class ChatScreen extends StatefulWidget {
  final ContactPoint contact;
  const ChatScreen({super.key, required this.contact});

  @override
  State<ChatScreen> createState() => _ChatScreen();
}

class _ChatScreen extends State<ChatScreen> {
  late ContactPoint me;
  late final List<Message> messages;

  Timer? _timer;
  final TextEditingController _controller = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    messages = widget.contact.chat_history;
    me = context.read<Profile>().me;
  }

  void _autoReply() {
    if (_timer != null) {
      _timer!.cancel();
    }
    _timer = Timer(const Duration(seconds: 3), () {
      setState(() {
        var msg = Message.fromContact(widget.contact, DateTime.now(),
            "Sorry, I am leaving, will back soon");
        messages.add(msg);
        context.read<Chats>().insertNewChat(msg);
        _scrollToBottom();
      });
    });
  }

  void _handleSubmitted(String text) {
    _controller.clear();
    if (text.isNotEmpty) {
      setState(() {
        var msg = Message.fromContact(me, DateTime.now(), text);
        messages.add(msg);
        context.read<Chats>().insertNewChatFromMe(widget.contact, msg);
        _scrollToBottom();
        _autoReply();
      });
    }
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
  void dispose() {
    super.dispose();
    _timer?.cancel();
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
