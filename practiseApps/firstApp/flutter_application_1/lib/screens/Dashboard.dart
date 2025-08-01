import 'dart:math';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreen,
        body: Center(
          child: IconButton(
            icon: Icon(
              FontAwesomeIcons.boxesStacked
              ),
              onPressed: (){},
              iconSize: 100,
              color: Colors.lightGreenAccent,
              highlightColor: Colors.blueAccent,
          ),
        ),
        );
  }
}
