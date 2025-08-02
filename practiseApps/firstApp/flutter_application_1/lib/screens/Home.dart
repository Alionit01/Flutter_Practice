import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home"), ),
      body: Container(
       child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              Icon(Icons.phone, size: 35.00,),
              Text("Phone"),
            ],
          ),
          Column(
            children: [
              Icon(Icons.card_travel, size: 35.00,),
              Text("Cart"),
            ],
          ),
          Column(
            children: [
              Icon(Icons.share, size: 35.00,),
              Text("Share"),
            ],
          ),
        ],
       ),
      ),
    );
  }
}
