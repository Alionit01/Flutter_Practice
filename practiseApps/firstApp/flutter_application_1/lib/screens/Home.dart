import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {},
          child: Text("Ali is the best"),
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.all(20.0),
            backgroundColor: Colors.amber,
            foregroundColor: Colors.black,
            fixedSize: Size(250, 50),
            textStyle: TextStyle(
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
            ),
            shape: BeveledRectangleBorder(),
          ),
        ),
      ),
    );
  }
}
