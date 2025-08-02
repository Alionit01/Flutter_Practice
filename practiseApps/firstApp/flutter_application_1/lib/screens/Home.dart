import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        leading: IconButton(onPressed: (){}, icon: Icon(Icons.menu)),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.card_travel)),
          IconButton(onPressed: (){}, icon: Icon(Icons.search)),
          IconButton(onPressed: (){}, icon: Icon(Icons.menu_book)),
        ],
      ),
      body: Center(
       child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("App Bar", style: TextStyle(fontSize: 22.0),),
          Text("Ali yoyo", style: TextStyle(fontWeight: FontWeight.bold),),
        ],
       ),
      ),
    );
  }
}
