import 'dart:math';

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
            child: Text("Random value: ${getNumber()}")
         ),
        );
  }
}
//easy way
// int getNumber(){
//   Random random = new Random();
//   var number = random.nextInt(10);
//   return number;
// }
//better way
int getNumber(){return Random().nextInt(10);}