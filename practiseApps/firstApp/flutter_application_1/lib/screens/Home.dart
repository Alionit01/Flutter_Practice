import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Stack"),
        centerTitle: true,
        backgroundColor: Colors.black38,
      ),
      backgroundColor: Colors.grey.shade800,
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: 300.0,
              height: 200,
              color: Colors.green,
            ),
             Positioned(
              bottom: 0.0,
               child: Container(
                width: 150.0,
                height: 100,
                color: Colors.yellow,
                           ),
             ),
            Container(
              width: 100.0,
              height: 75,
              color: Colors.redAccent,
            ),
          ],
        ),
      ),
    );
  }
}
