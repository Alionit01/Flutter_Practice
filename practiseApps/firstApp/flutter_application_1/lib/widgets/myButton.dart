import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final VoidCallback onPress;

  const MyButton({super.key, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        minimumSize: const Size(200, 50),
      ),
      onPressed: onPress,
      child: const Text(
        "Submit",
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }
}
