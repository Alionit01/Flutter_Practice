import 'package:flutter/material.dart';
import 'package:plantio/screens/dashboard/dashboard.dart';
import 'package:plantio/screens/onboarding/onBoarding.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const Onboarding(),
    );
  }
}
