import 'dart:math';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body: Container(
      color: Colors.amber,
      width: 450.00,
      height: 350.0,
      padding: EdgeInsets.all(20.00),
      alignment: Alignment.center,
      child: Text(
      "boring",
      style: TextStyle(fontSize: 40.0,),
      ),
    ),
        );
  }
}
