import 'package:flutter/material.dart';
import 'theme/app_theme.dart';
import 'screens/login_screen.dart';
import 'screens/chat_screen.dart';

void main() {
  runApp(const ChatApp());
}

class ChatApp extends StatelessWidget {
  const ChatApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chatistan',
      theme: AppTheme.brownTheme,
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginScreen(),
        '/chat': (context) => const ChatScreen(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
