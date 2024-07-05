import 'package:flutter/material.dart';
import 'package:team_chat_demo/common/utils.dart';
import 'package:team_chat_demo/contacts/widgets/contact_point.dart';

class Message {
  final DateTime time;
  final String text;
  final ContactPoint cp;

  Message(this.time, this.text, this.cp);

  factory Message.fromContact(
      ContactPoint contact, DateTime time, String text) {
    return Message(
      time,
      text,
      contact,
    );
  }
}

// ChatHistory widget
class ChatHistory extends StatelessWidget {
  final List<Message> messages;
  final ContactPoint me;
  final ScrollController scrollController;

  const ChatHistory(
      {super.key,
      required this.messages,
      required this.me,
      required this.scrollController});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: scrollController,
      itemCount: messages.length,
      itemBuilder: (context, index) {
        final message = messages[index];
        final isMe =
            message.cp.name == me.name && message.cp.avatar == me.avatar;
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (!isMe) message.cp.avatar,
              const SizedBox(width: 8.0),
              Expanded(
                child: Column(
                  crossAxisAlignment:
                      isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
                  children: [
                    Text(
                      getDisplayTime(message.time),
                      style: const TextStyle(
                        fontSize: 10.0,
                        color: Colors.grey,
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: isMe ? Colors.blue[100] : Colors.grey[200],
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: !isMe
                            ? CrossAxisAlignment.start
                            : CrossAxisAlignment.end,
                        children: [
                          Text(
                            message.text,
                            maxLines: 3,
                            style: const TextStyle(fontSize: 16.0),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8.0),
            ],
          ),
        );
      },
    );
  }
}
