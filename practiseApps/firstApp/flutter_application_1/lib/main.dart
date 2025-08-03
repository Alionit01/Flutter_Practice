import 'package:flutter/material.dart';

void main() => runApp(Main());

class Main extends StatelessWidget {
  const Main({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Home"),
          centerTitle: true,
        ),
        body: example(),
      ),
    );
  }
}

class example extends StatefulWidget {
  const example({super.key});

  @override
  State<example> createState() => _exampleState();
}

bool like = false;

class _exampleState extends State<example> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListTile(
          title: Text("Shoes"),
          trailing: IconButton(
            icon: like? (Icon(Icons.favorite)) : (Icon(Icons.favorite_border)) , 
          onPressed: (){
            setState(() {
               like = !like;
            });
          },),
        )
      ],
    );
  }
}