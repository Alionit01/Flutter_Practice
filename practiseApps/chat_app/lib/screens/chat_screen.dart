import 'package:flutter/material.dart';
import '../widgets/chat_bubble.dart';
import '../widgets/message_input.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final List<Map<String, dynamic>> _messages = [
    {'text': 'Hello! ', 'isMe': false},
    {'text': 'Hi there!', 'isMe': true},
    {'text': 'Welcome to BrownChat.', 'isMe': false},
    {'text': 'Thanks! Looks great.', 'isMe': true},
  ];

  void _handleSend(String message) {
    if (message.trim().isEmpty) return;
    setState(() {
      _messages.add({'text': message, 'isMe': true});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chatistan'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final msg = _messages[index];
                return ChatBubble(
                  message: msg['text'],
                  isMe: msg['isMe'],
                );
              },
            ),
          ),
          MessageInput(onSend: _handleSend),
        ],
      ),
    );
  }
}