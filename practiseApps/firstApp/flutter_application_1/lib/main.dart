import 'package:flutter/material.dart';
import 'package:flutter_application_1/forms.dart';

void main() => runApp(Main());

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyForm()
    );
  }
}
