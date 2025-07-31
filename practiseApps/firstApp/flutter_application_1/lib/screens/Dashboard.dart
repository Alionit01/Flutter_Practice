import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
         appBar: AppBar(
            title: Text("Dashboard"),
            backgroundColor: Colors.blueGrey,
         ),
         body: Center(
            child: Text.rich(
               TextSpan(text: "The",
               children: [
                  TextSpan(text: "Ali", style: TextStyle(fontSize: 50.0, fontWeight: FontWeight.bold)),
                  TextSpan(text: "App", style: TextStyle(fontSize: 30.0, color: Colors.amber[400])),
               ]
               )
            ),
         ),
        );
  }
}